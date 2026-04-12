---
Ports:
  - 18789
tags:
  - services
  - c2
  - ai
  - orchestration
address: 127.0.0.1
service description: AI Command and Control (C2) Gateway
management_url: http://127.0.0.1:18789
hosts:
  - Phoenix (localhost)
Documentation: https://docs.openclaw.ai
---
# OpenClaw C2

> [!NOTE] The Instructor's Perspective
> OpenClaw is our **Command and Control (C2)** layer. It bridges the gap between our local LLM "Engine" (Ollama) and the tools required to interact with the real world. This is where we define agent behavior, tool permissions, and remote access via Tailscale.

## Service Status
- **State:** Active (Running as systemd service)
- **Primary Endpoint:** `http://127.0.0.1:18789`
- **Tailscale Endpoint:** `https://phoenix.tailfdd65f.ts.net`
- **Active Channels:** Discord (NetYeti Bridge)

## Key Integrations
- **Local Engine:** Linked to [[Ollama Signal Report|Ollama Pool]] (11434/11435).
- **Cloud Fallback:** Linked to Gemini 1.5 Pro (Alternate layer).
- **Tooling:** Search, Shell, and GoPlaces (Gog).

## Maintenance
To check the heartbeat of the C2 layer, run:
```bash
openclaw status
```

---
**Related:** [[Knowledge Base/LLM/OpenClaw]], [[Network/The Stack]]
