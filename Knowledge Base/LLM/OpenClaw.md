---
title: "OpenClaw: AI Command and Control (C2) Layer"
tags:
  - ai
  - llm
  - orchestration
  - openclaw
  - lab-ops
---

# OpenClaw: The AI C2 Layer

> [!NOTE] The Instructor's Perspective
> If Ollama is the "Engine" of our local AI stack, **OpenClaw** is the "Dashboard" and "Controls." It allows us to orchestrate multiple LLMs, give them access to tools (like Google Maps/Places via `Gog`), and automate tasks via a local gateway. This is how we move from "Chatting with a bot" to "Building with an Agent."

## Configuration Overview
OpenClaw in this lab is configured to act as a **Hybrid Gateway**:
- **Primary (P):** [[Ollama]] (Local Arc/SYCL).
- **Alternate (A):** [[Knowledge Base/LLM/index|Gemini 1.5 Pro]] via Google Cloud Code Assist.

### Key Tools & Skills Enabled
- **Gog (GoPlaces):** Access to Google Places API for location-based data.
- **Search:** Web search capabilities via local or cloud providers.
- **Shell:** Direct (approved) execution of terminal commands.
- **Tailscale:** Remote access to the Control UI via your Tailnet.

## Standard Operating Procedures (SOPs)

### 1. Connecting to the Gateway
The gateway typically runs on port `18789`. You can access it locally at `http://127.0.0.1:18789` or over your Tailnet.

### 2. Managing Auth Profiles
We use the `google-gemini-cli` auth flow to link your existing OAuth session. This keeps us in compliance with **[[Policies/SOP - AI Safety and Data Discipline|AI Safety SOP]]** by not scattering API keys.

### 3. Monitoring Output
Use the `command-logger` hook to keep an audit trail of all AI-initiated actions. This is your **AAR (After Action Review)** for automated missions.

---

## Troubleshooting (PACE Plan)
- **Primary (P):** Run `openclaw status` to check if the gateway is alive.
- **Alternate (A):** Check `~/.openclaw/logs/` for error traces.
- **Contingency (C):** Restart the `openclaw-gateway.service` (or use `toggle-ai.sh`).
- **Emergency (E):** Re-run `openclaw onboard` if the configuration becomes a "Catastrophic Failure."

---

## Knowledge Check
- Why do we call OpenClaw a "C2" layer?
- How does Tailscale integration help with "Mobile Command"?
- What is the risk of enabling the "Shell" tool without an approval workflow?

---
*Related: [[Learning/Home-Lab-Series/Default-Stack-Blueprint|The Stack]], [[Sparse Page]], [[Knowledge Base/LLM/index]]*
