#!/bin/bash
# Network Environment Switcher - NetYeti Tactical Tool
# Automates Firewalld zones and VPN states based on detected environment.

# --- Configuration ---
HOME_SSID="pipplew"
HOME_SUBNET="192.168.88"

BMS_SSIDS=("BMS-WiFi" "cascadesteam" "CascadeSTEAM" "bmswifi" "bmswifi1")
BMS_SUBNET="10.10"

WORK_SUBNET="192.168.42"

VPN_NAME="Phoenix"

# --- Functions ---
apply_profile() {
    local env=$1
    local zone=$2
    local vpn_state=$3 # "up" or "down"

    echo "[*] Applying Profile: $env ($zone / VPN:$vpn_state)"
    
    # 1. Set Firewalld Zone
    sudo firewall-cmd --set-default-zone="$zone"
    
    # 2. Manage VPN
    if [ "$vpn_state" == "up" ]; then
        if ! nmcli con show --active | grep -q "$VPN_NAME"; then
            echo "[*] Raising VPN: $VPN_NAME"
            sudo nmcli con up "$VPN_NAME"
        fi
    else
        if nmcli con show --active | grep -q "$VPN_NAME"; then
            echo "[*] Dropping VPN: $VPN_NAME"
            sudo nmcli con down "$VPN_NAME"
        fi
    fi
}

# --- Detection ---
CURRENT_SSID=$(nmcli -t -f ACTIVE,SSID dev wifi | grep '^yes' | cut -d: -f2)
CURRENT_IP=$(hostname -I | cut -d' ' -f1)

echo "--- Network Recon ---"
echo "SSID: $CURRENT_SSID"
echo "IP:   $CURRENT_IP"

ENV="UNKNOWN"

# Check Home
if [[ "$CURRENT_SSID" == "$HOME_SSID" ]] || [[ "$CURRENT_IP" == "$HOME_SUBNET".* ]]; then
    ENV="HOME"
    apply_profile "HOME" "home" "up"

# Check Work
elif [[ "$CURRENT_IP" == "$WORK_SUBNET".* ]]; then
    ENV="WORK"
    apply_profile "WORK" "work" "up"

# Check BMS
else
    IS_BMS=false
    for ssid in "${BMS_SSIDS[@]}"; do
        if [[ "$CURRENT_SSID" == "$ssid" ]]; then
            IS_BMS=true
            break
        fi
    done
    
    if [ "$IS_BMS" = true ] || [[ "$CURRENT_IP" == "$BMS_SUBNET".* ]]; then
        ENV="BMS"
        # User is moving to BMS to diagnose Phoenix, keep it down for fresh start.
        apply_profile "BMS" "public" "down"
    else
        ENV="UNKNOWN"
        apply_profile "UNKNOWN" "public" "down"
    fi
fi

echo "Environment: $ENV"
echo "--- Policy Applied ---"

# --- Sanitization ---
# Call the local sanitization script if it exists
SAN_SCRIPT="~/Obsidian/Journal/_assets/_scripts/sanitize-network.py"
if [ -f "$SAN_SCRIPT" ]; then
    echo "[*] Running Sanitization Protocol..."
    python3 "$SAN_SCRIPT" --path "~/Obsidian/Journal/Internal/daily/2026/04/2026-04-15.md"
fi
