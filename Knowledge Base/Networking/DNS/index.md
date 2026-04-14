---
tags:
  - networking
  - dns
title: DNS
---
# DNS: The Network's Translator

> [!NOTE] The Instructor's Perspective
> In the Army, we had "radio callsigns" for all our units. You don't have to remember every single person's name or number; you just need to know their callsign. In your home lab, DNS (Domain Name System) is that callsign-to-identity translator. It turns human-readable names like `web-server-01.lab` into IP addresses like `10.0.0.50`. Without it, you'd be "walking point" without a map.

## Why use it?
- **Ease of Access:** Access your services by name instead of IP address.
- **Service Discovery:** Find other services on your network automatically.
- **PXEBoot Integration:** Necessary for booting systems over the network.
- **Security:** Block malicious domains using DNS sinkholes.

## DNS Reliability (The PACE Plan)
> [!TIP] Connectivity Discipline
> **P (Primary):** Internal [[Technitium DNS & DHCP]] (Primary node).
> **A (Alternate):** Secondary Technitium node or a basic router with DNS active.
> **C (Contingency):** Upstream ISP or Public DNS (e.g., 8.8.8.8, 1.1.1.1).
> **E (Emergency):** Hardcoded IPs in critical hosts files (e.g., `/etc/hosts`).

## Standard Operating Procedure (SOP) Best Practices
1. **Split DNS:** Use a separate DNS zone for your "Lab" and "Personal" traffic.
2. **Recursive DNS:** Configure your DNS server to handle its own recursive lookups for better privacy.
3. **Redundancy:** Have a secondary DNS server ready in case the primary one fails.

## Check for Understanding
- Why should we use **Internal DNS** (Primary) instead of just relying on our ISP's DNS (Alternate)?
- How does the "Hardcoded IP" plan (Emergency) help if your DNS Translator is offline?

---
*Related: [[Knowledge Base/DHCP]], [[Learning/Home-Lab-Series/Default-Stack-Blueprint|The Stack]], [[Knowledge Base/Firewall]]*
