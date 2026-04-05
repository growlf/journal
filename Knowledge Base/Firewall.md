---
tags:
  - security
  - networking
  - firewall
---
# Firewall: The Perimeter Sentry

> [!NOTE] The Instructor's Perspective
> In the Army, we talk about "knowing your terrain." A firewall is your primary tool for defining the digital terrain of your network. If you don't control the flow of traffic, you don't own your network. For our labs, we're looking at things like [[pfSense]], [[OPNsense]], or even basic `iptables`/`nftables`.

## Why use it?
- **Perimeter Security:** Blocking the noise of the internet.
- **Segmentation:** Keeping your IoT "smart bulbs" away from your hypervisor and storage.
- **Visibility:** Logging what is trying to get in (and what is trying to "phone home").

## Firewall Reliability (The PACE Plan)
> [!TIP] Connectivity Discipline
> **P (Primary):** Dedicated hardware appliance (e.g., pfSense/OPNsense on a low-power PC).
> **A (Alternate):** Virtualized Firewall instance on your Hypervisor (e.g., [[Network/Services/Proxmox/index|Proxmox]]).
> **C (Contingency):** Secondary "Cold-Standby" hardware or a basic router with strict ACLs.
> **E (Emergency):** Direct connection with host-based firewalls (UFW/Firewalld) active on all critical nodes.

## Standard Operating Procedure (SOP) Best Practices
1. **Default Deny:** Start by blocking everything. Only open what is strictly necessary.
2. **Egress Filtering:** Control what your devices can reach on the internet.
3. **Log & Review:** A firewall you don't monitor is just a "manageable mess" waiting to happen. Use [[Grafana]] or [[NtopNG]] to see what's happening.

## Check for Understanding
- Why is a virtualized firewall (Alternate) generally less reliable than a physical one (Primary)?
- If you have to "Emergency" bypass your firewall, what host-level security must be in place?

---
*Related: [[Knowledge Base/Router]], [[Network/The Stack]], [[Security]]*
