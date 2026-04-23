#!/bin/bash

# offload_tasks.sh - Wrapper for parallel_ollama.py
# Usage: ./offload_tasks.sh <tasks_json_file>

VENV_PYTHON="~/Sandbox/AI_Stack/.venv/bin/python3"
SCRIPT_PATH="~/Obsidian/Journal/_assets/_scripts/parallel_ollama.py"

if [ -z "$1" ]; then
    echo "Usage: $0 <tasks_json_file>"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: File $1 not found."
    exit 1
fi

$VENV_PYTHON $SCRIPT_PATH "$1"
