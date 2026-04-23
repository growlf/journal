# 📦 The Stack: Master Blueprint & Package

This directory contains the documentation and references for the **NetYeti Default Stack**. It is the "Instructional Model" of the software and configuration that powers the self-healing lab.

## 🚀 Repository Blueprint

*   **[[README]]**: The primary overview of the stack's architecture and repository structure.
*   **[[Package (372186)]]**: Supplemental technical specifications for the 2026 stack release.

## 🏗️ Core Pillars (SOE)

As defined in the [[README]], the stack is built upon:
1.  **Hypervisor:** Proxmox VE (Foundation).
2.  **IaC:** OpenTofu & Ansible (Automation).
3.  **Orchestration:** Docker Swarm (The Hive).
4.  **AI C2:** OpenClaw & Gemini-CLI (Reasoning).
5.  **Knowledge Base:** Obsidian (Documentation).

---
> [!info] Operational Readiness
> This package is designed to be deployable via the playbooks found in the [[Learning/Ansible Automated Lab Manual/index|Ansible Manual]]. Ensure your host keys are configured in `hosts.ini` before initiating Phase 1.
