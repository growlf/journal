#!/bin/bash
# aider-local — Optimized Aider for Intel Arc (SYCL Edition)

# Use Qwen 2.5 Coder 7B by default for best performance-to-quality ratio on Arc.
MODEL="${1:-qwen2.5-coder-7b.gguf}"
shift # Remove the model name from arguments

# Check if the SYCL server is running
if ! curl -s --max-time 2 http://localhost:8081/health 2>/dev/null | grep -q "ok"; then
    echo "Warning: SYCL server (llama-serve.service) is not running on port 8081."
    echo "Please run: toggle-ai.sh openclaw"
    exit 1
fi

# Run Aider with the correct OpenAI-compatible backend
# Note: Use the 'openai/' prefix to tell Aider to use the OpenAI API.
aider \
    --model "openai/$MODEL" \
    --openai-api-base "http://localhost:8081/v1" \
    --openai-api-key "local" \
    --no-auto-commits \
    --no-gitignore \
    "$@"
