---
Updated: 2026-04-13
tags:
  - storage
  - infrastructure
  - instruction
---
# Knowledge Base: Network Attached Storage (NAS)

> [!NOTE] The Instructor's Perspective
> In a home lab, a NAS isn't just a hard drive with a network cable. It's the "Vault" for your data. It provides the persistent storage that your virtualized workloads (LXCs/VMs) need to survive a host failure.

## 1. Why a dedicated NAS?
- **Centralization:** One place to manage RAID, quotas, and backups.
- **Protocol Flexibility:** Serves data via **NFS** (for Linux/Proxmox), **SMB** (for Windows/Mac), and **iSCSI** (for block-level storage).
- **Redundancy:** Protects against single-disk failures via RAID-Z or Mirroring.

## 2. NAS Architectures in the Default Stack
- **Physical:** A dedicated node (e.g., your Synology or a TrueNAS build).
- **Virtualized:** Passing through an HBA (Host Bus Adapter) to an LXC/VM running OpenMediaVault or ZFS.

## 3. How to connect Proxmox to your NAS
1.  **NFS:** Best for ISOs and backups. Low overhead.
2.  **iSCSI:** Best for VM disks. High performance, block-level access.

---
**Status:** Operational
**Related:** [[Internal/Networks/Yeticraft/Devices/Synology]], [[Network/The Stack]]
