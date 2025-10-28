---
title: Tricks
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

| Folder   | Documents                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| -------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Examples | [[Tricks/Examples/CouchDB Deployment Files.md\|CouchDB Deployment Files]] \| [[Tricks/Examples/index.md\|index]]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| Tricks   | [[Tricks/DNS Service Records.md\|DNS Service Records]] \| [[Tricks/Docker on LXC.md\|Docker on LXC]] \| [[Tricks/Excalidraw Test.md\|Excalidraw Test]] \| [[Tricks/GitHub-Quartz-Obsidian.md\|GitHub-Quartz-Obsidian]] \| [[Tricks/index.md\|index]] \| [[Tricks/LXC Desktop.md\|LXC Desktop]] \| [[Tricks/Obsidian Plugins.md\|Obsidian Plugins]] \| [[Tricks/Proxmox Commandline.md\|Proxmox Commandline]] \| [[Tricks/Proxmox Community Scripts.md\|Proxmox Community Scripts]] \| [[Tricks/PVE Monitor-All.md\|PVE Monitor-All]] \| [[Tricks/Replicating my Desktop.md\|Replicating my Desktop]] \| [[Tricks/Smoother Updates.md\|Smoother Updates]] \| [[Tricks/Split DNS.md\|Split DNS]] \| [[Tricks/Wireguard Search Domain.md\|Wireguard Search Domain]] \| [[Tricks/ZFS Backup.md\|ZFS Backup]] |

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

| File                                                                      | Created                     | Updated                     |
| ------------------------------------------------------------------------- | --------------------------- | --------------------------- |
| [[Tricks/index.md\|index]]                                                | 4:19 PM - October 20, 2025  | 1:01 PM - October 28, 2025  |
| [[Tricks/PVE Monitor-All.md\|PVE Monitor-All]]                            | 4:41 PM - October 20, 2025  | 1:00 PM - October 28, 2025  |
| [[Tricks/Replicating my Desktop.md\|Replicating my Desktop]]              | 4:19 PM - October 20, 2025  | 12:52 PM - October 28, 2025 |
| [[Tricks/Proxmox Commandline.md\|Proxmox Commandline]]                    | 4:19 PM - October 20, 2025  | 12:52 PM - October 28, 2025 |
| [[Tricks/Obsidian Plugins.md\|Obsidian Plugins]]                          | 4:19 PM - October 20, 2025  | 1:13 AM - October 28, 2025  |
| [[Tricks/Wireguard Search Domain.md\|Wireguard Search Domain]]            | 4:19 PM - October 20, 2025  | 1:11 AM - October 28, 2025  |
| [[Tricks/Examples/CouchDB Deployment Files.md\|CouchDB Deployment Files]] | 4:19 PM - October 20, 2025  | 1:09 AM - October 28, 2025  |
| [[Tricks/Proxmox Community Scripts.md\|Proxmox Community Scripts]]        | 10:05 PM - October 23, 2025 | 10:05 PM - October 23, 2025 |

%% DATAVIEW_PUBLISHER: end %%