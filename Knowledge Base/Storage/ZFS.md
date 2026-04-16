---
tags:
  - filesystem
  - backup
  - data
  - documentation
  - glossary
Creation date: 2026-04-12 22:46
modification date: Monday 20th October 2025 19:41:27
Documentation: https://pve.proxmox.com/wiki/ZFS_on_Linux
aliases:
---
---
### Links
- [[Knowledge Base/Tricks/ZFS Backup]]
- [[NAS]]
- [[Knowledge Base/Tricks/Replicating my Desktop|rebuild]]
## 🧭 Why ZFS? (Purpose & Value)
In today's world of massive data and complex infrastructure, ZFS stands out as more than just a filesystem—it's a complete volume manager and data protection suite. For the NetYeti's grove, it is the **foundational soil** of the home lab.

### 🛡️ 1. Data Integrity (The Silent Guardian)
Unlike traditional filesystems, ZFS uses **checksums** for every block of data. It performs **Copy-on-Write (CoW)**, meaning old data is never overwritten until new data is safely written. This prevents "bit rot" and ensures that if a drive fails or data is corrupted, ZFS can detect it—and often fix it automatically if redundancy is present.

### ⚡ 2. Instant Snapshots & Clones
ZFS allows for near-instant snapshots that consume zero additional space initially. You can "freeze" the state of a VM or dataset before making changes. If things go sideways (and they will!), rolling back is instantaneous. This is a game-changer for testing and "breaking things safely."

### 🧊 3. Transparent Compression
ZFS can compress data on-the-fly (usually with `lz4` or `zstd`). In many cases, this actually **improves performance** because writing compressed data to the physical disk is faster than writing the raw, uncompressed blocks.

### 🌊 4. RAID-Z: Better Than Traditional RAID
RAID-Z (ZFS's implementation of RAID) eliminates the "write hole" found in traditional RAID controllers. It handles data striping and parity more efficiently and provides better protection against multiple drive failures.

### 📡 5. Remote Replication (`zfs send/recv`)
This is the "secret sauce" for offsite backups. ZFS can send the *difference* between two snapshots over the network. This makes syncing multi-terabyte datasets across the VPN (e.g., from Yeticraft to BMS) extremely efficient.

### ToDo
- [x] Document ZFS purpose and value in todays world of tech
- [ ] Demonstrate ZFS commandline tricks such as sending snapshots, fast volume creation and manipulation, NFS options, etc
