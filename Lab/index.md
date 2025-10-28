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
| devices  | [[Lab/devices/Changeling.md\|Changeling]] \| [[Lab/devices/dn1.md\|dn1]] \| [[Lab/devices/dn2.md\|dn2]] \| [[Lab/devices/dn3.md\|dn3]] \| [[Lab/devices/Gearbox.md\|Gearbox]] \| [[Lab/devices/Interceptor.md\|Interceptor]] \| [[Lab/devices/LisaSU25.md\|LisaSU25]] \| [[Lab/devices/Nexus.md\|Nexus]] \| [[Lab/devices/Pheonix.md\|Pheonix]] \| [[Lab/devices/Router.md\|Router]] \| [[Lab/devices/Sliver.md\|Sliver]] \| [[Lab/devices/Sterling.md\|Sterling]]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| Lab      | [[Lab/Home Lab 101.md\|Home Lab 101]] \| [[Lab/index.md\|index]] \| [[Lab/The Stack.md\|The Stack]]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| services | [[Lab/services/AI Studio.md\|AI Studio]] \| [[Lab/services/Apt Cacher NG.md\|Apt Cacher NG]] \| [[Lab/services/Cloudflare.md\|Cloudflare]] \| [[Lab/services/CouchDB.md\|CouchDB]] \| [[Lab/services/Docker Registry.md\|Docker Registry]] \| [[Lab/services/Enphase.md\|Enphase]] \| [[Lab/services/ESPHome.md\|ESPHome]] \| [[Lab/services/Grafana.md\|Grafana]] \| [[Lab/services/Harbor.md\|Harbor]] \| [[Lab/services/Home Assistant.md\|Home Assistant]] \| [[Lab/services/Homepage.md\|Homepage]] \| [[Lab/services/iVentoy Images.md\|iVentoy Images]] \| [[Lab/services/iVentoy.md\|iVentoy]] \| [[Lab/services/Netbox.md\|Netbox]] \| [[Lab/services/NGiNX Proxy Manager.md\|NGiNX Proxy Manager]] \| [[Lab/services/Node Red.md\|Node Red]] \| [[Lab/services/NTFY.md\|NTFY]] \| [[Lab/services/NtopNG.md\|NtopNG]] \| [[Lab/services/Openmediavault.md\|Openmediavault]] \| [[Lab/services/Portainer.md\|Portainer]] \| [[Lab/services/Prometheus.md\|Prometheus]] \| [[Lab/services/Proxmox Backup Server.md\|Proxmox Backup Server]] \| [[Lab/services/Proxmox.md\|Proxmox]] \| [[Lab/services/Router.md\|Router]] \| [[Lab/services/Semaphore UI.md\|Semaphore UI]] \| [[Lab/services/SyncThing.md\|SyncThing]] \| [[Lab/services/Tailscale.md\|Tailscale]] \| [[Lab/services/Technitium DNS & DHCP.md\|Technitium DNS & DHCP]] \| [[Lab/services/Vaultwarden.md\|Vaultwarden]] \| [[Lab/services/Wireguard.md\|Wireguard]] \| [[Lab/services/Wordpress.md\|Wordpress]] \| [[Lab/services/WorkAdventure.md\|WorkAdventure]] |

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
| [[Lab/index.md\|index]]                              | 4:19 PM - October 20, 2025  | 2:12 PM - October 28, 2025  |
| [[Lab/devices/dn3.md\|dn3]]                          | 1:43 PM - October 28, 2025  | 1:43 PM - October 28, 2025  |
| [[Lab/devices/dn1.md\|dn1]]                          | 1:42 PM - October 28, 2025  | 1:43 PM - October 28, 2025  |
| [[Lab/devices/dn2.md\|dn2]]                          | 1:43 PM - October 28, 2025  | 1:43 PM - October 28, 2025  |
| [[Lab/devices/Sterling.md\|Sterling]]                | 12:26 AM - October 28, 2025 | 1:39 PM - October 28, 2025  |
| [[Lab/devices/Sliver.md\|Sliver]]                    | 12:26 AM - October 28, 2025 | 1:39 PM - October 28, 2025  |
| [[Lab/devices/Router.md\|Router]]                    | 2:11 PM - October 25, 2025  | 1:39 PM - October 28, 2025  |
| [[Lab/devices/Gearbox.md\|Gearbox]]                  | 4:48 PM - October 21, 2025  | 1:38 PM - October 28, 2025  |
| [[Lab/devices/Changeling.md\|Changeling]]            | 12:25 AM - October 28, 2025 | 1:38 PM - October 28, 2025  |
| [[Lab/devices/LisaSU25.md\|LisaSU25]]                | 12:26 AM - October 28, 2025 | 1:38 PM - October 28, 2025  |
| [[Lab/devices/Interceptor.md\|Interceptor]]          | 1:12 PM - October 28, 2025  | 1:38 PM - October 28, 2025  |
| [[Lab/devices/Nexus.md\|Nexus]]                      | 2:11 PM - October 25, 2025  | 1:37 PM - October 28, 2025  |
| [[Lab/The Stack.md\|The Stack]]                      | 4:19 PM - October 20, 2025  | 1:29 PM - October 28, 2025  |
| [[Lab/services/Openmediavault.md\|Openmediavault]]   | 10:17 PM - October 23, 2025 | 1:13 PM - October 28, 2025  |
| [[Lab/services/Docker Registry.md\|Docker Registry]] | 10:14 PM - October 23, 2025 | 1:10 PM - October 28, 2025  |
| [[Lab/services/Grafana.md\|Grafana]]                 | 4:19 PM - October 20, 2025  | 1:10 PM - October 28, 2025  |
| [[Lab/services/Apt Cacher NG.md\|Apt Cacher NG]]     | 4:19 PM - October 20, 2025  | 1:07 PM - October 28, 2025  |
| [[Lab/services/CouchDB.md\|CouchDB]]                 | 4:19 PM - October 20, 2025  | 1:00 PM - October 28, 2025  |
| [[Lab/services/Proxmox.md\|Proxmox]]                 | 4:19 PM - October 20, 2025  | 12:52 PM - October 28, 2025 |
| [[Lab/services/Home Assistant.md\|Home Assistant]]   | 4:19 PM - October 20, 2025  | 12:52 PM - October 28, 2025 |

%% DATAVIEW_PUBLISHER: end %%