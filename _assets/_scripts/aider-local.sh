#!/bin/bash
# aider-local — Optimized Aider for Intel Arc (Docker SYCL Edition)

# Use the Dockerized Ollama endpoint as the 'Primary' choice.
# This endpoint is pre-baked with Intel SYCL/oneAPI optimizations.
OLLAMA_ENDPOINT="${OLLAMA_API_BASE:-http://localhost:11434}"

# Default model: Qwen 2.5 7B (Arc-optimized)
MODEL="${1:-qwen2.5:7b}"
shift # Remove the model name from arguments

# Check if the Docker container is running
if ! curl -s --max-time 2 "$OLLAMA_ENDPOINT/api/tags" 2>/dev/null | grep -q "$MODEL"; then
    echo "Warning: Model '$MODEL' not found on Ollama server at $OLLAMA_ENDPOINT."
    echo "Please ensure the 'ollama-arc' container is running and pull the model:"
    echo "  docker exec -it ollama-arc /usr/local/lib/python3.11/dist-packages/bigdl/cpp/libs/ollama/ollama pull $MODEL"
    exit 1
fi

echo "Connecting to Ollama (Intel Arc/SYCL Accelerated) at $OLLAMA_ENDPOINT..."

# Run Aider with native Ollama support
# We use 'ollama/' prefix for native integration.
aider \
    --model "ollama/$MODEL" \
    --no-auto-commits \
    --no-gitignore \
    "$@"
