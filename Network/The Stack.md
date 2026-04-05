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
The following is an opinionated list of services and hardware that will easily create a reliable and useful home-lab up and running in no time - for little cost (if any).
## 1) Initial Software and Knowledge
- **Documentation tool** - Necessary
  [[Obsidian]] is a free and super extendable note-taking application. Notes, mind-storming, and even publishing a blog using [[GitHub-Quartz-Obsidian]] is possible. Documentation is *very* important! Start with something like Obsidian and generate a documented plan before beginning to build your home-lab. Rather like this document, really.
- **Password manager** - Necessary
  [Bitwarden](https://bitwarden.com/) is a fantastic option.  If you don't already have one, this one is free. We can even set up a self hosted open-source version of the server later on if you need to expand your user base beyond the free version (i.e. [[Vaultwarden]]).
- **Email** - Necessary
  GMAIL works fine. You will want an account for alerts, updates, etc.  I recommend an email provider that also offers SSO.
- **Collaboration** - Optional - but really, you are going to want it.
	- Discord
	- Slack
	- Social meetups with peers and mentors
- **SSH** - Necessary
  [[ssh]] is what we will use for remote access and administration.  Know how to use it, and have some published keys ready.
- **GIT** - Necessary
  [[Knowledge Base/GIT|GIT]] is better than a simple backup, it's version control.  We will be using knowledge of git quite a bit while building our lab, so make sure you are ready for that.
- **[[MFA]]** - Necessary
  If you have not heard of [[MFA|Multi-Factor-Authentication]], stop now and read up on it. Even if you are not going to build a home-lab, you should be using a password manager and MFA on all of your accounts that support it. Maybe consider replacing any services that do not implement it.
## 2) Initial Hardware Components
Beyond the obvious cabling and individual system's LAN network interfaces, we will use the following:
- A Modem/internet-interface with service to the internet (cable, fiber, DSL, etc)
  Your existing residential connection can provide what is needed for this - without many changes)
- Router system ([[Network/Devices/Router|Router]]) - This can be a very basic device, initially.
- Firewall system ([[Network/Devices/Router|Router]]) - This can also be a very simple solution initially.
- WiFi access point ([[Ubiquiti UAP-AC-PRO|WiFi Access Point]])
- DNS Server ([[Technitium DNS & DHCP]])
  > [!TIP] DNS PACE Plan
  > **P (Primary):** Internal [[Technitium DNS & DHCP]] (Primary node)
  > **A (Alternate):** Secondary Technitium node or [[AdGuard Home]] instance
  > **C (Contingency):** Upstream ISP or Public DNS (e.g., 8.8.8.8, 1.1.1.1)
  > **E (Emergency):** Hardcoded IPs in critical hosts files (e.g., `/etc/hosts`)

- DHCP Server ([[Technitium DNS & DHCP]])

In most residential environments, you will find most of these in a *single* device that is installed by the ISP - but you will have little actual control over it. We want to have individual devices for each purpose in our home-lab - and complete control.

Other hardware to include:
- One (or more) user stations: laptops, desktops, etc. You probably already have these.
- One (or more) Hypervisor server supporting VT-X or AMD-v and hyper-threading. This can initially be just an old laptop or desktop. Preferably one with ample CPU and RAM.
- NAS (one is good, two is better) with ample storage. Make sure this one has at least a terabyte of storage - preferably multiple drives and not one monolithic one. CPU and RAM are not as much of a concern on this system.
## 3) Assemble The Basic Infrastructure:
The basics of a home-lab.  Start with 1 and finish with 11.  Doing them in order kinda helps.
1) [[Hardware]] - Router, server hardware, storage hardware, WiFi, etc (see above)
2) [[Domain]] - registrar, etc
3) [[Network/Services/Proxmox/index]] - This will be the home of "all the things" virtual
4) [[Knowledge Base/Apt Cacher NG|Apt Cacher NG]] - Speed up deployments and reduce bandwidth to the internet
5) [[Technitium DNS & DHCP]] - Internal DNS and DHCP
6) [[Vaultwarden]] - Secrets management
7) [[Homepage]] or [[GitHub-Quartz-Obsidian]] - A place to link to "all the things" (aka - "The One Ring")
8) [[Wireguard]] - Remote, secure, VPN access. Alternatively use [[Tailscale]] if no static IP address is available
9) [[Docker Registry]] with a Registry-UI - a local, secure, caching (pull thruogh) Docker registry to speed deployments and reduce bandwith to the internet. Also adds some developmental options and a layer of security
10) [[PXEBoot]] - for staging and thick clients
11) [[Portainer]] and [[Knowledge Base/Docker/index|Docker]]
12) [[Ollama]] or [[LocalAI]] - Local LLM infrastructure for the **P (Primary)** AI layer.
## 4) Monitoring
- [[Knowledge Base/Monitoring|Monitoring]] - IDS, monitoring, alerting, and debugging using [[NtopNG]] and [[Grafana]].
  > [!TIP] Monitoring PACE Plan
  > **P (Primary):** Centralized Monitoring Node ([[Grafana]] + [[InfluxDB]]/[[Prometheus]]).
  > **A (Alternate):** Real-time network analysis with [[NtopNG]].
  > **C (Contingency):** Basic host-based monitoring (e.g., `top`, `htop`, `nload`).
  > **E (Emergency):** Direct log review with `journalctl` or `/var/log/`.
## 5) Backups and File Access
- [[Proxmox Backup Server]]
  > [!TIP] Backup PACE Plan
  > **P (Primary):** Local [[Proxmox Backup Server]] (Automated daily)
  > **A (Alternate):** RSync to a secondary local NAS
  > **C (Contingency):** Offsite/Cloud backup (e.g., Backblaze B2 or S3)
  > **E (Emergency):** Critical data copied to an encrypted physical USB drive stored in a fire-safe
- [[SyncThing]] - File backup and sharing/collaberating
- RSync - System backup solution
- [FileBrowser Quantum](https://github.com/gtsteffaniak/filebrowser) - Easy file access tool for various other services/apps (can be added to any LXC or VM that does not have a file access GUI but needs one)

-----
## Other Useful Services
- [[WorkAdventure]] - For social hybrid scenarios as well as possible contact tool
- [Leantime](https://docs.leantime.io/) - Project management (calendar, project, tickets)
- [Leantime](https://leantime.io/) [Openproject](https://www.openproject.org/)- Project management
- [ESPHome](https://esphome.io/index.html)- Easy deployment to ESP32 and similar IoT hardware
- [HomeAssistant](https://www.home-assistant.io/docs/) or [N8N](https://docs.n8n.io/) - Home automation
- [NodeRed](https://nodered.org/docs/), [N8N](https://docs.n8n.io/) - Process flow
- [[Wordpress]], [[DjangoCMS]] - Web presence/site
- Draw.io
- Google Drive
- ... you name it! The 'net is your kingdom now!
