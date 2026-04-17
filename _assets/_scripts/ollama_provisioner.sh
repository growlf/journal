#!/bin/bash
# ollama_provisioner.sh - Remote provisioning for native Ollama nodes.
# Part of the NetYeti AI Stack.

set -e

# --- Configuration & Arguments ---
TARGET_IP=""
SSH_USER=""
SSH_PASS=""
SSH_KEY=""
SYNC_FROM_HOST=false
MODELS=("llama3.1" "smollm")

usage() {
    echo "Usage: $0 --target-ip <IP> --user <USER> --key <KEY> [--password <PASS>] [--sync-from-host]"
    exit 1
}

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --target-ip) TARGET_IP="$2"; shift ;;
        --user) SSH_USER="$2"; shift ;;
        --key) SSH_KEY="$2"; shift ;;
        --password) SSH_PASS="$2"; shift ;;
        --sync-from-host) SYNC_FROM_HOST=true ;;
        *) echo "Unknown parameter: $1"; usage ;;
    esac
    shift
done

if [ -z "$TARGET_IP" ] || [ -z "$SSH_USER" ] || [ -z "$SSH_KEY" ]; then
    usage
fi

SSH_OPTS="-i $SSH_KEY -o StrictHostKeyChecking=no -o ConnectTimeout=10"
REMOTE_SSH="ssh $SSH_OPTS $SSH_USER@$TARGET_IP"

# Helper for remote sudo
remote_sudo() {
    local cmd="$1"
    if [ -n "$SSH_PASS" ]; then
        # Use -S for stdin password, -p '' to suppress prompt noise
        $REMOTE_SSH "echo \"$SSH_PASS\" | sudo -S -p '' bash -c \"$cmd\""
    else
        $REMOTE_SSH "sudo bash -c \"$cmd\""
    fi
}

echo "--- [Phase 1] ENVIRONMENT CHECK ---"
if ! $REMOTE_SSH "command -v zstd &> /dev/null && command -v curl &> /dev/null"; then
    echo "[+] Installing missing dependencies..."
    remote_sudo "apt-get update -y"
    remote_sudo "apt-get install -y zstd curl rsync"
else
    echo "[+] Dependencies found."
fi

echo "--- [Phase 2] INSTALLATION ---"
if ! $REMOTE_SSH "command -v ollama &> /dev/null"; then
    echo "[*] Executing official Ollama install script..."
    $REMOTE_SSH "curl -fsSL https://ollama.com/install.sh -o /tmp/install_ollama.sh"
    remote_sudo "sh /tmp/install_ollama.sh"
else
    echo "[+] Ollama already installed."
fi

echo "--- [Phase 3] SYSTEMD CONFIGURATION ---"
SERVICE_FILE="/etc/systemd/system/ollama.service"
if $REMOTE_SSH "[ -f $SERVICE_FILE ]"; then
    if ! $REMOTE_SSH "grep -q 'OLLAMA_HOST=0.0.0.0:11434' $SERVICE_FILE"; then
        echo "[+] Configuring OLLAMA_HOST=0.0.0.0 for LAN access..."
        remote_sudo "sed -i '/\[Service\]/a Environment=\"OLLAMA_HOST=0.0.0.0:11434\"' $SERVICE_FILE"
        remote_sudo "systemctl daemon-reload"
        remote_sudo "systemctl restart ollama"
    else
        echo "[+] OLLAMA_HOST already configured."
    fi
fi

echo "--- [Phase 4] MODEL SYNC ---"
if [ "$SYNC_FROM_HOST" = true ]; then
    echo "[*] Syncing models from host to $TARGET_IP..."
    SOURCE_MODELS="/home/gemini/.ollama/models"
    REMOTE_MODEL_PATH="/usr/share/ollama/.ollama/models"
    
    echo "[+] Preparing remote directory..."
    remote_sudo "mkdir -p $REMOTE_MODEL_PATH && chown -R $SSH_USER:$SSH_USER $REMOTE_MODEL_PATH"
    
    echo "[+] Transferring blobs via two-step upload..."
    $REMOTE_SSH "mkdir -p /tmp/ollama_models"
    # Note: Using glob expansion locally to push files
    scp -r $SSH_OPTS "$SOURCE_MODELS/"* "$SSH_USER@$TARGET_IP:/tmp/ollama_models/"
    
    echo "[+] Moving to final destination and fixing ownership..."
    remote_sudo "mv /tmp/ollama_models/* $REMOTE_MODEL_PATH/ && rm -rf /tmp/ollama_models && chown -R ollama:ollama $REMOTE_MODEL_PATH"
    echo "[+] Sync complete."
else
    echo "[*] Pulling standard models: ${MODELS[*]}"
    for model in "${MODELS[@]}"; do
        echo "[+] Pulling $model..."
        $REMOTE_SSH "ollama pull $model"
    done
fi

echo "--- [Phase 5] VERIFICATION ---"
echo "[*] Verifying API availability on $TARGET_IP:11434..."
max_retries=10
count=0
until curl -s --connect-timeout 2 "http://$TARGET_IP:11434/api/tags" | grep -q "models" || [ $count -eq $max_retries ]; do
    echo "[...] Waiting for Ollama API ($count/$max_retries)..."
    sleep 5
    ((count++))
done

if [ $count -eq $max_retries ]; then
    echo "[-] FAILED: Ollama API is not responding on $TARGET_IP."
    exit 1
else
    echo "[+] SUCCESS: Ollama is provisioned and listening on $TARGET_IP:11434."
    $REMOTE_SSH "ollama list"
fi
