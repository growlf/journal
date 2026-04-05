---
tags:
  - virtualization
  - proxmox
  - linux
  - lxc
title: Linux Containers (LXC)
---
# LXC: Lightweight Virtualization for the Home Lab

> [!NOTE] The Instructor's Perspective
> In our labs, we're all about being efficient. A full VM (Virtual Machine) has its place, but for a single service like a web server or a database, it's like using a semi-truck to carry a single brick. LXC (Linux Containers) lets you carry that brick in a backpack. It's fast, uses very little RAM, and boots in seconds.

## Why use it?
- **Speed:** Boot times are near-instant.
- **Resource Efficiency:** Containers share the host's kernel, meaning more overhead for your actual applications.
- **Density:** Run 10+ containers on hardware that might only handle 2-3 full VMs.

## Deployment Reliability (The PACE Plan)
> [!TIP] Container Continuity
> **P (Primary):** Proxmox LXC node (Running on local ZFS storage).
> **A (Alternate):** Sibling node in a Proxmox cluster (using HA or Replication).
> **C (Contingency):** Fresh LXC deployment using an [[Ansible]] playbook and latest backups.
> **E (Emergency):** Run the service as a standard process on any available Linux host.

## Standard Operating Procedure (SOP) Best Practices
1. **Unprivileged is Default:** For security, always use unprivileged containers unless you have a specific hardware pass-through requirement.
2. **Template Management:** Keep your templates updated. A stale template is a security hole waiting to be exploited.
3. **Backup Regularly:** Use [[Proxmox Backup Server]] to ensure your "backpack" isn't lost if the host goes down.

## Check for Understanding
- Why does an LXC container boot faster than a VM? (Hint: Think about the kernel).
- What is the main security risk of using a "privileged" container?

---
*Related: [[Network/Services/Proxmox/index|Proxmox]], [[Knowledge Base/Docker|Docker]], [[Knowledge Base/Apt Cacher NG]]*
