#!/bin/bash

# Configuration
GATEWAY="_gateway"
PROXMOX_HOST="root@10.0.1.13"
JOURNAL_FILE="/home/gemini/Obsidian/journal/Dailies/2026-04-12.md"
OLLAMA_MODEL="llama3.1:latest"

# Create script directory if not exists
mkdir -p ~/AI_Stack/scripts

# Helper function for error handling
log_error() {
    echo "ERROR: $1" >&2
}

# 1. Pull MikroTik Data
echo ">>> Pulling MikroTik data..."
MIKROTIK_DATA=$(ssh -o ConnectTimeout=10 "$GATEWAY" "/ip/dhcp-server/lease/print detail; /ip/arp/print; /interface/monitor-traffic [find] once; /system/resource/print" 2>/dev/null)
if [ $? -ne 0 ]; then
    log_error "Failed to fetch MikroTik data."
    MIKROTIK_DATA="Failed to fetch MikroTik data."
fi

# 2. Pull Proxmox and Docker Swarm Data
echo ">>> Pulling Proxmox/Docker data..."
PROXMOX_DATA=$(ssh -o ConnectTimeout=10 "$PROXMOX_HOST" "pct list" 2>/dev/null)
if [ $? -ne 0 ]; then
    log_error "Failed to fetch Proxmox data."
    PROXMOX_DATA="Failed to fetch Proxmox data."
fi

DOCKER_DATA=$(ssh -o ConnectTimeout=10 "$PROXMOX_HOST" "pct exec 500 -- docker node ls; pct exec 500 -- docker service ls" 2>/dev/null)
if [ $? -ne 0 ]; then
    log_error "Failed to fetch Docker Swarm data from node 500."
    DOCKER_DATA="Failed to fetch Docker Swarm data from node 500."
fi

# 3. Analyze with Ollama
echo ">>> Generating report with Ollama ($OLLAMA_MODEL)..."
PROMPT="You are NetYeti, an expert network auditor. Analyze the following raw network and cluster data and generate a comprehensive 'NetYeti Intelligence Report' in Markdown format.

Include:
- Network Health (DHCP/ARP anomalies, Traffic)
- Resource Utilization (CPU/Memory)
- Cluster Status (LXC and Docker Swarm health)
- Actionable Insights

RAW DATA:
--- MikroTik ---
$MIKROTIK_DATA

--- Proxmox LXC ---
$PROXMOX_DATA

--- Docker Swarm ---
$DOCKER_DATA
"

# Create JSON payload using python3
PAYLOAD=$(python3 -c "import json, sys; print(json.dumps({'model': sys.argv[1], 'prompt': sys.argv[2], 'stream': False}))" "$OLLAMA_MODEL" "$PROMPT")

# Call Ollama API
RESPONSE=$(curl -s -X POST http://localhost:11434/api/generate -d "$PAYLOAD")

# Parse response using python3
REPORT=$(echo "$RESPONSE" | python3 -c "import json, sys;
try:
    print(json.load(sys.stdin).get('response', 'Error: No response from Ollama.'))
except Exception as e:
    print(f'Error: Could not parse Ollama response: {e}')")

# 4. Append to Obsidian Journal
echo ">>> Finalizing report..."
if [ ! -f "$JOURNAL_FILE" ]; then
    mkdir -p $(dirname "$JOURNAL_FILE")
    echo "# Daily Journal - $(date +%Y-%m-%d)" > "$JOURNAL_FILE"
fi

{
    echo -e "\n## NetYeti Intelligence Report - $(date +'%H:%M:%S')\n"
    echo "$REPORT"
    echo -e "\n### Extra resources and links"
    echo "- [MikroTik Public Network Status (Graphs)](http://10.0.1.1/graphs/)"
    echo -e "\n---"
} >> "$JOURNAL_FILE"

echo "Done. Report appended to $JOURNAL_FILE"
