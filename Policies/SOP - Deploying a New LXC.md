---
title: "SOP: Deploying a New LXC Container"
tags:
  - sop
  - lxc
  - proxmox
  - lab-ops
---
# SOP: Deploying a New LXC Container

> [!NOTE] The Instructor's Perspective
> In our labs, we want to be "fast and light." This SOP will get you from "empty hypervisor" to "running service" in a matter of minutes. Follow these steps to ensure your container is consistent and ready for production.

## 1. Preparation (The Mission Brief)
- **Select an Image:** Choose a lightweight Linux distribution (e.g., Debian or Alpine).
- **Define Resources:** How much CPU, RAM, and Disk space will your service need?
- **Network Plan:** Does this container need a static IP address, or will it use DHCP?

## 2. Deployment (The Action Phase)
1. **Open Proxmox:** Log in to your [[Network/Services/Proxmox/index|Proxmox]] node.
2. **Create Container:** Click "Create CT" in the top-right corner.
3. **General Settings:**
   - **Hostname:** Give it a clear, descriptive name (e.g., `web-server-01`).
   - **Unprivileged:** Ensure this box is checked for security.
4. **Template Selection:** Pick your pre-downloaded image.
5. **Resources:** Assign your planned CPU, RAM, and Disk space.
6. **Network:**
   - **Bridge:** Usually `vmbr0`.
   - **IP Address:** Set your static IP (e.g., `10.0.0.50/24`) or choose DHCP.
7. **SSH Public Key:** Paste your public key from your **P (Primary)** access plan.
8. **Finish & Boot:** Review your settings and click "Finish."

## 3. Post-Deployment (The After Action Phase)
1. **Log In:** Use `ssh` to log into your new container.
2. **Update:** Run `apt update && apt upgrade` to ensure your container is secure.
3. **Install Core Tools:** Install any necessary software for your service.
4. **Configure Firewall:** Set any necessary firewall rules.
5. **Verify:** Ensure your service is running and accessible.

## 4. Knowledge Transfer (The NetYeti Way)
- Document any specific configuration steps in a new [[Knowledge Base]] entry.
- Update your [[Network/The Stack]] documentation if this container is a core service.

---
**Status:** (Complete / In-Progress)
**Related Tasks:** 
- [ ] Add to monitoring
- [ ] Schedule regular backups
