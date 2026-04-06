---
Ports: 8007
tags:
  - services
  - backup
  - proxmox
  - lab-ops
service description: Enterprise-class backup solution for Proxmox VE.
management_url: "https://<pbs-ip>:8007"
---
# Proxmox Backup Server (PBS)

> [!NOTE] The Instructor's Perspective
> In the Army, we had "recovery plans." A backup you haven't tested is just a "manageable mess" in waiting. PBS is your enterprise-class solution for ensuring that when (not if) a server fails, you're back in the fight within minutes. It's an essential part of your "recovery discipline."

## Why use it?
- **Incremental Backups:** Only the changes (deltas) are transferred, making backups near-instant.
- **Deduplication:** Save massive amounts of space on your [[Knowledge Base/Storage/NAS|NAS]] or backup storage.
- **Durable Encryption:** Your backups are encrypted before they ever leave the hypervisor.
- **Verification:** Automatically checks the integrity of your backups periodically.

## Backup Reliability (The PACE Plan)
> [!TIP] Recovery Discipline
> **P (Primary):** Proxmox Backup Server (Dedicated LXC or VM on local storage).
> **A (Alternate):** Automated offsite synchronization to a secondary PBS or local [[Knowledge Base/Storage/NAS|NAS]] via [[Knowledge Base/Development/Shell/RSync|RSync]].
> **C (Contingency):** Proxmox "VZDump" backups (Standard Proxmox backups) to a separate network share.
> **E (Emergency):** Critical data (e.g., [[Knowledge Base/Services/Vaultwarden|Vaultwarden]] DB) copied to an encrypted physical USB drive.

## Standard Operating Procedure (SOP): Managing Your Backups
1. **Define Your Scope:** Decide what *must* be backed up every night and what can wait for a weekly job.
2. **Configure Storage:** Set up a dedicated data store for your backups. SSDs are highly recommended for performance.
3. **Automate:** Use the Proxmox VE interface to schedule daily, incremental backups for every critical VM and container.
4. **Prune and Verify:** Set a retention policy (e.g., keep 7 days, 4 weeks, 6 months) and enable periodic verification.
5. **Test a Restore:** Once a month, restore a non-critical VM to ensure your "recovery discipline" is sound.

## Check for Understanding
- Why is it important to test your restore process? (Hint: Think about "human error").
- How does "Deduplication" save you money on storage hardware?

---
*Related: [[Network/Services/Proxmox/index]], [[Network/The Stack]], [[Policies/SOP - Updating the Home Lab]]*
