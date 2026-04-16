#!/bin/bash
# BMS VPN Status Checker - NetYeti Power
# This script authenticates with the BMS WGDashboard and reports peer status.

# Requirements: oathtool, curl, jq, bw (active session)

if [ -z "$BW_SESSION" ]; then
    echo "Error: BW_SESSION is not set. Please unlock Bitwarden."
    exit 1
fi

# 1. Fetch Credentials from Bitwarden
echo "Fetching credentials from vault..."
CREDS=$(bw get item "Wireguard Dashboard" | jq -r '.login')
USERNAME=$(echo "$CREDS" | jq -r '.username')
PASSWORD=$(echo "$CREDS" | jq -r '.password')
TOTP_SECRET=$(echo "$CREDS" | jq -r '.totp')

if [ "$TOTP_SECRET" == "null" ]; then
    echo "Error: Could not find TOTP secret in Bitwarden."
    exit 1
fi

# 2. Generate TOTP
TOTP=$(oathtool --totp -b "$TOTP_SECRET")

# 3. Authenticate
echo "Authenticating with vpn.bellinghammakerspace.org..."
COOKIE_FILE=$(mktemp)
AUTH_RES=$(curl -s -k --resolve vpn.bellinghammakerspace.org:443:207.224.235.194 \
  -X POST https://vpn.bellinghammakerspace.org/api/authenticate \
  -H "Content-Type: application/json" \
  -d "{\"username\":\"$USERNAME\", \"password\":\"$PASSWORD\", \"totp\":\"$TOTP\"}" \
  -c "$COOKIE_FILE")

if ! echo "$AUTH_RES" | jq -e '.status' > /dev/null; then
    echo "Authentication failed!"
    echo "$AUTH_RES"
    rm "$COOKIE_FILE"
    exit 1
fi

# 4. Get Configuration Info
echo "Retrieving peer status..."
INFO=$(curl -s -k --resolve vpn.bellinghammakerspace.org:443:207.224.235.194 \
  -b "$COOKIE_FILE" \
  "https://vpn.bellinghammakerspace.org/api/getWireguardConfigurationInfo?configurationName=wg0")

# 5. Report Status for 'Phoenix'
PHOENIX_PEER=$(echo "$INFO" | jq -r '.data.configurationPeers[] | select(.name == "Phoenix")')

if [ -z "$PHOENIX_PEER" ]; then
    echo "Phoenix peer not found in dashboard!"
else
    echo "----------------------------------------"
    echo "BMS VPN STATUS: Phoenix"
    echo "Status: $(echo "$PHOENIX_PEER" | jq -r '.status')"
    echo "Last Handshake: $(echo "$PHOENIX_PEER" | jq -r '.latest_handshake')"
    echo "Transfer: $(echo "$PHOENIX_PEER" | jq -r '.total_receive') GB received, $(echo "$PHOENIX_PEER" | jq -r '.total_sent') GB sent"
    echo "Endpoint: $(echo "$PHOENIX_PEER" | jq -r '.endpoint')"
    echo "Allowed IPs: $(echo "$PHOENIX_PEER" | jq -r '.allowed_ip')"
    echo "----------------------------------------"
fi

rm "$COOKIE_FILE"
