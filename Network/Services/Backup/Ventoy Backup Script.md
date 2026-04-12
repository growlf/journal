---
title: Ventoy - Portable Backup Toolkit
tags:
  - backup
  - ventoy
  - rsync
  - ext4
---

# Ventoy Portable Backup Toolkit

The NetYeti's "to-go" backup solution. This script is stored on the Ventoy drive and is designed to provide incremental, point-in-time snapshots of any Linux system it is plugged into.

## Location
- **Path:** `/media/netyeti/Ventoy/bin/backup`
- **Drive:** Ventoy (1TB External SSD)

## The Strategy
We use `rsync` with the `--link-dest` flag to create **hard-linked snapshots** on an `ext4` partition. This provides a "Time Machine" style experience:
- **Primary (P):** Full, point-in-time snapshot of `/home` and `/etc`.
- **Space Efficiency:** Unchanged files are hard-linked to the previous snapshot, consuming zero additional disk space.
- **Portability:** Being on the Ventoy drive, it can be executed from a live environment or a running system.

## The "Smart Rewire" (Self-Elevation)
As of April 10, 2026, the script has been upgraded to **self-elevate**. 
If run by a standard user, it will detect that it is not root and re-execute itself using `sudo`.

```bash
# --- Self-Elevation ---
# Re-execute as root if not already running as root.
if [[ $EUID -ne 0 ]]; then
    exec sudo "$0" "$@"
fi
```

## Key Features
- **Retention:** Automatically keeps the last 30 snapshots (configurable).
- **Compare Mode:** Can diff a snapshot against current files (`--compare`).
- **Safety:** Verifies the target filesystem is `ext4` before starting (hard links won't work on FAT/exFAT).

## Usage
```bash
# Standard backup
/media/netyeti/Ventoy/bin/backup

# Dry run (see what changed)
/media/netyeti/Ventoy/bin/backup --dry-run

# Compare current files to a specific snapshot
/media/netyeti/Ventoy/bin/backup --compare 2026-03-20_003609
```

> [!CAUTION] The "ext4" Requirement
> This script **requires** the backup target (`BACKUP_ROOT`) to be an `ext4` partition. If you try to run it on the Ventoy's main exFAT partition, it will fail to create hard links and error out.

---
*Related: [[Knowledge Base/Storage/ZFS Backups]], [[Knowledge Base/Development/Shell/RSync]]*
