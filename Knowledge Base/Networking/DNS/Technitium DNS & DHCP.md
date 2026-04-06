---
title: "Technitium DNS & DHCP: The Traffic Hub"
tags:
  - dns
  - dhcp
  - networking
  - self-hosted
  - lab-infrastructure
management_url: "http://<technitium-ip>:5380"
hosts:
  - "[[dnssvr]]"
is_service: true
---
# Technitium DNS & DHCP: The Traffic Hub

> [!NOTE] The Instructor's Perspective
> In the Army, "communications" were the lifeblood of every operation. If you can't reach your peers, you're just a lone soldier in the dark. In your lab, DNS and DHCP are those communications. Technitium is my personal favorite because it's a "Swiss Army Knife" for local network management. It's powerful, easy to manage, and gives you complete control over your "digital terrain."

## Why Technitium?
- **All-in-One:** Handles both DNS and DHCP in a single, clean web interface.
- **Privacy-Focused:** Built-in support for DNS-over-HTTPS (DoH) and DNS-over-TLS (DoT).
- **Ad-Blocking:** Includes a "Block List" feature (similar to Pi-hole or AdGuard Home).
- **Split-Horizon DNS:** Easily point `journal.yeticraft.net` to a local IP when you're at home and a public IP when you're away.
- **API-First:** Everything you can do in the GUI, you can do with a REST API—perfect for [[Knowledge Base/Development/Ansible/index|Ansible]] automation.

## DNS/DHCP Reliability (The PACE Plan)
> [!TIP] Information Discipline
> **P (Primary):** Technitium DNS & DHCP (Main LXC on [[Network/Services/Proxmox/index|Proxmox]]).
> **A (Alternate):** Secondary Technitium node (Synchronized via API or manual export).
> **C (Contingency):** Public DNS providers (e.g., 1.1.1.1, 8.8.8.8) with static IP reservations on critical nodes.
> **E (Emergency):** Hardcoded `/etc/hosts` and manual static IP configuration for management interfaces.

## Standard Operating Procedure (SOP): Setting the Hub
1. **Deploy:** Use the [Proxmox VE Helper Script](https://community-scripts.github.io/ProxmoxVE/scripts?id=technitiumdns) to spin up an LXC.
2. **Configure Zones:** Create your local domain zone (e.g., `.home.arpa` or a subdomain of your public domain).
3. **Set Up DHCP:** Define your IP pools and create reservations for your servers and infrastructure.
4. **Enable Forwarders:** Use privacy-focused forwarders like Quad9 or Cloudflare with DoH enabled.
5. **Verify:** Use `dig` or `nslookup` on your clients to ensure names are resolving correctly.

## Check for Understanding
- Why is "Split-Horizon DNS" important for a home lab? (Hint: Think about your public-facing [[Knowledge Base/Networking/Domain|Domain]]).
- If your Primary Technitium node fails, how do your clients know where the Alternate node is? (Hint: Check your **DHCP Scope** settings).

---
*Related: [[Knowledge Base/Networking/DNS/index]], [[Knowledge Base/Networking/DHCP]], [[Network/The Stack]]*