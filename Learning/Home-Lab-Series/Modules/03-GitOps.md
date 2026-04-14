---
Updated: 2026-04-12
tags:
  - learning
  - series
  - instruction
  - gitops
module_id: 3
phase: The Blueprint
---
# Module 3: The Blueprint (GitOps & IaC)

> [!NOTE] The Instructor's Perspective
> This is where the magic happens. We're moving from "Click-Ops" to "Git-Ops." If you want a new server, you don't go to the Proxmox UI; you write a piece of code and push it to Git. This is how we ensure our lab is repeatable and self-documenting.

## 🎯 Learning Objectives
By the end of this module, you will:
- [ ] Understand the role of **OpenTofu (Terraform)** and **Ansible**.
- [ ] Connect your local lab to a private GitHub/Gitea repository.
- [ ] Execute your first "Zero-Touch" deployment.

---

## 🧭 Tactical Overview
We use **OpenTofu** to build the "House" (Provisioning the VM in Proxmox) and **Ansible** to move the "Furniture" in (Installing Docker, users, and apps). By linking these to a Git repo, we create a "Paper Trail" of every change made to the lab.

---

## 🛠️ Step-by-Step Implementation
### 1. The Git Ground Truth
Create a repository named `homelab-ops`. This is your new "Command Post." Every `.tf` and `.yml` file lives here.

### 2. Provisioning with OpenTofu
Define your VM in code. Use the `bpg/proxmox` provider to tell Proxmox: "I need a VM with 4 cores and 8GB RAM based on template 9000." Run `tofu apply` and watch the VM appear.

### 3. Configuration with Ansible
Once the VM is up, Ansible reaches out via SSH. It applies your "Baseline" role: updating the OS, adding your NetYeti SSH keys, and installing the monitoring agents.

---

## ⚠️ Common Pitfalls & "Stupid Questions"
- **Pitfall:** Committing passwords or API keys to Git.
- **Fix:** Use **Ansible Vault** or `sops` to encrypt your secrets before you push.
- **"Stupid Question":** "Isn't this more work than just clicking 'Create VM'?"
- **Answer:** At first, yes. but when you need to rebuild your lab after a disk failure, clicking 'Create' 20 times is much harder than typing `tofu apply` once.

---

> [!CHECK] Knowledge Check
> - What does "Infrastructure as Code" (IaC) mean?
> - Why do we use Ansible *after* Terraform/OpenTofu?
> - How does GitOps help with "Configuration Drift"?

---
**Next Module:** [[Learning/Home-Lab-Series/Modules/04-AI-C2|The Force Multiplier (AI)]]
**Status:** Operational
**Related:** [[Knowledge Base/Development/GIT]], [[Knowledge Base/Development/Ansible]]
