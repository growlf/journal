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
## 1) Infrastructure tools:
The basics of our lab.  Start with 1 and finish with 10.  Doing them in order kinda helps.
1) [[journal/docs/Glossary/Hardware|Hardware]] - Router, server hardware, storage hardware, WiFi, etc
2) [[Domain]] - registrar, etc
3) [[Proxmox]] - This will be the home of "all the things"
4) [[Apt Cacher NG]] - Speed up deployments and reduce bandwidth to the internet
5) [[Technitium]] - Internal DNS
6) [[Vaultwarden]] - Secrets management
7) [[Homepage]] - A place to link to "all the things" (the one ring)
8) [[Wireguard]] - Remote, secure, access
9) [[Registry]] with Registry-UI - a local, secure, caching (pull thruogh) Docker registry to speed deployments and reduce bandwith to the internet. Also adds some developmental options
10) [[PXEBoot]] - for staging and thick clients- [[Portainer]] and/or [[Komodo]]
## 2) Documentation, Wiki, and Web
- [[GitHub-Quartz-Obsidian]] (great for personal journaling)
- [[Wordpress]] - Main web presence
- [[Obsidian]] - Notes and mindstorming
- [[Draw.io]] and [[Google Drive]]
## 3) Backups and File Access
- [[Proxmox Backup Server]]
- [[SyncThing]] - File backup and sharing/collaberating
- [[RSync]] - System backup solution
- [[FileBrowser Quantum]] - Easy file access tool for various other services/apps (can be added to any LXC or VM that does not have a file access GUI but needs one)
## 4) Monitoring Tools
- [[NtopNG]] - IDS, monitoring, alerting, and debugging
- [[NetalertX]] - monitoring
- [[LibreNMS]] - monitoring and alerting
- [[Grafana]] with [[Prometheus]], [[Promtail]], and [[CAdvisor]] (and others)
## Standalone/external configs/services/apps
- [[email]] - alerts, updates, etc
- [[Discord]] - Social
- [[Slack]] - Optinal social
- [[SSH]] - Remote access and administration
- [[Mail server]] - MailU ?
## Other Useful services
- [[WorkAdventure]] - For social hybrid scenarios as well as possible contact tool
- [[Nextcloud]] - All 'round collaboration tool
- [[Leantime]] Project management (calendar, project, tickets)
- [[Tailscale]] - VPN for everyone
- [Leantime](https://leantime.io/) [Openproject](https://www.openproject.org/)- Project management
- [ESPHome](https://esphome.io/index.html)- Easy deployment to ESP32 and similar IoT hardware
- HomeAssistant - Home automation
- NodeRed - Process flow
