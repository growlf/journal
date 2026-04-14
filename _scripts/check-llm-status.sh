#!/bin/bash
# check-llm-status.sh — NetYeti Signal Report Utility

# Colors for PACE status
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
NC='\033[0m' # No Color

echo -e "${BLUE}📡 NetYeti LLM Signal Report${NC}"
echo -e "Date: $(date)"
echo "----------------------------------------"

# 1. Primary (P): Local Ollama (Port 11434)
if curl -s --max-time 1 http://localhost:11434/api/tags > /dev/null; then
    MODELS=$(curl -s http://localhost:11434/api/tags | python3 -c "import sys, json; m=json.load(sys.stdin).get('models', []); print(', '.join([i['name'] for i in m[:3]]))")
    echo -e "[${GREEN}P${NC}] Primary (Local):  ${GREEN}ACTIVE${NC} (Port 11434)"
    echo -e "    Models: $MODELS..."
else
    # Check if process is busy or just down
    if ps aux | grep -v grep | grep -q "ollama serve"; then
        echo -e "[${YELLOW}P${NC}] Primary (Local):  ${YELLOW}BUSY${NC} (Process active, port blocked?)"
    else
        echo -e "[${RED}P${NC}] Primary (Local):  ${RED}OFFLINE${NC} (Port 11434)"
    fi
fi

# 2. Alternate (A): Cloud (Gemini)
if ping -c 1 8.8.8.8 > /dev/null 2>&1; then
    echo -e "[${GREEN}A${NC}] Alternate (Cloud): ${GREEN}LOCKED${NC} (Internet OK)"
else
    echo -e "[${RED}A${NC}] Alternate (Cloud): ${RED}SILENT${NC} (No Internet)"
fi

# 3. Contingency (C): Remote Bridge (BMS Tunnel)
if ! ss -tuln | grep -q ":11435"; then
    ssh -fNL 11435:localhost:11434 gemini > /dev/null 2>&1
    sleep 0.5
fi

if curl -s --max-time 1 http://localhost:11435/api/tags > /dev/null; then
    R_MODELS=$(curl -s http://localhost:11435/api/tags | python3 -c "import sys, json; m=json.load(sys.stdin).get('models', []); print(', '.join([i['name'] for i in m[:3]]))")
    echo -e "[${GREEN}C${NC}] Contingency (Remote): ${GREEN}BRIDGE UP${NC} (Port 11435)"
    echo -e "    Models: $R_MODELS..."
else
    echo -e "[${YELLOW}C${NC}] Contingency (Remote): ${YELLOW}DARK${NC} (Tunnel offline)"
fi

# 4. OpenClaw (C2 Layer)
if systemctl --user is-active --quiet openclaw-gateway.service; then
    echo -e "[${GREEN}C2${NC}] Command & Control: ${GREEN}READY${NC} (OpenClaw active)"
else
    echo -e "[${RED}C2${NC}] Command & Control: ${RED}RADIO SILENCE${NC} (Service down)"
fi

echo "----------------------------------------"
echo -e "${MAGENTA}📊 Gemini Cloud Token Budget${NC}"
python3 "$HOME/Obsidian/Journal/_scripts/calc-usage-pulse.py"
echo "----------------------------------------"
