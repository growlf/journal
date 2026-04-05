---
title: Proxmox: The Virtual Command Center
tags:
  - virtualization
  - proxmox
  - lab-ops
---
# Proxmox VE: The Virtual Command Center

> [!NOTE] The Instructor's Perspective
> In the Army, we had a "Command Post" where all the operations were coordinated. In your home lab, Proxmox VE is that command post. It's an open-source virtualization platform that allows you to run VMs and LXCs on a single piece of hardware. It's powerful, flexible, and essential for our learning journey.

## Why use it?
- **Unified Management:** One web interface for all your virtual machines and containers.
- **Enterprise Features:** High Availability, Backup/Restore, and live migration.
- **Open-Source:** Built on Debian Linux, giving you full control and transparency.
- **Efficiency:** Drastically reduces the amount of physical hardware you need for a lab.

## Hypervisor Reliability (The PACE Plan)
> [!TIP] Operational Discipline
> **P (Primary):** Proxmox VE Cluster (2 or more nodes for High Availability).
> **A (Alternate):** Single-Node Proxmox installation with regular backups to [[Proxmox Backup Server]].
> **C (Contingency):** Standalone [[LXC]] or [[Docker]] hosts on a separate hardware node.
> **E (Emergency):** Direct host-based applications running on a fresh Linux install.

## SOP: Creating a Virtual Command Post
1. **Prepare Hardware:** Ensure your CPU supports VT-x or AMD-v.
2. **Install Proxmox:** Download the ISO and follow the installation wizard.
3. **Configure Storage:** Set up ZFS for data integrity and snapshots.
4. **Deploy Services:** Start creating your [[LXC]] containers and Virtual Machines.
5. **Set Up Backups:** Connect to your [[Proxmox Backup Server]] and schedule daily backups.

## Check for Understanding
- What is the main difference between a **Primary** cluster (High Availability) and an **Alternate** single-node?
- Why is it important to have a dedicated hardware node (Primary) instead of a virtualized one (Alternate)?

---
*Related: [[Knowledge Base/LXC]], [[Proxmox Backup Server]], [[Network/The Stack]]*
