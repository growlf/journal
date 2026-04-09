#!/bin/bash
# toggle-ai.sh — Master Manager for the NetYeti AI Engine (Intel Arc Edition)
# Simplifies management of the Primary (P) AI stack.

SERVICE_DIR="$HOME/Obsidian/Journal/Network/Services/Ollama"
CONTAINER_NAME="ollama-arc"
PRIMARY_MODEL="deepseek-r1:14b"

function usage() {
    echo "Usage: toggle-ai.sh [start|stop|status|warm]"
    echo ""
    echo "  start   - Ignition: Starts the Docker AI engine"
    echo "  stop    - Shutdown: Powers down the stack to save resources"
    echo "  status  - Intelligence: Checks container health and GPU offload"
    echo "  warm    - Pre-load: Ensures '$PRIMARY_MODEL' is in the iGPU"
    exit 1
}

function check_handshake() {
    echo -n "Waiting for Ollama API at localhost:11434"
    until curl -s --max-time 2 http://localhost:11434/api/tags 2>/dev/null | grep -q "models"; do
        sleep 2; echo -n "."
    done
    echo " ready!"
    
    echo "Verifying SYCL GPU Acceleration..."
    if docker logs "$CONTAINER_NAME" 2>&1 | grep -Eiq "level_zero|SYCL|XPU"; then
        echo "[SUCCESS] Intel Arc Handshake Verified."
    else
        echo "[WARNING] No GPU handshake found. Check /dev/dri permissions."
    fi
}

function warm_model() {
    echo "Warming up $PRIMARY_MODEL..."
    curl -s http://localhost:11434/api/generate -d "{\"model\":\"$PRIMARY_MODEL\",\"prompt\":\"hello\",\"stream\":false}" -o /dev/null
    echo "Model loaded and ready for action."
}

case "$1" in
    start)
        echo "Launching the AI Command Center..."
        cd "$SERVICE_DIR" && docker compose up -d
        check_handshake
        warm_model
        ;;
    stop)
        echo "Shutting down the engine..."
        cd "$SERVICE_DIR" && docker compose down
        echo "Done. VRAM released."
        ;;
    status)
        docker ps --filter "name=$CONTAINER_NAME"
        echo ""
        echo "Active Models in Memory:"
        curl -s http://localhost:11434/api/ps | python3 -c "import sys, json; [print(f'- {m[\"name\"]}: {m[\"size_vram\"]/(1024**3):.2f} GB') for m in json.load(sys.stdin).get('models', [])]"
        ;;
    warm)
        warm_model
        ;;
    *)
        usage
        ;;
esac
