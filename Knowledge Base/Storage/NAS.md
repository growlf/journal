---
Updated: 2026-04-13
tags:
  - storage
  - infrastructure
  - instruction
---
# Knowledge Base: Network Attached Storage (NAS)

> [!NOTE] The Instructor's Perspective
> In a home lab, a NAS isn't just a hard drive with a network cable. It's the "Vault" for your data. It provides the persistent storage that your virtualized workloads (LXCs/VMs) need to survive a host failure. If the Compute Nodes (PVE/LXC) are the "Brain," the NAS is the "Memory."

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

## 🛡️ PACE Plan (Reliability)
- **P (Primary):** ZFS Pool with RAID-Z2 or Mirroring on the main NAS.
- **A (Alternate):** Automated nightly sync to a secondary storage node (e.g., `rsync` or `zfs send`).
- **C (Contingency):** Cloud backup (Encrypted B2 or S3) for "Crown Jewels" data.
- **E (Emergency):** Local offline cold storage (External USB drive in a fire-safe).

## ⚠️ Common Pitfalls
- **The "Permissions Trap":** NFS and SMB permissions can be a nightmare. **Always** map your UIDs/GIDs correctly between the NAS and the LXC.
- **Single Point of Failure:** If your only NAS goes down, your entire cluster (Bee, Locust, Termite) will freeze. **Never** run your OS boot disks off the NAS unless you have a high-availability (HA) storage plan.
- **Consumer Hardware Limits:** Running a NAS on a single USB drive is a "Managed Mess" that will eventually end in "Radio Silence." Always use SATA/NVMe for parity-protected pools.

## 📝 Check for Understanding
> [!question] Knowledge Check
> 1. If you delete a file on an NFS share, is it gone forever, or does it go to a "Recycle Bin"? (Answer: Depends on the NAS OS, but for raw NFS, it's usually gone instantly!)
> 2. Why is NFS preferred over SMB for Proxmox ISO storage?

---
**Status:** Operational
**Related:** [[Internal/Networks/Yeticraft/Devices/Synology]], [[Learning/Home-Lab-Series/Default-Stack-Blueprint|The Stack]]
