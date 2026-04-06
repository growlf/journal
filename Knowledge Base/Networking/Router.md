---
tags:
  - networking
  - router
title: Router
---
# Router: The Traffic Controller

> [!NOTE] The Instructor's Perspective
> In the Army, we had "traffic control points." A router is your primary tool for directing data between different networks. If you don't have a reliable router, your data will be lost in a "manageable mess." For our labs, we're looking at things like [[pfSense]], [[OPNsense]], or even basic `iptables`/`nftables`.

## Why use it?
- **Network Segmentation:** Directing traffic between your "Lab" and "Personal" networks.
- **Path Selection:** Determining the most efficient path for data packets.
- **NAT (Network Address Translation):** Allowing multiple devices to share a single public IP address.

## Router Reliability (The PACE Plan)
> [!TIP] Connectivity Discipline
> **P (Primary):** Dedicated hardware router (e.g., pfSense/OPNsense on a low-power PC).
> **A (Alternate):** Virtualized Router instance on your Hypervisor (e.g., [[Network/Services/Proxmox/index|Proxmox]]).
> **C (Contingency):** Secondary "Cold-Standby" hardware or a basic router with strict ACLs.
> **E (Emergency):** Direct connection to the internet (with host-based firewalls active on all critical nodes).

## Standard Operating Procedure (SOP) Best Practices
1. **Redundancy:** Have a secondary router ready in case the primary one fails.
2. **Monitoring:** Use [[Grafana]] or [[NtopNG]] to monitor traffic flow.
3. **Firmware Updates:** Keep your router's firmware updated to ensure security.

## Check for Understanding
- Why is it important to have a dedicated hardware router (Primary) instead of a virtualized one (Alternate)?
- How does NAT (Network Address Translation) help in managing multiple devices on a single network?

---
*Related: [[Knowledge Base/Firewall]], [[Network/The Stack]], [[Security]]*
