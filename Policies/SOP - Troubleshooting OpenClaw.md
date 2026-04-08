---
tags:
  - sop
  - ai
  - openclaw
  - discord
---
# SOP - Troubleshooting OpenClaw Connectivity

> [!NOTE] The Instructor's Perspective
> When an AI agent "disconnects," it's rarely a ghost in the machine. It's usually a "signal discipline" issue with the gateway. We found that Discord is particularly picky about its "Privileged Intents." If the bot doesn't have permission to see the messages, it gets kicked out.

## Symptom: Gateway Keeps Disconnecting
- **Log Error:** `discord: gateway closed with code 4014 (missing privileged gateway intents).`
- **Behavior:** The OpenClaw process runs but the bot is offline in Discord or doesn't respond. CPU usage may spike as it attempts to reconnect.

## 1. Fix Discord Privileged Intents
The most common cause for `4014` is missing permissions in the Discord Developer Portal.
1.  Go to the [Discord Developer Portal](https://discord.com/developers/applications).
2.  Select your OpenClaw application.
3.  Navigate to **Bot** settings.
4.  Enable **Message Content Intent**, **Server Members Intent**, and **Presence Intent**.
5.  **Save Changes.**

## 2. Verify Group Policy
If the bot is online but not responding, check the `groupPolicy`. 
- **Check:** `openclaw config get channels.discord.groupPolicy`
- **Fix:** If it's set to `allowlist` but you haven't added users, change it to `open` (for a private server) or populate the allowlist.
- **Command:** `openclaw config set channels.discord.groupPolicy open`

## 3. Node.js Versioning
Ensure OpenClaw is running on the correct Node.js version (LTS 22+ recommended).
- **Check:** `node -v`
- **NetYeti Recommendation:** If using NVM, ensure the systemd service points to the specific NVM binary to avoid path issues.

## 5. Security Hardening (The "NetYeti" Guardrails)
Running an autonomous agent is a "force multiplier," but it's also a "loaded weapon."
- **Small Model Risk:** If using a model under 300B parameters (like our `qwen2.5:7b`), avoid giving it access to web tools in public/open channels.
- **Group Policy:** For the best "signal discipline," we have moved from `open` to `allowlist`.
  - **Current Status:** `groupPolicy="allowlist"`
  - **Allowed Identity:** `227141869962919936` (NetYeti)
  - **Command to add more:** `openclaw config set channels.discord.allowFrom '["ID1", "ID2"]' --strict-json`
- **Control UI:** Disable `allowInsecureAuth` once you've verified your device identity.
  - **Command:** `openclaw config set gateway.controlUi.allowInsecureAuth false`

---
*Related: [[Policies/SOP - AI Safety and Data Discipline|AI Safety SOP]], [[Network/Services/Ollama/index|Ollama Setup]], [[Knowledge Base/LLM/index|AI Command Center]]*
