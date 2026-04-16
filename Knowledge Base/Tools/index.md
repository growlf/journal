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

| Folder | Documents |
| --- | --- |

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
| [[Knowledge Base/Tools/CouchDB|CouchDB]] | 12:29 AM - April 16, 2026 | 12:29 AM - April 16, 2026 |
| [[Knowledge Base/Tools/index|index]] | 12:26 AM - April 16, 2026 | 12:26 AM - April 16, 2026 |
| [[Knowledge Base/Tools/Ansible|Ansible]] | 7:15 PM - April 15, 2026 | 7:15 PM - April 15, 2026 |
| [[Knowledge Base/Tools/Obsidian|Obsidian]] | 8:08 PM - April 15, 2026 | 6:58 PM - April 15, 2026 |
| [[Knowledge Base/Tools/Technitium|Technitium]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tools/Prometheus|Prometheus]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tools/Harbor|Harbor]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tools/Tailscale|Tailscale]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tools/LXC|LXC]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tools/Wireguard|Wireguard]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tools/Proxmox|Proxmox]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tools/Apt Cacher NG|Apt Cacher NG]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tools/Homepage|Homepage]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tools/Vaultwarden|Vaultwarden]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tools/Grafana|Grafana]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tools/Beszel|Beszel]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tools/Semaphore|Semaphore]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tools/WorkAdventure|WorkAdventure]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tools/Wordpress|Wordpress]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tools/Shell|Shell]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |

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

| Folder | Documents |
| --- | --- |

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
| [[Knowledge Base/Tools/CouchDB|CouchDB]] | 12:29 AM - April 16, 2026 | 12:29 AM - April 16, 2026 |
| [[Knowledge Base/Tools/index|index]] | 12:26 AM - April 16, 2026 | 12:26 AM - April 16, 2026 |
| [[Knowledge Base/Tools/Ansible|Ansible]] | 7:15 PM - April 15, 2026 | 7:15 PM - April 15, 2026 |
| [[Knowledge Base/Tools/Obsidian|Obsidian]] | 8:08 PM - April 15, 2026 | 6:58 PM - April 15, 2026 |
| [[Knowledge Base/Tools/Technitium|Technitium]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tools/Prometheus|Prometheus]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tools/Harbor|Harbor]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tools/Tailscale|Tailscale]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tools/LXC|LXC]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tools/Wireguard|Wireguard]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tools/Proxmox|Proxmox]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tools/Apt Cacher NG|Apt Cacher NG]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tools/Homepage|Homepage]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tools/Vaultwarden|Vaultwarden]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tools/Grafana|Grafana]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tools/Beszel|Beszel]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tools/Semaphore|Semaphore]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tools/WorkAdventure|WorkAdventure]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tools/Wordpress|Wordpress]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tools/Shell|Shell]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |

%% DATAVIEW_PUBLISHER: end %%
