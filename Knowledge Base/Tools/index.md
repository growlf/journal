---
title: Testing
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

| Folder | Documents                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| ------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Tools  | [[Knowledge Base/Tools/Ansible.md\|Ansible]] \| [[Knowledge Base/Tools/Apt Cacher NG.md\|Apt Cacher NG]] \| [[Knowledge Base/Tools/Beszel.md\|Beszel]] \| [[Knowledge Base/Tools/CouchDB.md\|CouchDB]] \| [[Knowledge Base/Tools/DjangoCMS.md\|DjangoCMS]] \| [[Knowledge Base/Tools/Docker.md\|Docker]] \| [[Knowledge Base/Tools/Grafana.md\|Grafana]] \| [[Knowledge Base/Tools/Harbor.md\|Harbor]] \| [[Knowledge Base/Tools/HomeAssistant.md\|HomeAssistant]] \| [[Knowledge Base/Tools/Homepage.md\|Homepage]] \| [[Knowledge Base/Tools/index.md\|index]] \| [[Knowledge Base/Tools/LXC.md\|LXC]] \| [[Knowledge Base/Tools/Nextcloud.md\|Nextcloud]] \| [[Knowledge Base/Tools/NtopNG.md\|NtopNG]] \| [[Knowledge Base/Tools/Portainer.md\|Portainer]] \| [[Knowledge Base/Tools/Prometheus.md\|Prometheus]] \| [[Knowledge Base/Tools/Proxmox Backup Server.md\|Proxmox Backup Server]] \| [[Knowledge Base/Tools/Proxmox.md\|Proxmox]] \| [[Knowledge Base/Tools/Registry.md\|Registry]] \| [[Knowledge Base/Tools/Semaphore.md\|Semaphore]] \| [[Knowledge Base/Tools/Shell.md\|Shell]] \| [[Knowledge Base/Tools/Tailscale.md\|Tailscale]] \| [[Knowledge Base/Tools/Technitium.md\|Technitium]] \| [[Knowledge Base/Tools/Vaultwarden.md\|Vaultwarden]] \| [[Knowledge Base/Tools/Wireguard.md\|Wireguard]] \| [[Knowledge Base/Tools/Wordpress.md\|Wordpress]] \| [[Knowledge Base/Tools/WorkAdventure.md\|WorkAdventure]] |

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

| File                                                                     | Created                   | Updated                   |
| ------------------------------------------------------------------------ | ------------------------- | ------------------------- |
| [[Knowledge Base/Tools/index.md\|index]]                                 | 10:46 PM - April 12, 2026 | 2:36 PM - April 13, 2026  |
| [[Knowledge Base/Tools/Docker.md\|Docker]]                               | 10:46 PM - April 12, 2026 | 11:29 PM - April 12, 2026 |
| [[Knowledge Base/Tools/CouchDB.md\|CouchDB]]                             | 10:46 PM - April 12, 2026 | 11:29 PM - April 12, 2026 |
| [[Knowledge Base/Tools/Wireguard.md\|Wireguard]]                         | 10:46 PM - April 12, 2026 | 11:29 PM - April 12, 2026 |
| [[Knowledge Base/Tools/Technitium.md\|Technitium]]                       | 10:46 PM - April 12, 2026 | 11:29 PM - April 12, 2026 |
| [[Knowledge Base/Tools/HomeAssistant.md\|HomeAssistant]]                 | 10:46 PM - April 12, 2026 | 11:29 PM - April 12, 2026 |
| [[Knowledge Base/Tools/Grafana.md\|Grafana]]                             | 10:46 PM - April 12, 2026 | 11:29 PM - April 12, 2026 |
| [[Knowledge Base/Tools/Apt Cacher NG.md\|Apt Cacher NG]]                 | 10:46 PM - April 12, 2026 | 11:29 PM - April 12, 2026 |
| [[Knowledge Base/Tools/WorkAdventure.md\|WorkAdventure]]                 | 10:46 PM - April 12, 2026 | 10:47 PM - April 12, 2026 |
| [[Knowledge Base/Tools/Wordpress.md\|Wordpress]]                         | 10:46 PM - April 12, 2026 | 10:47 PM - April 12, 2026 |
| [[Knowledge Base/Tools/Vaultwarden.md\|Vaultwarden]]                     | 10:46 PM - April 12, 2026 | 10:47 PM - April 12, 2026 |
| [[Knowledge Base/Tools/Tailscale.md\|Tailscale]]                         | 10:46 PM - April 12, 2026 | 10:47 PM - April 12, 2026 |
| [[Knowledge Base/Tools/Proxmox.md\|Proxmox]]                             | 10:46 PM - April 12, 2026 | 10:47 PM - April 12, 2026 |
| [[Knowledge Base/Tools/Shell.md\|Shell]]                                 | 10:46 PM - April 12, 2026 | 10:47 PM - April 12, 2026 |
| [[Knowledge Base/Tools/Semaphore.md\|Semaphore]]                         | 10:46 PM - April 12, 2026 | 10:47 PM - April 12, 2026 |
| [[Knowledge Base/Tools/Registry.md\|Registry]]                           | 10:46 PM - April 12, 2026 | 10:47 PM - April 12, 2026 |
| [[Knowledge Base/Tools/Portainer.md\|Portainer]]                         | 10:46 PM - April 12, 2026 | 10:47 PM - April 12, 2026 |
| [[Knowledge Base/Tools/Proxmox Backup Server.md\|Proxmox Backup Server]] | 10:46 PM - April 12, 2026 | 10:46 PM - April 12, 2026 |
| [[Knowledge Base/Tools/Prometheus.md\|Prometheus]]                       | 10:46 PM - April 12, 2026 | 10:46 PM - April 12, 2026 |
| [[Knowledge Base/Tools/NtopNG.md\|NtopNG]]                               | 10:46 PM - April 12, 2026 | 10:46 PM - April 12, 2026 |

%% DATAVIEW_PUBLISHER: end %%## Contents:
%% DATAVIEW_PUBLISHER: start
```dataview
TABLE join(sort(rows.file.link), " | ") as Documents
FLATTEN regexreplace(file.folder, ".*/", "") as lastPart
WHERE contains(file.folder, this.file.folder)
GROUP BY lastPart as Folder
SORT lastPart
```
%%

| Folder | Documents                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| ------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Tools  | [[Knowledge Base/Tools/Ansible.md\|Ansible]] \| [[Knowledge Base/Tools/Apt Cacher NG.md\|Apt Cacher NG]] \| [[Knowledge Base/Tools/Beszel.md\|Beszel]] \| [[Knowledge Base/Tools/CouchDB.md\|CouchDB]] \| [[Knowledge Base/Tools/DjangoCMS.md\|DjangoCMS]] \| [[Knowledge Base/Tools/Docker.md\|Docker]] \| [[Knowledge Base/Tools/Grafana.md\|Grafana]] \| [[Knowledge Base/Tools/Harbor.md\|Harbor]] \| [[Knowledge Base/Tools/HomeAssistant.md\|HomeAssistant]] \| [[Knowledge Base/Tools/Homepage.md\|Homepage]] \| [[Knowledge Base/Tools/index.md\|index]] \| [[Knowledge Base/Tools/LXC.md\|LXC]] \| [[Knowledge Base/Tools/Nextcloud.md\|Nextcloud]] \| [[Knowledge Base/Tools/NtopNG.md\|NtopNG]] \| [[Knowledge Base/Tools/Portainer.md\|Portainer]] \| [[Knowledge Base/Tools/Prometheus.md\|Prometheus]] \| [[Knowledge Base/Tools/Proxmox Backup Server.md\|Proxmox Backup Server]] \| [[Knowledge Base/Tools/Proxmox.md\|Proxmox]] \| [[Knowledge Base/Tools/Registry.md\|Registry]] \| [[Knowledge Base/Tools/Semaphore.md\|Semaphore]] \| [[Knowledge Base/Tools/Shell.md\|Shell]] \| [[Knowledge Base/Tools/Tailscale.md\|Tailscale]] \| [[Knowledge Base/Tools/Technitium.md\|Technitium]] \| [[Knowledge Base/Tools/Vaultwarden.md\|Vaultwarden]] \| [[Knowledge Base/Tools/Wireguard.md\|Wireguard]] \| [[Knowledge Base/Tools/Wordpress.md\|Wordpress]] \| [[Knowledge Base/Tools/WorkAdventure.md\|WorkAdventure]] |

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

| File                                                                     | Created                   | Updated                   |
| ------------------------------------------------------------------------ | ------------------------- | ------------------------- |
| [[Knowledge Base/Tools/index.md\|index]]                                 | 10:46 PM - April 12, 2026 | 2:36 PM - April 13, 2026  |
| [[Knowledge Base/Tools/Docker.md\|Docker]]                               | 10:46 PM - April 12, 2026 | 11:29 PM - April 12, 2026 |
| [[Knowledge Base/Tools/CouchDB.md\|CouchDB]]                             | 10:46 PM - April 12, 2026 | 11:29 PM - April 12, 2026 |
| [[Knowledge Base/Tools/Wireguard.md\|Wireguard]]                         | 10:46 PM - April 12, 2026 | 11:29 PM - April 12, 2026 |
| [[Knowledge Base/Tools/Technitium.md\|Technitium]]                       | 10:46 PM - April 12, 2026 | 11:29 PM - April 12, 2026 |
| [[Knowledge Base/Tools/HomeAssistant.md\|HomeAssistant]]                 | 10:46 PM - April 12, 2026 | 11:29 PM - April 12, 2026 |
| [[Knowledge Base/Tools/Grafana.md\|Grafana]]                             | 10:46 PM - April 12, 2026 | 11:29 PM - April 12, 2026 |
| [[Knowledge Base/Tools/Apt Cacher NG.md\|Apt Cacher NG]]                 | 10:46 PM - April 12, 2026 | 11:29 PM - April 12, 2026 |
| [[Knowledge Base/Tools/WorkAdventure.md\|WorkAdventure]]                 | 10:46 PM - April 12, 2026 | 10:47 PM - April 12, 2026 |
| [[Knowledge Base/Tools/Wordpress.md\|Wordpress]]                         | 10:46 PM - April 12, 2026 | 10:47 PM - April 12, 2026 |
| [[Knowledge Base/Tools/Vaultwarden.md\|Vaultwarden]]                     | 10:46 PM - April 12, 2026 | 10:47 PM - April 12, 2026 |
| [[Knowledge Base/Tools/Tailscale.md\|Tailscale]]                         | 10:46 PM - April 12, 2026 | 10:47 PM - April 12, 2026 |
| [[Knowledge Base/Tools/Proxmox.md\|Proxmox]]                             | 10:46 PM - April 12, 2026 | 10:47 PM - April 12, 2026 |
| [[Knowledge Base/Tools/Shell.md\|Shell]]                                 | 10:46 PM - April 12, 2026 | 10:47 PM - April 12, 2026 |
| [[Knowledge Base/Tools/Semaphore.md\|Semaphore]]                         | 10:46 PM - April 12, 2026 | 10:47 PM - April 12, 2026 |
| [[Knowledge Base/Tools/Registry.md\|Registry]]                           | 10:46 PM - April 12, 2026 | 10:47 PM - April 12, 2026 |
| [[Knowledge Base/Tools/Portainer.md\|Portainer]]                         | 10:46 PM - April 12, 2026 | 10:47 PM - April 12, 2026 |
| [[Knowledge Base/Tools/Proxmox Backup Server.md\|Proxmox Backup Server]] | 10:46 PM - April 12, 2026 | 10:46 PM - April 12, 2026 |
| [[Knowledge Base/Tools/Prometheus.md\|Prometheus]]                       | 10:46 PM - April 12, 2026 | 10:46 PM - April 12, 2026 |
| [[Knowledge Base/Tools/NtopNG.md\|NtopNG]]                               | 10:46 PM - April 12, 2026 | 10:46 PM - April 12, 2026 |

%% DATAVIEW_PUBLISHER: end %%
