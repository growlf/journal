---
tags:
  - lab
  - projects
  - linux
  - proxmox
  - networking
Creation date: Monday April 4th 2022 11:18:30
aliases:
  - Home Lab
---
## 1) Initial documentation tools
[[Obsidian]] is free and super extendable - with collaboration. Notes, mind-storming, and journaling with [[GitHub-Quartz-Obsidian]]. Documentation is *very* important! Start with something like Obsidian and generate a documented plan before beginning to build your home-lab.Like this document, really.
## 2) Basic Infrastructure tools:
The basics of a home-lab.  Start with 1 and finish with 11.  Doing them in order kinda helps.
1) [[Hardware]] - Router, server hardware, storage hardware, WiFi, etc
2) [[Domain]] - registrar, etc
3) [[Proxmox]] - This will be the home of "all the things" virtual
4) [[Apt Cacher NG]] - Speed up deployments and reduce bandwidth to the internet
5) [[Technitium]] - Internal DNS
6) [[Vaultwarden]] - Secrets management
7) [[Homepage]] - A place to link to "all the things" (aka - "The One Ring")
8) [[Wireguard]] - Remote, secure, VPN access. Alternatively use [[Tailscale]] if no static IP address is available.
9) [[Registry]] with Registry-UI - a local, secure, caching (pull thruogh) Docker registry to speed deployments and reduce bandwith to the internet. Also adds some developmental options and a layer of security
10) [[PXEBoot]] - for staging and thick clients
11) [[Portainer]] and [[Docker]]
## 3) Basic Monitoring Tools
- [[NtopNG]] - IDS, monitoring, alerting, and debugging
- [[Grafana]] with all the extras and supporting cast
## 4) Backups and File Access
- [[Proxmox Backup Server]]
- [[SyncThing]] - File backup and sharing/collaberating
- RSync - System backup solution
- [FileBrowser Quantum](https://github.com/gtsteffaniak/filebrowser) - Easy file access tool for various other services/apps (can be added to any LXC or VM that does not have a file access GUI but needs one)
## Standalone/external configs/services/apps
- Email - Necessary - alerts, updates, etc. Mail server - MailU ?
- Discord - Optional Social
- Slack - Optional social
- [[ssh]] - Necessary - Remote access and administration
## Other Useful services
- [[WorkAdventure]] - For social hybrid scenarios as well as possible contact tool
- [[Nextcloud]] - All 'round collaboration tool
- [Leantime](https://docs.leantime.io/) - Project management (calendar, project, tickets)
- [Leantime](https://leantime.io/) [Openproject](https://www.openproject.org/)- Project management
- [ESPHome](https://esphome.io/index.html)- Easy deployment to ESP32 and similar IoT hardware
- [HomeAssistant](https://www.home-assistant.io/docs/) or [N8N](https://docs.n8n.io/) - Home automation
- [NodeRed](https://nodered.org/docs/) or [N8N](https://docs.n8n.io/) - Process flow
- [[Wordpress]] or [[DjangoCMS]]- Main web presence
- Draw.io and Google Drive