#!/bin/bash
# toggle-ai.sh — The Universal AI Switch for Intel Arc (SYCL Edition)
# Manages the llama-serve.service and user workflows.

SERVICE="llama-serve.service"
MODEL_DIR="$HOME/models"
MODEL_CODER="qwen2.5-coder-7b.gguf"
MODEL_LLAMA="llama3.1-8b.gguf"
MODEL_QWEN="qwen2.5-7b.gguf"

function usage() {
    echo "Usage: toggle-ai.sh [openclaw|shell|status|stop]"
    echo ""
    echo "  openclaw  - Start llama-serve with Qwen 2.5 Coder 7B (Arc-optimized)"
    echo "  shell     - Start llama-serve with Llama 3.1 8B (Arc-optimized)"
    echo "  status    - Check status of AI services"
    echo "  stop      - Shut down all AI services"
    exit 1
}

function start_service() {
    local model="$1"
    if [ ! -f "$MODEL_DIR/$model" ]; then
        echo "Error: Model file $MODEL_DIR/$model not found."
        echo "Please run model-sync.sh first."
        exit 1
    fi

    echo "Switching to model: $model"
    # Update the service's environment for the specific model
    systemctl --user set-environment LLAMA_MODEL="$MODEL_DIR/$model"
    systemctl --user restart "$SERVICE"

    echo -n "Waiting for SYCL server on port 8081"
    until curl -s --max-time 2 http://localhost:8081/health 2>/dev/null | grep -q "ok"; do
        sleep 2; echo -n "."
    done
    echo " ready!"
}

case "$1" in
    openclaw)
        start_service "$MODEL_CODER"
        echo "Starting OpenClaw..."
        # Add your OpenClaw start command here if applicable
        ;;
    shell)
        start_service "$MODEL_LLAMA"
        echo "Shell mode active (aigpu-sys will now use Llama 3.1 8B)."
        ;;
    status)
        systemctl --user status "$SERVICE" --no-pager
        echo ""
        echo "Ollama (Legacy/Contingency):"
        systemctl status ollama --no-pager | head -n 5
        ;;
    stop)
        echo "Stopping llama-serve.service..."
        systemctl --user stop "$SERVICE"
        echo "Done."
        ;;
    *)
        usage
        ;;
esac
