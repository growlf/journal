---
Updated: 2026-04-12
tags:
  - learning
  - series
  - blueprint
  - default-stack
---
# The Default Stack: Master Blueprint

> [!abstract] Mission Summary
> This page serves as the definitive "Command Package" for the Self-Healing Lab. It consolidates the architecture, tools, and tactical mandates of the NetYeti **Default Stack**. This is the operational engine that powers the Forest Guardian.

## 🏗️ Architectural Overview
The Self-Healing Lab is built on a **GitOps-First** and **Local-AI** foundation.

### 1. The Physical Pillars
- **The Edge:** [[Network/Devices/Core-Router|Core Router]] (MikroTik RB4011/CRS326).
- **The Engine:** [[Network/Devices/Hypervisor|Primary Hypervisor]] (Intel Meteor Lake / Arc).
- **The Bridge:** [[Network/Devices/House-Router|Residential WiFi]] (MikroTik ax3).

### 2. The Command Stack (Software)
- **Hypervisor:** Proxmox VE (Virtualization).
- **Infrastructure:** OpenTofu / Ansible (Infrastructure as Code).
- **AI Engine:** Ollama / OpenClaw (Local AI).
- **Control Center:** Obsidian / Quartz (Documentation).

### 3. The Core Signal Map (PACE)
1. **P (Primary):** Local LAN / On-Premise Compute.
2. **A (Alternate):** Cloud Fallback / Remote Clusters.
3. **C (Contingency):** Tailscale / Wireguard Mesh.
4. **E (Emergency):** Out-of-Band Management (XCC/IPMI).

## 🚀 Deployment Operations Order
If you are building from scratch, follow the modules in this sequence:
1. [[Learning/Home-Lab-Series/Modules/01-Physical|Physical Prep]]
2. [[Learning/Home-Lab-Series/Modules/02-Proxmox|Proxmox Handshake]]
3. [[Learning/Home-Lab-Series/Modules/03-GitOps|GitOps Blueprinting]]
4. [[Learning/Home-Lab-Series/Modules/04-AI-C2|AI Activation]]
5. [[Learning/Home-Lab-Series/Modules/05-Obsidian|Documentation Loop]]

---
*Self-Healing Lab Note: Documentation is a Signal. Maintain your tactical notebook like your career depends on it.*

**Status:** Operational (v2.0 Blueprint)
**Related:** [[Learning/Home-Lab-Series/index|Home Lab 101]], [[Learning/Home-Lab-Series/Package/README|The Stack Package]]
