---
tags:
  - networking
  - dhcp
title: "DHCP: Automated Address Distribution"
---
# DHCP: Automated Address Distribution

> [!NOTE] The Instructor's Perspective
> In the Army, we had a "Quartermaster" who would issue equipment and supplies to each soldier. In your home lab, DHCP (Dynamic Host Configuration Protocol) is that Quartermaster. It's an automated way to assign IP addresses and other network settings to all your devices. Without it, you'd be manually assigning addresses for every single machine, which is a "manageable mess" that quickly becomes intractable.

## Why use it?
- **Ease of Use:** Devices "just work" when they join your network.
- **Consistency:** Centralized management of your IP address pool.
- **Efficiency:** Drastically reduces the time you spend on manual configuration.

## DHCP Reliability (The PACE Plan)
> [!TIP] Connectivity Discipline
> **P (Primary):** Internal [[Technitium DNS & DHCP]] (Primary node).
> **A (Alternate):** Secondary Technitium node or a basic router with DHCP active.
> **C (Contingency):** Dedicated host-based DHCP (e.g., `isc-dhcp-server` on a standalone LXC).
> **E (Emergency):** Static IP addresses for critical hosts (configured manually).

## Standard Operating Procedure (SOP) Best Practices
1. **Scope Management:** Define your IP address pool clearly.
2. **Reservations:** Use static DHCP reservations for core services to ensure they always have the same IP address.
3. **Lease Times:** Set lease times that balance efficiency and network dynamics.

## Check for Understanding
- Why should we use **DHCP Reservations** (Primary) instead of just relying on the default address assignment (Alternate)?
- How does the "Static IP" plan (Emergency) help if your DHCP Quartermaster is offline?

---
*Related: [[Knowledge Base/DNS/index|DNS]], [[Network/The Stack]], [[Knowledge Base/Firewall]]*
