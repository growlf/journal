---
title: rsync - The Swiss Army Knife of File Transfers
tags:
  - storage
  - backup
  - linux
  - shell
---
# rsync: The Swiss Army Knife of File Transfers

> [!NOTE] The Instructor's Perspective
> In the Army, we had "precision logistics." rsync is your precision tool for moving data. It's fast, efficient, and incredibly flexible. It only transfers the differences between the source and the destination, saving you massive amounts of time and bandwidth. If you're a Linux administrator, you *must* know how to use rsync.

## Why rsync?
- **Efficiency:** Only transfers the differences (deltas) between files.
- **Flexibility:** Can be used for local file copies, remote transfers via [[Knowledge Base/ssh|SSH]], and even full system backups.
- **Reliability:** Can resume interrupted transfers and preserves file permissions, timestamps, and symbolic links.
- **Power:** Includes hundreds of options for fine-tuning your transfers (e.g., `--archive`, `--compress`, `--delete`).

## File Logistics Reliability (The PACE Plan)
> [!TIP] Operational Discipline
> **P (Primary):** Automated rsync scripts (e.g., cron jobs) for periodic backups to your [[Knowledge Base/Storage/NAS|NAS]].
> **A (Alternate):** Manual rsync commands for one-off file transfers or migrations.
> **C (Contingency):** [[Knowledge Base/Services/Syncthing|Syncthing]] for automated, continuous file synchronization.
> **E (Emergency):** Direct `cp` or `scp` commands for basic file copies.

## Standard Operating Procedure (SOP): Moving Data with Precision
1. **Identify Source and Destination:** Where are the files now, and where do they need to go?
2. **Choose Your Options:** Use `-a` (archive mode) to preserve attributes, `-v` (verbose) to see what's happening, and `-z` (compress) to save bandwidth over a network.
3. **Dry Run First:** Always use `--dry-run` to see what rsync *would* do before actually doing it.
4. **Execute:** Run the command and monitor the progress.
5. **Verify:** Use `--checksum` or a manual check to ensure the files were transferred correctly.

## Check for Understanding
- Why is it important to use `--dry-run` before executing an rsync command? (Hint: Think about "human error").
- How does rsync's "delta transfer" algorithm save you time and bandwidth?

---
*Related: [[Network/The Stack]], [[Knowledge Base/ssh]], [[Knowledge Base/Storage/NAS]]*
