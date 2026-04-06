---
title: Discord Linkable ID
---

# Discord IDs: The "How-To" for Bot & Webhook Integration

Discord uses unique IDs (Snowflakes) for every user, channel, and server. You'll need these to hook your Lab into Discord.

## Why Do You Need Them?
- **Webhooks:** Triggering notifications from Grafana, Uptime Kuma, or custom scripts.
- **Bot Config:** Hard-coding permissions or logging channels.
- **Mentions:** Pinging yourself or a specific role.

## How to Get an ID
1.  **Enable Developer Mode:** 
    - Go to `User Settings` -> `Advanced`.
    - Toggle `Developer Mode` to **ON**.
2.  **Right-Click Everything:**
    - Right-click a User, Channel, or Server name.
    - Select `Copy User ID`, `Copy Channel ID`, or `Copy Server ID`.

## Formatting for Links & Mentions
- **User:** `<@USER_ID>`
- **Channel:** `<#CHANNEL_ID>`
- **Role:** `<@&ROLE_ID>`

### Knowledge Check:
- Is your "Developer Mode" enabled?
- Are you using Webhooks or a full-blown Bot? (Webhooks are simpler and safer for basic alerts!)
