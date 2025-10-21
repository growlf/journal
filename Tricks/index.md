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

| Folder   | Documents                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| -------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Examples | [[Tricks/Examples/CouchDB Deployment Files.md\|CouchDB Deployment Files]] \| [[Tricks/Examples/index.md\|index]]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| Tricks   | [[Tricks/DNS Service Records.md\|DNS Service Records]] \| [[Tricks/Docker on LXC.md\|Docker on LXC]] \| [[Tricks/Excalidraw Test.md\|Excalidraw Test]] \| [[Tricks/GitHub-Quartz-Obsidian.md\|GitHub-Quartz-Obsidian]] \| [[Tricks/index.md\|index]] \| [[Tricks/LXC Desktop.md\|LXC Desktop]] \| [[Tricks/Obsidian Plugins.md\|Obsidian Plugins]] \| [[Tricks/Proxmox Commandline.md\|Proxmox Commandline]] \| [[Tricks/Replicating my Desktop.md\|Replicating my Desktop]] \| [[Tricks/Smoother Updates.md\|Smoother Updates]] \| [[Tricks/Split DNS.md\|Split DNS]] \| [[Tricks/Wireguard Search Domain.md\|Wireguard Search Domain]] \| [[Tricks/ZFS Backup.md\|ZFS Backup]] |

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

| File                                                                      | Created                    | Updated                    |
| ------------------------------------------------------------------------- | -------------------------- | -------------------------- |
| [[Tricks/Split DNS.md\|Split DNS]]                                        | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tricks/Wireguard Search Domain.md\|Wireguard Search Domain]]            | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tricks/ZFS Backup.md\|ZFS Backup]]                                      | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tricks/index.md\|index]]                                                | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tricks/Examples/index.md\|index]]                                       | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tricks/Excalidraw Test.md\|Excalidraw Test]]                            | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tricks/GitHub-Quartz-Obsidian.md\|GitHub-Quartz-Obsidian]]              | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tricks/LXC Desktop.md\|LXC Desktop]]                                    | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tricks/Obsidian Plugins.md\|Obsidian Plugins]]                          | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tricks/Proxmox Commandline.md\|Proxmox Commandline]]                    | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tricks/Replicating my Desktop.md\|Replicating my Desktop]]              | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tricks/Smoother Updates.md\|Smoother Updates]]                          | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tricks/DNS Service Records.md\|DNS Service Records]]                    | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tricks/Docker on LXC.md\|Docker on LXC]]                                | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tricks/Examples/CouchDB Deployment Files.md\|CouchDB Deployment Files]] | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |

%% DATAVIEW_PUBLISHER: end %%