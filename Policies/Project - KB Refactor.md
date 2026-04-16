---
tags:
  - project
  - documentation
  - refactor
date: 2026-04-15
status: in-progress
---
# Project: Knowledge Base Refactor (Pruning the Grove)

## 🎯 Objective
To categorize and condense the `Knowledge Base/` directory to reduce menu impact and improve findability. This follows the NetYeti's "Forest Management" philosophy—keeping the grove well-pruned.

## 📋 Plan of Action
1.  **Merge `Tricks 1` into `Tricks`:**
    *   Move unique files from `Knowledge Base/Tricks 1/` to `Knowledge Base/Tricks/`.
    *   For duplicates (`LXC Desktop.md`, `Replicating my Desktop.md`, `Wireguard Search Domain.md`, `ZFS Backup.md`), retain the version in `Tricks/` as it is more comprehensive.
    *   Move the `Examples/` folder from `Tricks 1/` to `Tricks/`.
    *   Delete the `Tricks 1/` directory.
2.  **Categorize Loose Files in `Knowledge Base/`:**
    *   Move files to their logical subdirectories:
        *   **Virtualization:** `Cloud Init.md`, `LXC.md`
        *   **Networking:** `DHCP.md`, `DNS.md`, `Domain.md`, `Firewall.md`, `ISP.md`, `Router.md`, `WiFi.md`, `PXEBoot.md`, `ssh.md`
        *   **Services:** `Email.md`
        *   **Development:** `GIT.md`, `Github Workflow.md`
        *   **Hardware:** `Hardware.md`
        *   **LLM:** `LLM.md`
        *   **Tools:** `Mark Down.md`, `Obsidian.md`
        *   **Storage:** `NAS.md`, `ZFS Backups.md`, `ZFS.md`
3.  **Synchronize Indices:**
    *   Run the `chronicler` to refresh all `DATAVIEW_PUBLISHER` blocks.
4.  **Verification:**
    *   Perform a final `ls` check to ensure the root of `Knowledge Base/` only contains subdirectories and the primary `index.md`.

## 🛡️ Optimization & Safety
*   **Safety:** Use `mv -n` to avoid accidentally overwriting more recent versions if they exist.
*   **Optimization:** Perform moves in bulk via shell script to minimize turn count.

## 📈 Status Update
- [x] Merge `Tricks 1` into `Tricks`.
- [x] Categorize loose files.
- [x] Refresh Dataview Publisher blocks.
- [x] Final cleanup and verification.

## ✅ Final Solution Synopsis
The Knowledge Base has been successfully pruned and reorganized. 
1.  **Consolidation:** `Tricks 1` was merged into `Tricks`, preserving the most comprehensive versions of documentation.
2.  **Categorization:** 21 loose Markdown files were relocated from the `Knowledge Base/` root into thematic subdirectories (`Networking/`, `Virtualization/`, `Storage/`, etc.).
3.  **Synchronization:** The `chronicler` minion successfully refreshed all `DATAVIEW_PUBLISHER` blocks, ensuring that all index pages accurately reflect the new structure.
4.  **Signal Integrity:** All internal WikiLinks referencing relocated files were updated to maintain signal parity across the vault.

The grove is now leaner, more professional, and easier to navigate.
