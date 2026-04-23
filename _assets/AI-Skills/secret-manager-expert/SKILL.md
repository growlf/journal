# Skill: Secret Manager Expert (Vault Guardian)

## Description
Use this skill to securely manage and retrieve credentials from the Bitwarden secrets manager (`bitwarden.lab.internal`) via the `bw` CLI. It ensures that sensitive data is provided to the AI Command Staff without ever being recorded in the permanent vault or logs.

## Capabilities
- **Vault Status Check:** Monitors if the vault is locked, unlocked, or requires syncing.
- **Secure Retrieval:** Pulls passwords, TOTP tokens, and secure notes by item name or ID.
- **Staff Provisioning:** Supplies credentials directly to other Sub-Agents (e.g., Hypervisor Ops) for automated missions.
- **Sync Management:** Ensures the local `bw` cache is current with the BMS Bitwarden server.

## Usage Protocol
1.  **Status Recon:** Run `bw status` to verify current session state.
2.  **Unlock Request:** If the vault is locked, ask the user to provide a session token: *"The vault is locked. Please provide a BW_SESSION token or unlock via 'bw unlock'."*
3.  **Sync:** Run `bw sync` to fetch the latest Makerspace credentials.
4.  **Directed Search:** Use `bw list items --search <name>` to find the specific asset.
5.  **Clean Handoff:** Pass the credential to the requesting sub-agent via environment variables or stdin. **NEVER** print the secret to stdout or log it in Markdown.

## Tactical Mandates
- **OPSEC Supreme:** Secrets are volatile. They exist only in RAM during execution and must never be written to disk.
- **Sanitization:** If documenting an AAR, always use `<REDACTED>` for any sensitive field.
- **Server Targeting:** Ensure `bw config server bitwarden.lab.internal` is correctly set.
