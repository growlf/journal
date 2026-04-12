#!/bin/bash
# toggle-ai.sh — Master Manager for the NetYeti AI Engine (Intel Arc Edition)
# Simplifies management of the Primary (P) AI stack with a PACE-aware status check.

# --- CONFIGURATION ---
SERVICE_DIR="$HOME/Obsidian/Journal/Network/Services/Ollama"
CONTAINER_NAME="ollama-arc"
PRIMARY_MODEL="deepseek-r1:14b"
OLLAMA_PORT=11434
OLLAMA_URL="http://localhost:${OLLAMA_PORT}"

# --- HELPERS ---
function usage() {
    echo "Usage: toggle-ai.sh [start|stop|status|warm]"
    echo ""
    echo "  start   - Ignition: Starts the Docker AI engine (Intel SYCL optimized)"
    echo "  stop    - Shutdown: Powers down the stack to save resources"
    echo "  status  - Intelligence: Checks health, GPU offload, and model memory"
    echo "  warm    - Pre-load: Ensures '$PRIMARY_MODEL' is in the iGPU"
    exit 0
}

function check_handshake() {
    echo -n "Checking for Ollama API at ${OLLAMA_URL}..."
    local count=0
    until curl -s --max-time 2 "${OLLAMA_URL}/api/tags" 2>/dev/null | grep -q "models"; do
        sleep 2; echo -n "."; ((count++))
        if [[ $count -gt 10 ]]; then echo " TIMEOUT (check Docker logs)"; return 1; fi
    done
    echo " READY!"
    
    echo "Verifying Intel Arc/SYCL Acceleration..."
    if docker logs "$CONTAINER_NAME" 2>&1 | grep -Eiq "level_zero|SYCL|XPU"; then
        echo "[SUCCESS] Intel Arc Handshake Verified."
    else
        echo "[WARNING] No GPU handshake found in Docker logs. Check /dev/dri permissions."
    fi
}

function warm_model() {
    echo "Warming up model: $PRIMARY_MODEL..."
    curl -s "${OLLAMA_URL}/api/generate" -d "{\"model\":\"$PRIMARY_MODEL\",\"prompt\":\"hello\",\"stream\":false}" -o /dev/null
    echo "Model loaded and standing by in memory."
}

function get_vram_info() {
    # Uses jq for precision if available, fallback to basic text if not.
    if command -v jq >/dev/null 2>&1; then
        curl -s "${OLLAMA_URL}/api/ps" | jq -r '.models[]? | "- \( .name ): \( (.size_vram / 1073741824) | tonumber | . * 100 | round / 100 ) GB VRAM"'
    else
        echo " (Install 'jq' for detailed VRAM stats)"
        curl -s "${OLLAMA_URL}/api/ps" | grep -oP '"name":"[^"]+"' | cut -d'"' -f4
    fi
}

# --- MAIN LOGIC ---
case "$1" in
    start)
        echo "Launching the Primary (P) AI Command Center (Intel Arc Docker)..."
        # Stop Systemd version first to prevent port conflict
        if systemctl is-active --quiet ollama; then
            echo "[PACE] Deactivating Systemd (Alternate) to allow Docker (Primary)..."
            sudo systemctl stop ollama
        fi
        
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
        echo "--- AI Engine Intelligence Report ---"
        # 1. Docker (Primary) Status
        if docker ps --filter "name=$CONTAINER_NAME" --format "{{.Status}}" | grep -q "Up"; then
            echo "[PRIMARY] Docker Engine: ACTIVE ($(docker ps --filter "name=$CONTAINER_NAME" --format "{{.Status}}"))"
            get_vram_info
        else
            echo "[PRIMARY] Docker Engine: INACTIVE"
        fi

        # 2. Systemd (Alternate) Status
        if systemctl is-active --quiet ollama; then
            echo "[ALTERNATE] Systemd Service: ACTIVE"
            get_vram_info
        else
            echo "[ALTERNATE] Systemd Service: INACTIVE"
        fi

        # 3. Connection Check
        if curl -s --max-time 1 "${OLLAMA_URL}/api/tags" > /dev/null; then
            echo "API Status: Connected (Port $OLLAMA_PORT)"
        else
            echo "API Status: UNREACHABLE"
        fi
        ;;
    
    warm)
        warm_model
        ;;
    
    *)
        usage
        ;;
esac
