---
tags:
  - project
  - ansible
  - automation
  - infrastructure
date: 2026-04-16
status: planning
priority: high
---
# Project: Ansible Automation (The Master Key)

> [!NOTE] The Instructor's Perspective
> "Hey, you! Tired of SSHing into ten different boxes just to check a log or update a config? It's time to stop the 'manageable mess' and start building a 'Declarative Empire.' Ansible is our Master Key—it turns our manual 'how-to' notes into executable 'Ground Truth.' We're moving from 'I think I configured that' to 'I *know* I configured that.'"

## 🎯 Objective
To implement **Ansible** as the primary orchestration and configuration management tool for the entire NetYeti enterprise. This ensures rapid redeployment, consistent backups, and a "Self-Healing" infrastructure across **BMS**, **Home**, **Office**, and **Cascade STEAM**.

## 📋 Plan of Action

### 🏗️ Phase 1: The Foundation (Establishment)
1.  **Control Node Setup:** Designate **Phoenix** as the primary Ansible Control Node.
2.  **SSH Key Sovereignty:** Ensure the `netyeti` and `gemini` keys are propagated to all managed nodes for passwordless (but secure) access.
3.  **Inventory Architecture:**
    *   Create a structured `inventory/` directory.
    *   Divide by site: `home.ini`, `bms.ini`, `office.ini`, `cascade.ini`.
    *   Use `group_vars/` to define site-specific constants (DNS suffixes like `dhcp.bellinghammakerspace.org`, local gateways, etc.).
4.  **The "Ping" Test:** Verify connectivity to the **Ollama Herd** and **Swarm Nodes** using the `ansible all -m ping` command.

### 🔄 Phase 2: Script Migration (Translating the Dialect)
We will migrate our existing library of manual scripts into reusable **Ansible Roles**.
1.  **`check-llm-status.sh`** -> `ansible-role-ollama-monitor`
2.  **`sync-ollama-herd.sh`** -> `ansible-playbook-sync-herd`
3.  **`check-arc-gpu.sh`** -> `ansible-role-intel-gpu-manager`
4.  **`warden-handshake.sh`** -> `ansible-playbook-daily-briefing`
5.  **`ollama_provisioner.sh`** -> `ansible-playbook-provision-herd` (New!)
6.  **`net_yeti_audit.sh`** -> `ansible-role-network-audit` (New!)

### 🛡️ Phase 3: Security & Vault Integration
*   **Zero-Bake Law Enforcement:** Integrate Ansible with the **Bitwarden Vault**.
*   Use `ansible-vault` for local encrypted variables or a custom lookup plugin to fetch secrets via `bw get item` at runtime.

### 🚀 Phase 4: Full-Scale Deployment
1.  **Service State Enforcement:** Playbooks to ensure Docker/LXC services are always `started` and `enabled`.
2.  **Configuration Drift Protection:** Periodic Ansible runs to ensure local "tactical overrides" haven't broken the overall strategy.
3.  **Cascade STEAM Rollout:** Bringing the new servers online using the pre-tested playbooks.

## 📡 Inventory Map (Initial Target Nodes)
| Group | Nodes | Role |
| :--- | :--- | :--- |
| **ollama_herd** | `nuk1`, `lab1-4` | Distributed LLM Compute |
| **swarm_nodes** | `500`, `501`, `502` | Orchestration (OpenClaw/WebUI) |
| **core_servers** | `phoenix`, `gemini`, `frank` | Primary Reasoning & Hypervisors |
| **steam_nodes** | TBD | Cascade STEAM Infrastructure |

## 🛠️ Tools of the Trade
- **Primary:** `ansible-playbook`
- **Inventory:** YAML-based dynamic inventory.
- **Secrets:** `ansible-vault` + `bw` CLI.

## 📈 Status Update
- [ ] Establish Inventory structure.
- [ ] Configure SSH Key Sovereignty.
- [ ] Migrate `check-llm-status` to Ansible.
- [ ] Migrate `sync-ollama-herd` to Ansible.

## ✅ Final Solution Synopsis
*(To be completed after project closure)*

---
**Related:** [[Policies/Policy - Local Sovereignty Law]], [[Learning/Home-Lab-Series/Default-Stack-Blueprint]], [[Internal/Networks/Yeticraft/Services/Ollama/Signal Report]]
