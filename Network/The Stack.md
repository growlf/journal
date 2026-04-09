---
banner: "![[datacenter.jpeg]]"
tags:
  - lab
  - projects
  - linux
  - proxmox
  - networking
Creation date: Monday April 4th 2022 11:18:30
aliases:
  - Home Lab
content-start: 301
---
# The Stack: Your Home Lab Blueprint

> [!NOTE] The Instructor's Perspective
> In the Army, we had an "Operations Order" (OPORD). This is your OPORD for the home lab. It's an opinionated list of services and hardware that will get you a reliable, useful lab for little-to-no cost. We're building a "force multiplier" for your learning journey.

## 1) Initial Software and Knowledge
- **Documentation tool** - *Necessary*
  [[Knowledge Base/Development/Obsidian/index|Obsidian]] is your tactical notebook. Start here. Use [[Knowledge Base/Development/Obsidian/GitHub-Quartz-Obsidian|GitHub-Quartz-Obsidian]] to publish your journey. Documentation is the difference between a "manageable mess" and a "total disaster."
- **Password manager** - *Necessary*
  [Bitwarden](https://bitwarden.com/) is great, but we'll eventually self-host [[Knowledge Base/Services/Vaultwarden|Vaultwarden]]. Never, ever reuse passwords.
- **Email** - *Necessary*
  GMAIL is fine, but look for a provider that supports SSO for your lab services.
- **SSH** - *Necessary*
  [[Knowledge Base/Development/ssh|SSH]] is how we "reach out and touch" our servers. Know your keys!
- **GIT** - *Necessary*
  [[Knowledge Base/Development/GIT|GIT]] is your "undo" button. If you don't use version control, you're living dangerously.
- **MFA** - *Necessary*
  [[Knowledge Base/Services/MFA|Multi-Factor-Authentication]] is non-negotiable. If a service doesn't support it, consider it a "security risk."

## 2) Initial Hardware Components
Beyond the obvious cabling, we'll use:
- **Modem/ISP:** Your existing residential connection is fine for the "Recon Phase."
- **Router & Firewall:** Initially, your ISP's "all-in-one" is okay, but we'll move to [[Knowledge Base/Networking/Router|pfSense or OPNsense]] for "complete control."
- **WiFi Access Point:** [[Ubiquiti UAP-AC-PRO|Ubiquiti]] or similar for reliable wireless.
- **DNS & DHCP Server:** [[Knowledge Base/Networking/DNS/Technitium DNS & DHCP|Technitium]] is the "Swiss Army Knife" for this role.
- **Hypervisor Server:** An old laptop or desktop with VT-x/AMD-v support. This is where [[Network/Services/Proxmox/index|Proxmox]] lives.
- **NAS:** A dedicated storage pillar (one is good, two is better). See [[Knowledge Base/Storage/NAS|NAS]].

## 3) Assemble The Basic Infrastructure
Follow this sequence to build your "Command Center":
1.  **[[Knowledge Base/Hardware/Hardware|Hardware]]:** The physical foundation.
2.  **[[Knowledge Base/Networking/Domain|Domain]]:** Your lab's "Address Book."
3.  **[[Network/Services/Proxmox/index|Proxmox VE]]:** The home for "all the things" virtual.
4.  **[[Knowledge Base/Virtualization/Apt Cacher NG|Apt-Cacher NG]]:** Bandwidth discipline for Linux updates.
5.  **[[Knowledge Base/Networking/DNS/Technitium DNS & DHCP|Technitium]]:** Internal DNS and DHCP (The Traffic Hub).
6.  **[[Knowledge Base/Services/Vaultwarden|Vaultwarden]]:** The Armory of Secrets.
7.  **[[Knowledge Base/Services/Homepage|Homepage]]:** Your Dashboard for "All the Things."
8.  **[[Knowledge Base/Networking/Wireguard|WireGuard]] / [[Knowledge Base/Networking/Tailscale|Tailscale]]:** Secure remote access (The Stealth Mode).
9.  **[[Knowledge Base/Virtualization/Docker/Docker Registry|Docker Registry]]:** Local image cache for faster deployments.
10. **[[Knowledge Base/Virtualization/PXEBoot|PXE Boot]]:** Rapid staging and network booting.
11. **[[Knowledge Base/Virtualization/Docker/Portainer|Portainer]] & [[Knowledge Base/Virtualization/Docker/index|Docker]]:** Container management made easy.
12. **[[Network/Services/Ollama/index|Ollama]] / [[Network/Services/Open-WebUI/index|Open WebUI]]:** Your Local AI "Force Multiplier" and Frontend.
13. **[[Knowledge Base/LLM/OpenClaw|OpenClaw]]:** Your AI "Command and Control" (C2) layer. Orchestrates LLMs and provides tool access (Gog/Places, Search, Shell).

## 4) Monitoring & Visibility
- **[[Knowledge Base/Services/Monitoring/index|Monitoring]]:** IDS and dashboarding using [[Knowledge Base/Services/Monitoring/NtopNG|NtopNG]] and [[Knowledge Base/Services/Monitoring/Grafana|Grafana]]. If you can't see it, you can't defend it.

## 5) Backups and File Access
- **[[Network/Services/Proxmox/Proxmox Backup Server|Proxmox Backup Server]]:** Your "Recovery Plan."
- **[[Knowledge Base/Services/Syncthing|Syncthing]]:** Decentralized file sync.
- **[[Knowledge Base/Development/Shell/RSync|RSync]]:** Precision file logistics.
- **[FileBrowser Quantum](https://github.com/gtsteffaniak/filebrowser):** Easy GUI for file management.

---

> [!CHECK] NetYeti Knowledge Check
> - Can you explain why we deploy these in a specific order?
> - Which service in "The Stack" is your "Primary" layer for remote access?
> - Is your "Manageable Mess" currently documented in [[Knowledge Base/Development/Obsidian/index|Obsidian]]?

*Related: [[Network/Home Lab 101]], [[Policies/SOP - Updating the Home Lab]]*
