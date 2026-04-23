#!/bin/bash
# enact-minion-nuk1.sh - Background monitor and enactor for the nuk1 node.
# Authored by Signal-Smith for the NetYeti Forest.

LOG_FILE="~/.gemini/tmp/journal/nuk1_enactment.log"
GEMINI_LOG="/home/gemini/nuk1_tuning.log"
REMOTE_HOST="10.0.1.201"
TARGET_HOST="10.0.1.252"

echo "[$(date)] Enactment process started for nuk1..." >> "$LOG_FILE"

# 1. Wait for Gemini to finish deployment
echo "[$(date)] Waiting for Gemini deployment to complete..." >> "$LOG_FILE"
while ! ssh gemini@$REMOTE_HOST "grep -q 'PEER ONLINE' $GEMINI_LOG" ; do
    sleep 30
done

echo "[$(date)] Signal detected! nuk1 is drafted into the Council." >> "$LOG_FILE"

# 2. Add to check-llm-status.sh
STATUS_SCRIPT="_assets/_scripts/check-llm-status.sh"
if ! grep -q "nuk1" "$STATUS_SCRIPT"; then
    echo "[$(date)] Adding nuk1 to check-llm-status.sh..." >> "$LOG_FILE"
    cat << 'EOF' >> "$STATUS_SCRIPT"

# 5. Edge Node: nuk1 (iGPU)
if ssh -o BatchMode=yes -o ConnectTimeout=1 nuk1 "ollama list" > /dev/null 2>&1; then
    N_MODELS=$(ssh nuk1 "ollama list" | awk 'NR>1 {print $1}' | head -n 3 | tr '\n' ',' | sed 's/,$//')
    echo -e "[\033[0;32mE\033[0m] Edge Node (nuk1):   \033[0;32mONLINE\033[0m"
    echo -e "    Models: $N_MODELS..."
else
    echo -e "[\033[0;31mE\033[0m] Edge Node (nuk1):   \033[0;31mOFFLINE\033[0m"
fi
EOF
fi

# 3. Final Victory Signal
echo "[$(date)] ENROLLMENT COMPLETE: nuk1 is now a functional peer in the Council of Minions." >> "$LOG_FILE"
echo "🫡 Signal-Smith Report: nuk1 enrollment complete." > "~/.gemini/tmp/journal/nuk1_ready.signal"
