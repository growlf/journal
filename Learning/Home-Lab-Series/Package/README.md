# NetYeti Home Lab Stack (The Self-Healing Lab)

> [!IMPORTANT] The Guardian's Blueprint
> This repository contains the configuration, automation, and documentation structure for the NetYeti "Self-Healing Lab." It is designed for students, instructors, and community members who want a "Local-First" and "GitOps-First" home lab environment.

## 🚀 Overview
The NetYeti Stack is more than just a collection of services; it is a **Standard Operating Environment (SOE)** that prioritizes:
1.  **Privacy:** Local LLMs (Ollama) as the primary reasoning layer.
2.  **Reliability:** The PACE plan (Primary, Alternate, Contingency, Emergency) for all critical infrastructure.
3.  **Efficiency:** Automated documentation via Obsidian and automated task management via the "Warden" engine.
4.  **Security:** Centralized secret management with Bitwarden CLI.

## 🏗️ The Architecture (Core Pillars)
- **Hypervisor:** Proxmox VE.
- **Infrastructure as Code:** OpenTofu (Terraform) and Ansible.
- **Orchestration:** Docker Swarm (The Hive).
- **AI Command & Control:** OpenClaw / Gemini-CLI.
- **Knowledge Base:** Obsidian (Local-First).

## 📂 Repository Structure
- `ansible/`: Base playbooks for deploying Docker Swarm, Ollama, and common LXCs.
- `tofu/`: Infrastructure blueprints for Proxmox.
- `scripts/`: Tactical tools for vault synchronization, LLM health checks, and backlog management.
- `vault/`: The skeleton structure for your Obsidian "Battle Book" (including templates and forest laws).
- `.gemini/`: Pre-configured minion roles for the Yeti's Council (Warden, Pathfinder, etc.).

## 🛠️ Getting Started
1.  **Physical Prep:** Follow [[Learning/Home-Lab-Series/Modules/01-Physical|Module 1]].
2.  **OS & Hypervisor:** Follow [[Learning/Home-Lab-Series/Modules/02-Proxmox|Module 2]].
3.  **Bootstrap the Stack:**
    ```bash
    git clone https://github.com/growlf/home-lab-stack.git
    cd home-lab-stack
    # (Setup instructions for Ansible/Tofu coming soon)
    ```
4.  **Connect the Council:** Set up your Gemini-CLI and OpenClaw instance to begin autonomous management.

## 🛡️ Forest Laws & SOPs
- **SOP - Secret Management:** Use Bitwarden for ALL credentials.
- **SOP - AI Safety:** Local LLMs are P1; Cloud is Alternate.
- **AAR Culture:** Document every major change with an After-Action Review.

---
*Created by The NetYeti (The NetYeti)*
*Part of the [[Learning/Home-Lab-Series/index|Self-Healing Lab Curriculum]].*
