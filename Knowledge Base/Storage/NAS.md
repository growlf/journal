---
title: NAS - Network Attached Storage
---

# The NetYeti's Storage Pillar: NAS

Network Attached Storage (NAS) is the "heart" of your data ecosystem. It provides centralized storage for all your machines, containers, and VMs.

## Why a NAS?
- **Centralization:** One place for all your data, backups, and media.
- **Redundancy:** Protecting against single drive failures.
- **Access:** High-speed storage accessible via NFS, SMB, or iSCSI.

## Storage Stack Choices
1.  **TrueNAS:** The gold standard for ZFS-based storage. Reliable, feature-rich, but hungry for RAM.
2.  **Unraid:** Great for mixing drive sizes, simple to set up, but not as performance-focused as ZFS.
3.  **Proxmox + ZFS:** Great if you want your storage and virtualization on the same box (but "don't put all your eggs in one basket").

## PACE Plan for NAS Data
- **P (Primary):** The NAS itself (with RAID/ZFS).
- **A (Alternate):** Offsite backup (to a second NAS or Cloud).
- **C (Contingency):** Cold storage (USB drives or Tape).
- **E (Emergency):** Critical documents on an encrypted "survival" USB.

### Knowledge Check:
- Are your backups automated? (If not, they don't exist!)
- Have you tested your drive failure recovery?
