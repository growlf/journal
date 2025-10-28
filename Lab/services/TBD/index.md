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
| Tools  | [[Ansible\|Ansible]] \| [[Apt Cacher NG\|Apt Cacher NG]] \| [[Tools/Beszel.md\|Beszel]] \| [[CouchDB\|CouchDB]] \| [[DjangoCMS\|DjangoCMS]] \| [[Docker\|Docker]] \| [[Grafana 1\|Grafana]] \| [[Harbor\|Harbor]] \| [[HomeAssistant\|HomeAssistant]] \| [[Homepage 1\|Homepage]] \| [[Lab/services/TBD/index\|index]] \| [[Lab/services/TBD/LXC\|LXC]] \| [[Nextcloud\|Nextcloud]] \| [[NtopNG 1\|NtopNG]] \| [[Portainer 1\|Portainer]] \| [[Prometheus 1\|Prometheus]] \| [[Proxmox Backup Server\|Proxmox Backup Server]] \| [[Proxmox 1\|Proxmox]] \| [[PVE Monitor-All\|PVE Monitor-All]] \| [[Registry\|Registry]] \| [[Semaphore UI\|Semaphore]] \| [[Shell\|Shell]] \| [[SyncThing\|SyncThing]] \| [[Tailscale\|Tailscale]] \| [[Technitium\|Technitium]] \| [[Vaultwarden\|Vaultwarden]] \| [[Wireguard\|Wireguard]] \| [[Wordpress\|Wordpress]] \| [[WorkAdventure\|WorkAdventure]] |

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

| File                                                      | Created                    | Updated                       |
| --------------------------------------------------------- | -------------------------- | ----------------------------- |
| [[SyncThing\|SyncThing]]                         | 4:41 PM - October 20, 2025 | 2:19 PM - October 22, 2025    |
| [[PVE Monitor-All\|PVE Monitor-All]]             | 4:41 PM - October 20, 2025 | 2:19 PM - October 22, 2025    |
| [[CouchDB\|CouchDB]]                             | 4:19 PM - October 20, 2025 | 2:03 PM - October 22, 2025    |
| [[Lab/services/TBD/index\|index]]                                 | 4:19 PM - October 20, 2025 | 1:56 PM - October 22, 2025    |
| [[Grafana 1\|Grafana]]                             | 4:19 PM - October 20, 2025 | 3:29 PM - October 09, 2025    |
| [[HomeAssistant\|HomeAssistant]]                 | 4:19 PM - October 20, 2025 | 2:36 PM - October 09, 2025    |
| [[Wordpress\|Wordpress]]                         | 4:19 PM - October 20, 2025 | 12:43 AM - September 11, 2025 |
| [[Tailscale\|Tailscale]]                         | 4:19 PM - October 20, 2025 | 12:43 AM - September 11, 2025 |
| [[Technitium\|Technitium]]                       | 4:19 PM - October 20, 2025 | 12:43 AM - September 11, 2025 |
| [[Vaultwarden\|Vaultwarden]]                     | 4:19 PM - October 20, 2025 | 12:43 AM - September 11, 2025 |
| [[Wireguard\|Wireguard]]                         | 4:19 PM - October 20, 2025 | 12:43 AM - September 11, 2025 |
| [[Shell\|Shell]]                                 | 4:19 PM - October 20, 2025 | 12:43 AM - September 11, 2025 |
| [[Semaphore UI\|Semaphore]]                         | 4:19 PM - October 20, 2025 | 12:43 AM - September 11, 2025 |
| [[Registry\|Registry]]                           | 4:19 PM - October 20, 2025 | 12:43 AM - September 11, 2025 |
| [[Portainer 1\|Portainer]]                         | 4:19 PM - October 20, 2025 | 12:43 AM - September 11, 2025 |
| [[Prometheus 1\|Prometheus]]                       | 4:19 PM - October 20, 2025 | 12:43 AM - September 11, 2025 |
| [[Proxmox Backup Server\|Proxmox Backup Server]] | 4:19 PM - October 20, 2025 | 12:43 AM - September 11, 2025 |
| [[NtopNG 1\|NtopNG]]                               | 4:19 PM - October 20, 2025 | 12:43 AM - September 11, 2025 |
| [[Nextcloud\|Nextcloud]]                         | 4:19 PM - October 20, 2025 | 12:43 AM - September 11, 2025 |
| [[Lab/services/TBD/LXC\|LXC]]                                     | 4:19 PM - October 20, 2025 | 12:43 AM - September 11, 2025 |

%% DATAVIEW_PUBLISHER: end %%