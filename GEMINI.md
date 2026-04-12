# GEMINI.md - NetYeti Journal Context

This directory is the "Tactical Notebook" and primary Knowledge Base for **Garth Johnson (The NetYeti)**. It is an Obsidian vault managed with a "Local-First" philosophy and published to the web via **Quartz**.

## 🧭 Directory Overview
The vault is structured to support a high-fidelity Home Lab, community instruction (BTC, Cascade STEAM), and personal professional development. It follows a "Manageable Mess" philosophy—prioritizing capturing and linking knowledge over rigid perfection.

- **Primary Audience:** Students, home lab enthusiasts, and the Yeti's future self.
- **Core Strategy:** Local-First Hybrid AI (Ollama/OpenClaw) and the PACE (Primary, Alternate, Contingency, Emergency) plan for infrastructure reliability.
- **Privacy Model:** Two-tiered approach using an `Internal/` folder (Git-ignored, CouchDB synced) for sensitive "Ground Truth" data and a public `Network/` folder for instructional "Concepts."

## 📁 Key Files & Directories

### 🏰 Anchors
- **`index.md`**: The mission statement and entry point for the vault. Defines the NetYeti persona and core values.
- **`Network/Home Lab 101.md`**: The philosophical foundation. Explains the *why* and *how* of building a learning environment.
- **`Network/The Stack.md`**: The "Operations Order" (OPORD). Lists the specific services and deployment sequence for the Yeti's lab.

### 📡 Command & Control (Internal)
- **`Internal/`**: The "Black Site." Contains the actual IPs, MACs, and hardware serials of the lab. **NEVER COMMIT THIS TO GIT.**
- **`Internal/daily/`**: Tactical logs organized by `YYYY/MM/` subfolders. Includes automated "Yesterday/Tomorrow" navigation links.
- **`Internal/Devices/`**: The true identity of every node on the wire (MikroTik, Proxmox, IBM Clusters).

### 📖 Instruction (Public)
- **`Network/Devices/`**: Sanitized "Concept Twins" of the lab hardware for public instruction.
- **`Policies/`**: Standard Operating Procedures (SOPs) for common tasks (e.g., "Deploying a New LXC", "Network Audit").
- **`Knowledge Base/`**: Deep-dive technical documentation on LLMs, Networking, and Virtualization.
- **`Network/Network Map.md`**: The visual command map (Auto-updating SVG via Excalidraw).

### 🛠️ Automation
- **`_assets/_templates/`**: The blueprint for creating new consistent nodes, people, and daily logs.
- **`_scripts/`**: Tactical tools like `sanitize-network.py` for ensuring OPSEC.

## 🤖 AI Strategy & Orchestration
This journal operates on a **Local-First Mandate**. 
- **P (Primary):** **Ollama LLM Pool**. This is the mandatory first line of processing.
    - **Local Node:** localhost:11434 (Phoenix/Intel Arc).
    - **Remote Node:** localhost:11435 (BMS Bridge via SSH tunnel over Wireguard).
- **A (Alternate):** Large Cloud LLMs (Gemini/Anthropic). Used for complex synthesis or as a fallback.
- **C2:** **OpenClaw** orchestrates these layers.

**Verified Signal (LLM Pool):**
- **Phoenix:** Active via `ollama.service` (SYCL/Intel Arc).
- **BMS Bridge:** Active via `ssh gemini` tunnel.
- **OpenClaw:** Active via `openclaw-gateway.service`.
- **Detail Report:** [[Network/Services/Ollama/Signal Report|Current Ollama Signal Report]].
- **C2 Dashboard:** [[Network/Services/OpenClaw|OpenClaw C2 Gateway]].

**Tactical Note:** The agent has full authority to switch local models or download new weights to optimize for the current task.

---
*Status: Operational*
*Last Sync: April 8th, 2026*
