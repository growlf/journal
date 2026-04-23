#!/bin/bash
# NetYeti Power: ARC GPU Device Discovery
# Detects if Intel Arc is on card0 or card1 and updates the Ollama service.

COMPOSE_PATH="~/Obsidian/Journal/Internal/Networks/Yeticraft/Services/AI-Stack/docker-compose.yml"

# Detect current card
CURRENT_CARD=$(ls /dev/dri/card* | head -n 1 | xargs basename)
echo "[Signal] Detected Intel Arc on: $CURRENT_CARD"

# Check what is currently in the compose file
CONFIG_CARD=$(grep -o "card[0-1]" "$COMPOSE_PATH" | head -n 1)

if [ "$CURRENT_CARD" != "$CONFIG_CARD" ]; then
    echo "[!] Warning: GPU Device Drift Detected ($CONFIG_CARD -> $CURRENT_CARD). Fixing..."
    sed -i "s/card[0-1]/$CURRENT_CARD/g" "$COMPOSE_PATH"
    echo "[+] docker-compose.yml updated. Restarting Ollama..."
    sudo systemctl restart ollama.service
else
    echo "[+] GPU Signal stable on $CURRENT_CARD."
fi
