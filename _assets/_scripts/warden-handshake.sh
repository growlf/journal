#!/bin/bash
# Warden Handshake - NetYeti Power
# Fast, efficient backlog report for session startup.

VAULT_ROOT="~/Obsidian/Journal"
SCRIPT_PATH="$VAULT_ROOT/_assets/_scripts/manage-backlog.py"

# Ensure dependencies are available
if ! command -v python3 &> /dev/null; then
    echo "[!] Error: python3 not found."
    exit 1
fi

# Run the optimized backlog manager
# We use -u to force unbuffered output so the user sees progress
python3 -u "$SCRIPT_PATH"
