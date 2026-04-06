---
tags:
  - filesystem
  - storage
  - reliability
  - linux
title: ZFS
---
# ZFS: The Data Fortress

> [!NOTE] The Instructor's Perspective
> In the Army, we had a "fortress" for our most valuable assets. In your lab, your data is your most valuable asset. ZFS isn't just a filesystem; it's a "manageable fortress" for your data. It protects against silent corruption, makes backups a breeze with snapshots, and scales with your needs.

## Why use it?
- **Data Integrity:** "Self-healing" through checksums and parity.
- **Snapshots:** Instant point-in-time recovery.
- **Deduplication & Compression:** Save space without losing performance.
- **RAID-Z:** Better-than-RAID protection against disk failures.

## Storage Reliability (The PACE Plan)
> [!TIP] Data Discipline
> **P (Primary):** ZFS Pool on local [[NAS]] or [[Network/Services/Proxmox/index|Proxmox]] node (RAID-Z or Mirrored).
> **A (Alternate):** Automated ZFS Replication to a second ZFS node.
> **C (Contingency):** ZFS Snapshots sent via `zfs send/recv` to offsite storage.
> **E (Emergency):** Critical data backed up to an encrypted external drive (offline).

## SOP: Managing ZFS Snapshots
1. **Create:** `zfs snapshot poolname/dataset@20251028_backup`
2. **List:** `zfs list -t snapshot`
3. **Rollback:** `zfs rollback poolname/dataset@20251028_backup` (Note: This will delete newer snapshots!)
4. **Clean up:** `zfs destroy poolname/dataset@20251028_backup`

## Check for Understanding
- Why is ZFS considered "self-healing"? (Hint: Think about checksums).
- What is the main difference between a **Primary** pool (local) and an **Alternate** pool (replicated)?

---
*Related: [[Knowledge Base/NAS]], [[Proxmox Backup Server]], [[Knowledge Base/ZFS Backups]]*
