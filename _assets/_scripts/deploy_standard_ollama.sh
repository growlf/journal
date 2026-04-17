#!/bin/bash
TARGET=$1
SSH_USER=$2
SSH_KEY=$3
SSH_PASS=$4

REMOTE_SSH="ssh -i $SSH_KEY -o StrictHostKeyChecking=no $SSH_USER@$TARGET"
REMOTE_SUDO="$REMOTE_SSH 'echo \"$SSH_PASS\" | sudo -S -p \"\" bash -c \""

echo "--- Standardizing $TARGET ---"

# 1. Cleanup: Kill existing services
$REMOTE_SUDO "systemctl stop ollama 2>/dev/null; systemctl disable ollama 2>/dev/null; snap stop ollama 2>/dev/null; snap remove ollama 2>/dev/null; docker stop ollama 2>/dev/null; docker rm ollama 2>/dev/null" "\""

# 2. Path Prep: Create host-binded model root
$REMOTE_SUDO "mkdir -p /usr/share/ollama/.ollama/models && chown -R 1000:1000 /usr/share/ollama/.ollama/models" "\""

# 3. Docker Launch: Host-binded and Restart-locked
$REMOTE_SUDO "docker run -d --name ollama --restart always -p 11434:11434 -v /usr/share/ollama/.ollama/models:/root/.ollama/models ollama/ollama:latest" "\""

echo "[+] $TARGET standardized on Docker."
