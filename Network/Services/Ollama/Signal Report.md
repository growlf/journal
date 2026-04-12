---
Updated: 2026-04-12
tags:
  - ollama
  - status
  - llm
  - arc
---
# Ollama Signal Report

> [!NOTE] The Instructor's Perspective
> Maintaining "Signal Continuity" for our primary AI engine is mission-critical. This report documents the verified "Ground Truth" of our local LLM environment on the **Phoenix** host.

## 🛠️ Deployment Configuration
- **Architecture:** Docker Container (SYCL Optimized for Intel Arc).
- **Control Layer:** Systemd service (`ollama.service`) wrapping `docker compose`.
- **Image:** `ghcr.io/ava-agentone/ollama-intel:latest` (iGPU-first).
- **Service Path:** `/home/netyeti/Obsidian/Journal/Network/Services/Ollama`

## 📟 Hardware Mapping (Ground Truth)
As of **April 12, 2026**, the hardware map for the Meteor Lake iGPU is:
- **Primary Compute:** `/dev/dri/card0`
- **Render Node:** `/dev/dri/renderD128`
- **Shared Memory (SHM):** 16 GB
- **Total RAM Limit:** 32 GB

> [!WARNING] Hardware Drift
> Previous documentation specified `card1`. During the April 12th mission, the system was found to map the iGPU to `card0`. The `docker-compose.yml` has been surgically updated to reflect this.

## 📚 Model Library (Primary Layer)

### Local Instance (Phoenix - localhost:11434)
The following models are verified and ready for offloading:

| Model | ID | Size | Parameter Size |
| :--- | :--- | :--- | :--- |
| **qwen2.5-coder:14b** | 9ec8897f747e | 9.0 GB | 14.8B |
| **deepseek-r1:14b** | c333b7232bdb | 9.0 GB | 14.8B |
| **gemma3:12b** | f4031aab637d | 8.1 GB | 12.2B |
| **llama3:8b** | 365c0bd3c000 | 4.7 GB | 8.0B |
| **mistral:7b** | 6577803aa9a0 | 4.4 GB | 7.2B |
| **qwen2.5:7b** | 845dbda0ea48 | 4.7 GB | 7.6B |
| **nomic-embed-text** | 0a109f422b47 | 274 MB | 137M |

### Remote Instance (BMS Bridge - localhost:11435)
Established via SSH tunnel (`ssh gemini`) over Wireguard VPN to the Bellingham Makerspace.

| Model | ID | Size | Parameter Size |
| :--- | :--- | :--- | :--- |
| **llama3.1:latest** | 46e0c10c039e | 4.9 GB | 8.0B |

## 🚀 Strategic Mandate
- **Mandate:** ALWAYS offload processing to this P-layer whenever possible.
- **Authority:** The AI agent has permission to download and switch models to optimize for specific tasks (e.g. `qwen2.5-coder` for refactoring).

---
**Status:** Operational (Signal Locked)
**Related:** [[GEMINI.md]], [[Network/The Stack]], [[Knowledge Base/LLM/Ollama Setup Guide]]
