---
title: SOP - Updating the Home Lab
tags:
  - sop
  - lab-maintenance
  - lab-ops
---
# SOP: Updating the Home Lab

> [!NOTE] The Instructor's Perspective
> In the Army, we had "maintenance schedules" for all our equipment. In your home lab, your software is that equipment. Updating your home lab isn't just about getting the latest features; it's about keeping your network secure and reliable. This SOP will ensure your lab stays in "mission-ready" condition.

## 1. Preparation (The Recon Phase)
- **Check for Updates:** Review the update logs for your hypervisor, firewall, and core services.
- **Review Release Notes:** Are there any breaking changes or critical security fixes?
- **Verify Backups:** Ensure your [[Proxmox Backup Server]] and [[Vaultwarden]] backups are current.

## 2. Maintenance (The Action Phase)
1. **Update Hypervisor:** Start with your [[Network/Services/Proxmox/index|Proxmox]] nodes. Use `apt update && apt dist-upgrade`.
2. **Update Firewall:** Check for updates for your [[Knowledge Base/Firewall|Firewall]].
3. **Update Core Services:** Update your [[Knowledge Base/DNS|DNS]], [[Knowledge Base/DHCP|DHCP]], and [[Vaultwarden]] services.
4. **Update LXCs and VMs:** Run `apt update && apt upgrade` on all your containers and virtual machines.
5. **Reboot if Necessary:** Some updates (like kernels) require a reboot to take effect.

## 3. Verification (The After Action Phase)
1. **Verify Services:** Ensure all your critical services are running and accessible.
2. **Check the Logs:** Review the logs for any errors or warnings.
3. **Verify Backups:** Ensure that your backups are still working after the updates.
4. **Conduct an AAR:** Use the [[_assets/_templates/AAR|AAR template]] to document any issues or unexpected behaviors.

## 4. Lab Maintenance Reliability (The PACE Plan)
> [!TIP] Operational Discipline
> **P (Primary):** Regular, automated updates for all core services.
> **A (Alternate):** Manual updates for complex or critical services.
> **C (Contingency):** Roll back to the previous snapshot or backup if an update fails.
> **E (Emergency):** Re-install the service from scratch using an [[Ansible]] playbook.

## Check for Understanding
- Why should we update our hypervisor (Primary) before our virtual machines (Alternate)?
- What happens if an update fails? (Hint: Check your **Contingency** plan).

---
**Status:** (Complete / In-Progress)
**Related Tasks:** 
- [ ] Conduct AAR
- [ ] Update documentation
- [ ] Share with community
