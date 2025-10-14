---
title: Tools
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

| Folder | Documents                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| ------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Tools  | [[Tools/Ansible.md\|Ansible]] \| [[Tools/Apt Cacher NG.md\|Apt Cacher NG]] \| [[Tools/Beszel.md\|Beszel]] \| [[Tools/CouchDB.md\|CouchDB]] \| [[Tools/DjangoCMS.md\|DjangoCMS]] \| [[Tools/Docker.md\|Docker]] \| [[Tools/Grafana.md\|Grafana]] \| [[Tools/Harbor.md\|Harbor]] \| [[Tools/HomeAssistant.md\|HomeAssistant]] \| [[Tools/Homepage.md\|Homepage]] \| [[Tools/index.md\|index]] \| [[Tools/LXC.md\|LXC]] \| [[Tools/Nextcloud.md\|Nextcloud]] \| [[Tools/NtopNG.md\|NtopNG]] \| [[Obsidian\|Obsidian]] \| [[Tools/Portainer.md\|Portainer]] \| [[Tools/Prometheus.md\|Prometheus]] \| [[Tools/Proxmox Backup Server.md\|Proxmox Backup Server]] \| [[Tools/Proxmox.md\|Proxmox]] \| [[Tools/PVE Monitor-All.md\|PVE Monitor-All]] \| [[Tools/Registry.md\|Registry]] \| [[Tools/Semaphore.md\|Semaphore]] \| [[Tools/Shell.md\|Shell]] \| [[Tools/SyncThing.md\|SyncThing]] \| [[Tools/Tailscale.md\|Tailscale]] \| [[Tools/Technitium.md\|Technitium]] \| [[Tools/Vaultwarden.md\|Vaultwarden]] \| [[Tools/Wireguard.md\|Wireguard]] \| [[Tools/Wordpress.md\|Wordpress]] \| [[Tools/WorkAdventure.md\|WorkAdventure]] |

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

| File                                          | Created                       | Updated                     |
| --------------------------------------------- | ----------------------------- | --------------------------- |
| [[Tools/index.md\|index]]                     | 1:22 PM - October 09, 2025    | 12:04 AM - October 10, 2025 |
| [[Tools/CouchDB.md\|CouchDB]]                 | 12:43 AM - September 11, 2025 | 11:34 PM - October 09, 2025 |
| [[Tools/Grafana.md\|Grafana]]                 | 12:43 AM - September 11, 2025 | 3:29 PM - October 09, 2025  |
| [[Tools/HomeAssistant.md\|HomeAssistant]]     | 12:43 AM - September 11, 2025 | 2:36 PM - October 09, 2025  |
| [[Tools/SyncThing.md\|SyncThing]]             | 12:43 AM - September 11, 2025 | 2:30 PM - October 09, 2025  |
| [[Tools/PVE Monitor-All.md\|PVE Monitor-All]] | 12:43 AM - September 11, 2025 | 2:30 PM - October 09, 2025  |

%% DATAVIEW_PUBLISHER: end %%