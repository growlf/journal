#!/bin/bash
# NetYeti Power: Ollama Herd Sync (Portable)
# Synchronizes models across the distributed AI swarm using rsync and LAN.

# --- Config ---
ALL_NODES=("phoenix" "gemini" "nuk1" "lab1" "lab2" "lab3" "lab4")
HOSTNAME=$(hostname)

# Mapping of nodes to their local model paths
declare -A PATHS
PATHS["phoenix"]="/home/netyeti/.ollama/models"
PATHS["gemini"]="/home/gemini/.ollama/models"
PATHS["nuk1"]="/home/netyeti/.ollama/models"
PATHS["lab1"]="/usr/share/ollama/.ollama/models"
PATHS["lab2"]="/usr/share/ollama/.ollama/models"
PATHS["lab3"]="/usr/share/ollama/.ollama/models"
PATHS["lab4"]="/usr/share/ollama/.ollama/models"

# Detect our local path
LOCAL_MODELS=${PATHS[$HOSTNAME]}

# If we are on a node not in the map, default to common paths
if [[ -z "$LOCAL_MODELS" ]]; then
    if [[ -d "/home/netyeti/.ollama/models" ]]; then
        LOCAL_MODELS="/home/netyeti/.ollama/models"
    elif [[ -d "/home/gemini/.ollama/models" ]]; then
        LOCAL_MODELS="/home/gemini/.ollama/models"
    else
        LOCAL_MODELS="/usr/share/ollama/.ollama/models"
    fi
fi

echo "[Signal] Starting Ollama Herd Sync (Gestalt Synchronization) on $HOSTNAME..."

# 1. Pull from everyone else to this node (The Aggregator/Sync point)
for node in "${ALL_NODES[@]}"; do
    if [[ "$node" == "$HOSTNAME" ]]; then continue; fi
    echo "--- Pulling from $node ---"
    
    REMOTE_PATH="${PATHS[$node]}"
    # Bidirectional sync via --update: data travels from node -> this node
    # Use -u (--update) to avoid overwriting newer models with older ones
    # Use -a (--archive) to preserve timestamps and permissions
    # Use --progress to show transfer speed
    # Note: Using trailing slashes for rsync directory semantics
    rsync -uaz --progress "$node:$REMOTE_PATH/" "$LOCAL_MODELS/"
done

# 2. Push back to everyone else (The Distribution)
for node in "${ALL_NODES[@]}"; do
    if [[ "$node" == "$HOSTNAME" ]]; then continue; fi
    echo "--- Pushing to $node ---"

    REMOTE_PATH="${PATHS[$node]}"
    # Push from this node back to the node
    rsync -uaz --progress "$LOCAL_MODELS/" "$node:$REMOTE_PATH/"
done

echo "[Signal] Herd Synchronization Complete. All nodes are now in parity."
