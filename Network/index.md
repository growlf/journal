---
title: Lab
---
Building a home lab is essential to learning and improving in the world of tech. If you have not created one for yourself, and are interested, start [[Home Lab 101|here]].  If you are a bit more familiar and just want the overview, feel free to look at what I call [[The Stack]] - my basic layout for my own.

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

| Folder   | Documents                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| devices  | [[Changeling\|Changeling]] \| [[dn1\|dn1]] \| [[dn2\|dn2]] \| [[dn3\|dn3]] \| [[Gearbox\|Gearbox]] \| [[Interceptor\|Interceptor]] \| [[LisaSU25\|LisaSU25]] \| [[Nexus\|Nexus]] \| [[Pheonix\|Pheonix]] \| [[Network/devices/Router\|Router]] \| [[Sliver\|Sliver]] \| [[Sterling\|Sterling]]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| Lab      | [[Home Lab 101\|Home Lab 101]] \| [[Network/index\|index]] \| [[The Stack\|The Stack]]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| services | [[AI Studio\|AI Studio]] \| [[Apt Cacher NG\|Apt Cacher NG]] \| [[Cloudflare\|Cloudflare]] \| [[CouchDB\|CouchDB]] \| [[Docker Registry\|Docker Registry]] \| [[Enphase\|Enphase]] \| [[ESPHome\|ESPHome]] \| [[Grafana\|Grafana]] \| [[Harbor\|Harbor]] \| [[Home Assistant\|Home Assistant]] \| [[Homepage\|Homepage]] \| [[iVentoy Images\|iVentoy Images]] \| [[iVentoy\|iVentoy]] \| [[Netbox\|Netbox]] \| [[NGiNX Proxy Manager\|NGiNX Proxy Manager]] \| [[Node Red\|Node Red]] \| [[NTFY\|NTFY]] \| [[NtopNG\|NtopNG]] \| [[Openmediavault\|Openmediavault]] \| [[Portainer\|Portainer]] \| [[Prometheus\|Prometheus]] \| [[Proxmox Backup Server\|Proxmox Backup Server]] \| [[Proxmox\|Proxmox]] \| [[Network/services/Router\|Router]] \| [[Semaphore UI\|Semaphore UI]] \| [[SyncThing\|SyncThing]] \| [[Tailscale\|Tailscale]] \| [[Technitium DNS & DHCP\|Technitium DNS & DHCP]] \| [[Vaultwarden\|Vaultwarden]] \| [[Wireguard\|Wireguard]] \| [[Wordpress\|Wordpress]] \| [[WorkAdventure\|WorkAdventure]] |

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

| File                                                 | Created                     | Updated                     |
| ---------------------------------------------------- | --------------------------- | --------------------------- |
| [[Network/index\|index]]                              | 4:19 PM - October 20, 2025  | 2:12 PM - October 28, 2025  |
| [[dn3\|dn3]]                          | 1:43 PM - October 28, 2025  | 1:43 PM - October 28, 2025  |
| [[dn1\|dn1]]                          | 1:42 PM - October 28, 2025  | 1:43 PM - October 28, 2025  |
| [[dn2\|dn2]]                          | 1:43 PM - October 28, 2025  | 1:43 PM - October 28, 2025  |
| [[Sterling\|Sterling]]                | 12:26 AM - October 28, 2025 | 1:39 PM - October 28, 2025  |
| [[Sliver\|Sliver]]                    | 12:26 AM - October 28, 2025 | 1:39 PM - October 28, 2025  |
| [[Network/devices/Router\|Router]]                    | 2:11 PM - October 25, 2025  | 1:39 PM - October 28, 2025  |
| [[Gearbox\|Gearbox]]                  | 4:48 PM - October 21, 2025  | 1:38 PM - October 28, 2025  |
| [[Changeling\|Changeling]]            | 12:25 AM - October 28, 2025 | 1:38 PM - October 28, 2025  |
| [[LisaSU25\|LisaSU25]]                | 12:26 AM - October 28, 2025 | 1:38 PM - October 28, 2025  |
| [[Interceptor\|Interceptor]]          | 1:12 PM - October 28, 2025  | 1:38 PM - October 28, 2025  |
| [[Nexus\|Nexus]]                      | 2:11 PM - October 25, 2025  | 1:37 PM - October 28, 2025  |
| [[The Stack\|The Stack]]                      | 4:19 PM - October 20, 2025  | 1:29 PM - October 28, 2025  |
| [[Openmediavault\|Openmediavault]]   | 10:17 PM - October 23, 2025 | 1:13 PM - October 28, 2025  |
| [[Docker Registry\|Docker Registry]] | 10:14 PM - October 23, 2025 | 1:10 PM - October 28, 2025  |
| [[Grafana\|Grafana]]                 | 4:19 PM - October 20, 2025  | 1:10 PM - October 28, 2025  |
| [[Apt Cacher NG\|Apt Cacher NG]]     | 4:19 PM - October 20, 2025  | 1:07 PM - October 28, 2025  |
| [[CouchDB\|CouchDB]]                 | 4:19 PM - October 20, 2025  | 1:00 PM - October 28, 2025  |
| [[Proxmox\|Proxmox]]                 | 4:19 PM - October 20, 2025  | 12:52 PM - October 28, 2025 |
| [[Home Assistant\|Home Assistant]]   | 4:19 PM - October 20, 2025  | 12:52 PM - October 28, 2025 |

%% DATAVIEW_PUBLISHER: end %%