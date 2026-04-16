---
title: Knowledge Base
---
## Contents:
%% DATAVIEW_PUBLISHER: start
```dataview
TABLE join(sort(rows.file.link), " | ") as Documents
FLATTEN regexreplace(file.folder, ".*/", "") as lastPart
WHERE contains(file.folder, this.file.folder)
GROUP BY lastPart as Folder
SORT lastPart
```
%%

| Folder | Documents |
| --- | --- |
| Community | [[Knowledge Base/Community/CAB|CAB]] | [[Knowledge Base/Community/Discord Linkable ID|Discord Linkable ID]] | [[Knowledge Base/Community/FLOSS|FLOSS]] | [[Knowledge Base/Community/Mentor-based Internship|Mentor-based Internship]] |
| Development | [[Knowledge Base/Development/Ansible/Ansible Vault|Ansible Vault]] | [[Knowledge Base/Development/Ansible/Ansible config file|Ansible config file]] | [[Knowledge Base/Development/Ansible/Best Practices|Best Practices]] | [[Knowledge Base/Development/Ansible/Inventory|Inventory]] | [[Knowledge Base/Development/Ansible/Jinja Templating|Jinja Templating]] | [[Knowledge Base/Development/Ansible/Playbook|Playbook]] | [[Knowledge Base/Development/Ansible/Roles|Roles]] | [[Knowledge Base/Development/Ansible/Troubleshooting|Troubleshooting]] | [[Knowledge Base/Development/Ansible/Variables|Variables]] | [[Knowledge Base/Development/GIT|GIT]] | [[Knowledge Base/Development/Github Workflow|Github Workflow]] | [[Knowledge Base/Development/Mark Down|Mark Down]] | [[Knowledge Base/Development/Obsidian/Couch DB Tricks|Couch DB Tricks]] | [[Knowledge Base/Development/Obsidian/CouchDB Deployment Files|CouchDB Deployment Files]] | [[Knowledge Base/Development/Obsidian/Create a CouchDB User Account|Create a CouchDB User Account]] | [[Knowledge Base/Development/Obsidian/Form Test|Form Test]] | [[Knowledge Base/Development/Obsidian/GitHub-Quartz-Obsidian|GitHub-Quartz-Obsidian]] | [[Knowledge Base/Development/Obsidian/Joining to Obsidian LiveSync|Joining to Obsidian LiveSync]] | [[Knowledge Base/Development/Obsidian/Obsidian Plugins|Obsidian Plugins]] | [[Knowledge Base/Development/Obsidian/Tasks|Tasks]] | [[Knowledge Base/Development/Obsidian/_design|_design]] | [[Knowledge Base/Development/Shell/RSync|RSync]] | [[Knowledge Base/Development/Shell/Shell (921428)|Shell (921428)]] | [[Knowledge Base/Development/ssh|ssh]] |
| Hardware | [[Knowledge Base/Hardware/E-Ink Tags|E-Ink Tags]] | [[Knowledge Base/Hardware/Gizmos|Gizmos]] | [[Knowledge Base/Hardware/Hardware|Hardware]] | [[Knowledge Base/Hardware/UPS|UPS]] | [[Knowledge Base/Hardware/Ubiquiti UAP-AC-PRO|Ubiquiti UAP-AC-PRO]] | [[Knowledge Base/Hardware/Zigbee|Zigbee]] |
| LLM | [[Knowledge Base/LLM/2026-04-06-The-Docker-SYCL-Victory|2026-04-06-The-Docker-SYCL-Victory]] | [[Knowledge Base/LLM/AI Education Project|AI Education Project]] | [[Knowledge Base/LLM/Asking Stupid Questions - Prompting Guide|Asking Stupid Questions - Prompting Guide]] | [[Knowledge Base/LLM/Hybrid Architecture - The PACE Plan|Hybrid Architecture - The PACE Plan]] | [[Knowledge Base/LLM/Install LLM Prompt|Install LLM Prompt]] | [[Knowledge Base/LLM/LLM|LLM]] | [[Knowledge Base/LLM/LocalAI|LocalAI]] | [[Knowledge Base/LLM/More Powers for Gemini|More Powers for Gemini]] | [[Knowledge Base/LLM/NetYeti System Prompt|NetYeti System Prompt]] | [[Knowledge Base/LLM/Ollama Setup Guide|Ollama Setup Guide]] | [[Knowledge Base/LLM/Ollama in Proxmox via Gemini|Ollama in Proxmox via Gemini]] | [[Knowledge Base/LLM/OpenClaw|OpenClaw]] | [[Knowledge Base/LLM/The AI Homelab Story|The AI Homelab Story]] |
| Networking | [[Knowledge Base/Networking/DHCP|DHCP]] | [[Knowledge Base/Networking/DNS/DNS Service Records|DNS Service Records]] | [[Knowledge Base/Networking/DNS/Split DNS|Split DNS]] | [[Knowledge Base/Networking/DNS/Technitium DNS & DHCP|Technitium DNS & DHCP]] | [[Knowledge Base/Networking/DNS|DNS]] | [[Knowledge Base/Networking/Domain|Domain]] | [[Knowledge Base/Networking/Firewall|Firewall]] | [[Knowledge Base/Networking/ISP|ISP]] | [[Knowledge Base/Networking/OPNsense|OPNsense]] | [[Knowledge Base/Networking/PXEBoot|PXEBoot]] | [[Knowledge Base/Networking/Router|Router]] | [[Knowledge Base/Networking/SSH-Config-Management|SSH-Config-Management]] | [[Knowledge Base/Networking/Security|Security]] | [[Knowledge Base/Networking/Snort|Snort]] | [[Knowledge Base/Networking/Tactical-SSH-GitHub-Keys|Tactical-SSH-GitHub-Keys]] | [[Knowledge Base/Networking/Tailscale|Tailscale]] | [[Knowledge Base/Networking/UFW|UFW]] | [[Knowledge Base/Networking/Unbound|Unbound]] | [[Knowledge Base/Networking/WiFi|WiFi]] | [[Knowledge Base/Networking/Wireguard|Wireguard]] | [[Knowledge Base/Networking/Zenarmor|Zenarmor]] | [[Knowledge Base/Networking/iptables|iptables]] | [[Knowledge Base/Networking/pfSense|pfSense]] | [[Knowledge Base/Networking/ssh|ssh]] |
| Services | [[Knowledge Base/Services/Discord Webhooks|Discord Webhooks]] | [[Knowledge Base/Services/DjangoCMS|DjangoCMS]] | [[Knowledge Base/Services/Email|Email]] | [[Knowledge Base/Services/Homepage|Homepage]] | [[Knowledge Base/Services/MFA|MFA]] | [[Knowledge Base/Services/Monitoring/Grafana|Grafana]] | [[Knowledge Base/Services/Monitoring/NtopNG|NtopNG]] | [[Knowledge Base/Services/Syncthing|Syncthing]] | [[Knowledge Base/Services/Vaultwarden|Vaultwarden]] |
| Storage | [[Knowledge Base/Storage/NAS|NAS]] | [[Knowledge Base/Storage/Openmediavault|Openmediavault]] | [[Knowledge Base/Storage/ZFS Backups|ZFS Backups]] | [[Knowledge Base/Storage/ZFS|ZFS]] |
| Tools | [[Knowledge Base/Tools/Ansible|Ansible]] | [[Knowledge Base/Tools/Apt Cacher NG|Apt Cacher NG]] | [[Knowledge Base/Tools/Beszel|Beszel]] | [[Knowledge Base/Tools/CouchDB|CouchDB]] | [[Knowledge Base/Tools/DjangoCMS|DjangoCMS]] | [[Knowledge Base/Tools/Docker|Docker]] | [[Knowledge Base/Tools/Grafana|Grafana]] | [[Knowledge Base/Tools/Harbor|Harbor]] | [[Knowledge Base/Tools/HomeAssistant|HomeAssistant]] | [[Knowledge Base/Tools/Homepage|Homepage]] | [[Knowledge Base/Tools/LXC|LXC]] | [[Knowledge Base/Tools/Mark Down|Mark Down]] | [[Knowledge Base/Tools/Nextcloud|Nextcloud]] | [[Knowledge Base/Tools/NtopNG|NtopNG]] | [[Knowledge Base/Tools/Obsidian|Obsidian]] | [[Knowledge Base/Tools/Portainer|Portainer]] | [[Knowledge Base/Tools/Prometheus|Prometheus]] | [[Knowledge Base/Tools/Proxmox Backup Server|Proxmox Backup Server]] | [[Knowledge Base/Tools/Proxmox|Proxmox]] | [[Knowledge Base/Tools/Registry|Registry]] | [[Knowledge Base/Tools/Semaphore|Semaphore]] | [[Knowledge Base/Tools/Shell|Shell]] | [[Knowledge Base/Tools/Tailscale|Tailscale]] | [[Knowledge Base/Tools/Technitium|Technitium]] | [[Knowledge Base/Tools/Vaultwarden|Vaultwarden]] | [[Knowledge Base/Tools/Wireguard|Wireguard]] | [[Knowledge Base/Tools/Wordpress|Wordpress]] | [[Knowledge Base/Tools/WorkAdventure|WorkAdventure]] |
| Tricks | [[Knowledge Base/Tricks/DNS Service Records|DNS Service Records]] | [[Knowledge Base/Tricks/Docker on LXC|Docker on LXC]] | [[Knowledge Base/Tricks/Examples/CouchDB Deployment Files|CouchDB Deployment Files]] | [[Knowledge Base/Tricks/Excalidraw Test|Excalidraw Test]] | [[Knowledge Base/Tricks/Gemini-CLI-Mastery|Gemini-CLI-Mastery]] | [[Knowledge Base/Tricks/GitHub-Quartz-Obsidian|GitHub-Quartz-Obsidian]] | [[Knowledge Base/Tricks/LXC Desktop|LXC Desktop]] | [[Knowledge Base/Tricks/Obsidian Plugins|Obsidian Plugins]] | [[Knowledge Base/Tricks/Proxmox Commandline|Proxmox Commandline]] | [[Knowledge Base/Tricks/Replicating my Desktop|Replicating my Desktop]] | [[Knowledge Base/Tricks/Smoother Updates|Smoother Updates]] | [[Knowledge Base/Tricks/Split DNS|Split DNS]] | [[Knowledge Base/Tricks/Wireguard Search Domain|Wireguard Search Domain]] | [[Knowledge Base/Tricks/ZFS Backup|ZFS Backup]] |
| Virtualization | [[Knowledge Base/Virtualization/Apt Cacher NG|Apt Cacher NG]] | [[Knowledge Base/Virtualization/Cloud Init|Cloud Init]] | [[Knowledge Base/Virtualization/Docker/Docker Registry|Docker Registry]] | [[Knowledge Base/Virtualization/Docker/Docker on LXC|Docker on LXC]] | [[Knowledge Base/Virtualization/Docker/Portainer|Portainer]] | [[Knowledge Base/Virtualization/Docker/Shutting Down a Single Swarm Node|Shutting Down a Single Swarm Node]] | [[Knowledge Base/Virtualization/Docker/Smoother Updates|Smoother Updates]] | [[Knowledge Base/Virtualization/Docker/Swarm Shutdown|Swarm Shutdown]] | [[Knowledge Base/Virtualization/LXC|LXC]] | [[Knowledge Base/Virtualization/PXEBoot|PXEBoot]] |

%% DATAVIEW_PUBLISHER: end %%

## Recent Changes / Additions
%% DATAVIEW_PUBLISHER: start
```dataview
TABLE 
  file.ctime AS "Created", 
  file.mtime AS "Updated"
WHERE file.cday >= date(today) - dur(7 days)
  OR file.mday >= date(today) - dur(7 days)
WHERE contains(file.folder, this.file.folder)
SORT file.mtime DESC
LIMIT 20
```
%%

| File | Created | Updated |
| --- | --- |
| [[Knowledge Base/Development/Shell/Shell (921428)|Shell (921428)]] | 12:26 AM - April 16, 2026 | 12:26 AM - April 16, 2026 |
| [[Knowledge Base/Tricks/Examples/index|index]] | 12:26 AM - April 16, 2026 | 12:26 AM - April 16, 2026 |
| [[Knowledge Base/Development/index|index]] | 12:26 AM - April 16, 2026 | 12:26 AM - April 16, 2026 |
| [[Knowledge Base/Storage/index|index]] | 12:26 AM - April 16, 2026 | 12:26 AM - April 16, 2026 |
| [[Knowledge Base/Tricks/index|index]] | 12:26 AM - April 16, 2026 | 12:26 AM - April 16, 2026 |
| [[Knowledge Base/Tools/index|index]] | 12:26 AM - April 16, 2026 | 12:26 AM - April 16, 2026 |
| [[Knowledge Base/Virtualization/index|index]] | 12:26 AM - April 16, 2026 | 12:26 AM - April 16, 2026 |
| [[Knowledge Base/Hardware/index|index]] | 12:26 AM - April 16, 2026 | 12:26 AM - April 16, 2026 |
| [[Knowledge Base/Community/index|index]] | 12:26 AM - April 16, 2026 | 12:26 AM - April 16, 2026 |
| [[Knowledge Base/index|index]] | 12:26 AM - April 16, 2026 | 12:26 AM - April 16, 2026 |
| [[Knowledge Base/Services/index|index]] | 12:26 AM - April 16, 2026 | 12:26 AM - April 16, 2026 |
| [[Knowledge Base/Tools/Ansible|Ansible]] | 7:15 PM - April 15, 2026 | 7:15 PM - April 15, 2026 |
| [[Knowledge Base/Tricks/Gemini-CLI-Mastery|Gemini-CLI-Mastery]] | 7:10 PM - April 15, 2026 | 7:10 PM - April 15, 2026 |
| [[Knowledge Base/Storage/ZFS|ZFS]] | 8:08 PM - April 15, 2026 | 7:10 PM - April 15, 2026 |
| [[Knowledge Base/Tools/Obsidian|Obsidian]] | 8:08 PM - April 15, 2026 | 6:58 PM - April 15, 2026 |
| [[Knowledge Base/Networking/ssh|ssh]] | 8:08 PM - April 15, 2026 | 3:50 PM - April 15, 2026 |
| [[Knowledge Base/Networking/SSH-Config-Management|SSH-Config-Management]] | 3:50 PM - April 15, 2026 | 3:50 PM - April 15, 2026 |
| [[Knowledge Base/Networking/index|index]] | 3:49 PM - April 15, 2026 | 3:49 PM - April 15, 2026 |
| [[Knowledge Base/Networking/Tactical-SSH-GitHub-Keys|Tactical-SSH-GitHub-Keys]] | 3:49 PM - April 15, 2026 | 3:49 PM - April 15, 2026 |
| [[Knowledge Base/LLM/More Powers for Gemini|More Powers for Gemini]] | 3:33 PM - April 15, 2026 | 3:33 PM - April 15, 2026 |

%% DATAVIEW_PUBLISHER: end %%