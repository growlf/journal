#!/bin/bash
TARGET=$1
SSH_USER=$2
SSH_KEY=$3
SSH_PASS=$4

REMOTE_SSH="ssh -i $SSH_KEY -o StrictHostKeyChecking=no $SSH_USER@$TARGET"
REMOTE_SUDO="$REMOTE_SSH 'echo \"$SSH_PASS\" | sudo -S -p \"\" bash -c \""

echo "--- Deploying Sidecar to $TARGET ---"

# 1. Cleanup: Kill existing sidecar
$REMOTE_SUDO "docker stop yeti-sidecar 2>/dev/null; docker rm yeti-sidecar 2>/dev/null" "\""

# 2. Build/Transfer logic (Simple: Send script and use Python container directly)
scp -i $SSH_KEY -o StrictHostKeyChecking=no /home/gemini/AI_Stack/scripts/yeti_sidecar.py $SSH_USER@$TARGET:/tmp/yeti_sidecar.py

# 3. Launch Sidecar: Host-Binded Root and Restart-locked
# Mounting host root to /host allows the container to participate in the host filesystem.
$REMOTE_SUDO "docker run -d --name yeti-sidecar --restart always -p 11435:11435 -v /:/host --privileged python:3.11-slim bash -c 'pip install fastapi uvicorn pydantic httpx && python /tmp/yeti_sidecar.py'" "\""

echo "[+] $TARGET sidecar ACTIVE on port 11435."
