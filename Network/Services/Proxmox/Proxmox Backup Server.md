---
Ports: 8007
tags:
  - services
  - backup
  - proxmox
address: 
service description: Enterprise-class backup solution for Proxmox VE.
management_url: 
hosts:
Documentation: https://pbs.proxmox.com/docs/
---
# Proxmox Backup Server (PBS)

> In the Army, we had "PACE" plans. PBS is a key component of your backup (Alternate/Contingency/Emergency) strategy.

## Description
Proxmox Backup Server is an enterprise-class client-server backup software that backs up virtual machines, containers, and physical hosts. It's optimized for Proxmox VE environments and offers deduplication, compression, and authenticated encryption.

## Knowledge Check
- [ ] Have you set up a backup job for each of your critical VMs?
- [ ] Are you monitoring your PBS disk usage regularly?

## Common Pitfalls
- **Disk Performance**: Use SSDs or at least fast HDDs for the backup store to ensure timely backups and restores.
- **Verification**: Always verify your backups. A backup is only as good as its last successful restore test.
