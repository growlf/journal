#!/bin/bash
# Local Sovereignty Enforcer - NetYeti Power (Robust Edition)
# Ensures manual safeguards and tactical overrides are persistent.

echo "--- Sovereignty Audit Starting ---"

# 1. Network Layer: WireGuard AllowedIPs (Phoenix)
# We find Netplan files by searching for the connection name "Phoenix"
PHOENIX_FILES=$(sudo grep -lE "name: \"Phoenix\"|Phoenix:" /etc/netplan/*.yaml)

if [ -z "$PHOENIX_FILES" ]; then
    echo "[?] Warning: No Phoenix Netplan configuration found."
else
    for NETPLAN_FILE in $PHOENIX_FILES; do
        NEED_APPLY=false
        
        # Ensure 10.0.0.0/24 is present in allowed-ips
        if ! sudo grep -q "10.0.0.0/24" "$NETPLAN_FILE"; then
            echo "[!] Sovereignty Breach: 10.0.0.0/24 missing from AllowedIPs in $NETPLAN_FILE"
            # Append it after the 10.0.1.0/16 entry
            sudo sed -i '/"10.0.1.0\/16"/a \        - "10.0.0.0/24"' "$NETPLAN_FILE"
            NEED_APPLY=true
        fi
        
        # Cleanup duplicates (idempotency safety)
        if [ $(sudo grep -c "10.0.0.0/24" "$NETPLAN_FILE") -gt 1 ]; then
            echo "[!] Sovereignty Cleanup: Removing duplicate entries in $NETPLAN_FILE"
            # Remove all lines containing 10.0.0.0/24, then add it back once
            sudo sed -i '/10.0.0.0\/24/d' "$NETPLAN_FILE"
            sudo sed -i '/"10.0.1.0\/16"/a \        - "10.0.0.0/24"' "$NETPLAN_FILE"
            NEED_APPLY=true
        fi

        if [ "$NEED_APPLY" = true ]; then
            sudo netplan apply
            # Ensure NetworkManager is back up
            sudo systemctl start NetworkManager
            echo "[*] Safeguard Restored: $NETPLAN_FILE updated and Netplan applied."
        fi
    done
fi

# 2. DNS Layer: /etc/hosts Overrides
declare -A HOSTS_OVERRIDES=(
    ["bitwarden.lab.internal"]="[PUBLIC_IP]"
    ["vpn.lab.internal"]="[PUBLIC_IP]"
)

for host in "${!HOSTS_OVERRIDES[@]}"; do
    ip="${HOSTS_OVERRIDES[$host]}"
    if ! grep -q "$host" /etc/hosts; then
        echo "[!] Sovereignty Breach: DNS override missing for $host"
        echo "$ip $host" | sudo tee -a /etc/hosts > /dev/null
        echo "[*] Safeguard Restored: /etc/hosts entry added for $host."
    fi
done

# 3. Access Layer: SSH Wildcards
SSH_CONFIG="$HOME/.ssh/config"
if [ -f "$SSH_CONFIG" ]; then
    if ! grep -q "Host bms \*.bms" "$SSH_CONFIG"; then
        echo "[!] Sovereignty Breach: BMS SSH Wildcard missing in $SSH_CONFIG"
        # We append a robust block if missing
        cat <<EOF >> "$SSH_CONFIG"

# Sovereign BMS Overrides
Host bms *.bms
    HostName %h
    User netyeti
    IdentityFile ~/.ssh/id_ed25519
EOF
        echo "[*] Safeguard Restored: BMS SSH Wildcard added."
    fi
else
    echo "[!] Critical Breach: SSH config missing at $SSH_CONFIG"
fi

# 4. Interface Sovereignty (wg-phoenix)
# Ensure the interface name is wg-phoenix for the Phoenix connection
PHOENIX_UUID=$(sudo nmcli -g connection.uuid connection show Phoenix 2>/dev/null)
if [ -n "$PHOENIX_UUID" ]; then
    CURRENT_IFACE=$(sudo nmcli -g connection.interface-name connection show "$PHOENIX_UUID")
    if [ "$CURRENT_IFACE" != "wg-phoenix" ]; then
        echo "[!] Sovereignty Breach: Phoenix interface name is '$CURRENT_IFACE', resetting to 'wg-phoenix'"
        sudo nmcli connection modify "$PHOENIX_UUID" connection.interface-name wg-phoenix
        sudo nmcli connection up "$PHOENIX_UUID"
        echo "[*] Safeguard Restored: Interface name set to wg-phoenix."
    else
        # Even if name is correct, ensure it's up
        if ! sudo nmcli device status | grep -q "wg-phoenix.*connected"; then
            echo "[!] Sovereignty Alert: wg-phoenix is down. Bringing it up."
            sudo nmcli connection up "$PHOENIX_UUID"
        fi
    fi
else
    echo "[?] Warning: Phoenix NM connection not found."
fi

echo "--- Sovereignty Audit Complete ---"
