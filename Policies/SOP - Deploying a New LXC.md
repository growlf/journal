---
title: SOP - Deploying a New LXC Container
tags:
  - sop
  - lxc
  - proxmox
  - lab-ops
---
# SOP: Deploying a New LXC Container

> [!NOTE] The Instructor's Perspective
> In our labs, we want to be "fast and light," but we also want to be "orderly." This SOP ensures that every new service in your "manageable mess" follows our **Signal Discipline** and **Resource Management** standards. Deploying a container is a "tactical move"—do it right the first time!

## 1. Preparation (The Mission Brief)
- **Select an Image:** Choose a lightweight Linux distribution (e.g., Debian or Alpine).
- **Define Resources (The Quota):** Don't be "greedy" with your hypervisor's resources.
    - **CPU:** How many cores? (e.g., 1 or 2).
    - **RAM:** How much memory? (e.g., 512MB or 1GB).
    - **Disk:** How much space? (e.g., 8GB or 16GB).
- **Signal Discipline:** Identify any secrets (passwords, API keys) the container will need. **DO NOT** hardcode them into the container's configuration. Use our [[Policies/SOP - Secret Management in the Home Lab|Secret Management SOP]].

## 2. Deployment (The Action Phase)
1. **Open Proxmox:** Log in to your [[Sparse Page]] node.
2. **Create Container:** Click "Create CT" in the top-right corner.
3. **General Settings:**
   - **Hostname:** Give it a clear, descriptive name (e.g., `web-server-01`).
   - **Unprivileged:** Ensure this box is checked for security—this is our **Primary (P)** security layer.
4. **Template Selection:** Pick your pre-downloaded image.
5. **Resources:** Assign your planned CPU, RAM, and Disk space. Use quotas to prevent a single container from "starving" the rest of the node.
6. **Network:**
   - **Bridge:** Usually `vmbr0`.
   - **IP Address:** Set your static IP via [[Knowledge Base/Networking/DNS/Technitium DNS & DHCP|Technitium]] or choose DHCP.
7. **SSH Public Key:** Paste your public key from your **P (Primary)** access plan. **NEVER** use password-based authentication for SSH.
8. **Finish & Boot:** Review your settings and click "Finish."

## 3. Post-Deployment (The After Action Phase)
1. **Log In:** Use `ssh` to log into your new container.
2. **Update:** Run `apt update && apt upgrade` to ensure your container is secure.
3. **Secret Management:** Move any necessary `.env` files or secrets into the container via secure channels (e.g., `scp` or a secrets manager). Ensure they are **NOT** part of the vault's git repo.
4. **Install Core Tools:** Install any necessary software for your service.
5. **Configure Firewall:** Set any necessary firewall rules (e.g., `ufw`).
6. **Verify:** Ensure your service is running and accessible.

## 4. Knowledge Transfer (The NetYeti Way)
- Document any specific configuration steps in a new [[Knowledge Base]] entry.
- Update your [[Learning/Home-Lab-Series/Default-Stack-Blueprint|The Stack]] documentation if this container is a core service.
- **AAR:** Conduct a brief After Action Review if any "manageable messes" occurred during deployment.

---
**Status:** (Complete / In-Progress)
**Related Tasks:** 
- [ ] Add to [[Knowledge Base/Services/Monitoring/index|Monitoring]]
- [ ] Schedule regular backups with [[Sparse Page]]
- [ ] Conduct AAR

*Related: [[Policies/SOP - Secret Management in the Home Lab]], [[Sparse Page]]*
