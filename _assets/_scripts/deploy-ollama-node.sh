#!/bin/bash
# deploy-ollama-node.sh - Full automation for drafting a new node into the Council of LLMs.
# Authored by Sentinel for the NetYeti Forest.
# MANDATE: All secrets injected via Bitwarden CLI.

TARGET_HOST=$1

if [ -z "$TARGET_HOST" ]; then
    echo "Usage: $0 [target_host_alias]"
    exit 1
fi

# Fetch credentials from Bitwarden
# Expects an active BW_SESSION
echo "[*] Authenticating with the Vault..."
SUDO_PASS=$(bw get item "workstation keys" | jq -r '.login.password')

if [ -z "$SUDO_PASS" ] || [ "$SUDO_PASS" == "null" ]; then
    echo "[-] FAILED: Could not retrieve password from Bitwarden. Is your BW_SESSION active?"
    exit 1
fi

echo "--- [1/5] INITIALIZING REMOTE INFRASTRUCTURE: $TARGET_HOST ---"
ssh "$TARGET_HOST" << REMOTE
    echo "$SUDO_PASS" | sudo -S apt-get update
    echo "$SUDO_PASS" | sudo -S apt-get install -y docker.io docker-compose-v2 rsync curl
    echo "$SUDO_PASS" | sudo -S usermod -aG docker \$USER
REMOTE

echo "--- [2/5] DEPLOYING OLLAMA CONFIGURATION ---"
ssh "$TARGET_HOST" << REMOTE
    mkdir -p ~/ollama
    cat << 'EOF' > ~/ollama/docker-compose.yml
services:
  ollama:
    image: ollama/ollama:latest
    container_name: ollama-igpu
    devices:
      - /dev/dri:/dev/dri
    volumes:
      - ollama_data:/root/.ollama
    ports:
      - "11434:11434"
    restart: always

volumes:
  ollama_data:
EOF
    cd ~/ollama && echo "$SUDO_PASS" | sudo -S docker compose up -d
REMOTE

echo "--- [3/5] INSTALLING TRANSPARENT CLI WRAPPER ---"
ssh "$TARGET_HOST" << REMOTE
    echo '#!/bin/bash
if [ -t 0 ]; then TTY_FLAG="-it"; else TTY_FLAG="-i"; fi
docker exec \$TTY_FLAG ollama-igpu ollama "\$@"' | sudo tee /usr/local/bin/ollama > /dev/null
    sudo chmod +x /usr/local/bin/ollama
    echo "[+] Transparent CLI wrapper installed at /usr/local/bin/ollama"
REMOTE

echo "--- [4/5] LAN-OPTIMIZED MODEL INJECTION ---"
# Call the specialized sync script
/home/gemini/_assets/_scripts/sync-ollama-models.sh "$TARGET_HOST"

echo "--- [5/5] FINAL SIGNAL VERIFICATION ---"
sleep 5
ssh "$TARGET_HOST" "ollama list" | grep -q "NAME" && echo "[+] PEER ONLINE: $TARGET_HOST is successfully drafted into the Council." || echo "[-] SIGNAL WEAK: Verification failed on $TARGET_HOST."
