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

| Folder | Documents                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Tools  | [[Tools/Ansible.md\|Ansible]] \| [[Tools/Apt Cacher NG.md\|Apt Cacher NG]] \| [[Tools/Beszel.md\|Beszel]] \| [[Tools/CouchDB.md\|CouchDB]] \| [[Tools/DjangoCMS.md\|DjangoCMS]] \| [[Tools/Docker.md\|Docker]] \| [[Tools/Grafana.md\|Grafana]] \| [[Tools/Harbor.md\|Harbor]] \| [[Tools/HomeAssistant.md\|HomeAssistant]] \| [[Tools/Homepage.md\|Homepage]] \| [[Tools/index.md\|index]] \| [[Tools/LXC.md\|LXC]] \| [[Tools/Nextcloud.md\|Nextcloud]] \| [[Tools/NtopNG.md\|NtopNG]] \| [[Tools/Portainer.md\|Portainer]] \| [[Tools/Prometheus.md\|Prometheus]] \| [[Tools/Proxmox Backup Server.md\|Proxmox Backup Server]] \| [[Tools/Proxmox.md\|Proxmox]] \| [[Tools/PVE Monitor-All.md\|PVE Monitor-All]] \| [[Tools/Registry.md\|Registry]] \| [[Tools/Semaphore.md\|Semaphore]] \| [[Tools/Shell.md\|Shell]] \| [[Tools/SyncThing.md\|SyncThing]] \| [[Tools/Tailscale.md\|Tailscale]] \| [[Tools/Technitium.md\|Technitium]] \| [[Tools/Vaultwarden.md\|Vaultwarden]] \| [[Tools/Wireguard.md\|Wireguard]] \| [[Tools/Wordpress.md\|Wordpress]] \| [[Tools/WorkAdventure.md\|WorkAdventure]] |

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

| File                                                      | Created                    | Updated                    |
| --------------------------------------------------------- | -------------------------- | -------------------------- |
| [[Tools/Wireguard.md\|Wireguard]]                         | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/Wordpress.md\|Wordpress]]                         | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/WorkAdventure.md\|WorkAdventure]]                 | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/index.md\|index]]                                 | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/Proxmox Backup Server.md\|Proxmox Backup Server]] | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/Proxmox.md\|Proxmox]]                             | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/Registry.md\|Registry]]                           | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/Semaphore.md\|Semaphore]]                         | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/Shell.md\|Shell]]                                 | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/SyncThing.md\|SyncThing]]                         | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/Tailscale.md\|Tailscale]]                         | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/Technitium.md\|Technitium]]                       | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/Vaultwarden.md\|Vaultwarden]]                     | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/HomeAssistant.md\|HomeAssistant]]                 | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/Homepage.md\|Homepage]]                           | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/LXC.md\|LXC]]                                     | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/Nextcloud.md\|Nextcloud]]                         | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/NtopNG.md\|NtopNG]]                               | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/PVE Monitor-All.md\|PVE Monitor-All]]             | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/Portainer.md\|Portainer]]                         | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |

%% DATAVIEW_PUBLISHER: end %%