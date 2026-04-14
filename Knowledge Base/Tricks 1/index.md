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

| Folder   | Documents                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Examples | [[Knowledge Base/Tricks 1/Examples/CouchDB Deployment Files.md\|CouchDB Deployment Files]] \| [[Knowledge Base/Tricks 1/Examples/index.md\|index]]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| Tricks 1 | [[Knowledge Base/Tricks 1/DNS Service Records.md\|DNS Service Records]] \| [[Knowledge Base/Tricks 1/Docker on LXC.md\|Docker on LXC]] \| [[Knowledge Base/Tricks 1/Excalidraw Test.md\|Excalidraw Test]] \| [[Knowledge Base/Tricks 1/GitHub-Quartz-Obsidian.md\|GitHub-Quartz-Obsidian]] \| [[Knowledge Base/Tricks 1/index.md\|index]] \| [[Knowledge Base/Tricks 1/LXC Desktop.md\|LXC Desktop]] \| [[Knowledge Base/Tricks 1/Obsidian Plugins.md\|Obsidian Plugins]] \| [[Knowledge Base/Tricks 1/Proxmox Commandline.md\|Proxmox Commandline]] \| [[Knowledge Base/Tricks 1/Replicating my Desktop.md\|Replicating my Desktop]] \| [[Knowledge Base/Tricks 1/Smoother Updates.md\|Smoother Updates]] \| [[Knowledge Base/Tricks 1/Split DNS.md\|Split DNS]] \| [[Knowledge Base/Tricks 1/Wireguard Search Domain.md\|Wireguard Search Domain]] \| [[Knowledge Base/Tricks 1/ZFS Backup.md\|ZFS Backup]] |

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

| File                                                                                       | Created                   | Updated                   |
| ------------------------------------------------------------------------------------------ | ------------------------- | ------------------------- |
| [[Knowledge Base/Tricks 1/index.md\|index]]                                                | 10:47 PM - April 12, 2026 | 2:36 PM - April 13, 2026  |
| [[Knowledge Base/Tricks 1/Examples/index.md\|index]]                                       | 10:47 PM - April 12, 2026 | 2:36 PM - April 13, 2026  |
| [[Knowledge Base/Tricks 1/Replicating my Desktop.md\|Replicating my Desktop]]              | 10:47 PM - April 12, 2026 | 11:29 PM - April 12, 2026 |
| [[Knowledge Base/Tricks 1/Wireguard Search Domain.md\|Wireguard Search Domain]]            | 10:47 PM - April 12, 2026 | 11:29 PM - April 12, 2026 |
| [[Knowledge Base/Tricks 1/Proxmox Commandline.md\|Proxmox Commandline]]                    | 10:47 PM - April 12, 2026 | 11:29 PM - April 12, 2026 |
| [[Knowledge Base/Tricks 1/Split DNS.md\|Split DNS]]                                        | 10:47 PM - April 12, 2026 | 10:47 PM - April 12, 2026 |
| [[Knowledge Base/Tricks 1/Smoother Updates.md\|Smoother Updates]]                          | 10:47 PM - April 12, 2026 | 10:47 PM - April 12, 2026 |
| [[Knowledge Base/Tricks 1/ZFS Backup.md\|ZFS Backup]]                                      | 10:47 PM - April 12, 2026 | 10:47 PM - April 12, 2026 |
| [[Knowledge Base/Tricks 1/Obsidian Plugins.md\|Obsidian Plugins]]                          | 10:47 PM - April 12, 2026 | 10:47 PM - April 12, 2026 |
| [[Knowledge Base/Tricks 1/LXC Desktop.md\|LXC Desktop]]                                    | 10:47 PM - April 12, 2026 | 10:47 PM - April 12, 2026 |
| [[Knowledge Base/Tricks 1/Examples/CouchDB Deployment Files.md\|CouchDB Deployment Files]] | 10:47 PM - April 12, 2026 | 10:47 PM - April 12, 2026 |
| [[Knowledge Base/Tricks 1/GitHub-Quartz-Obsidian.md\|GitHub-Quartz-Obsidian]]              | 10:47 PM - April 12, 2026 | 10:47 PM - April 12, 2026 |
| [[Knowledge Base/Tricks 1/Excalidraw Test.md\|Excalidraw Test]]                            | 10:47 PM - April 12, 2026 | 10:47 PM - April 12, 2026 |
| [[Knowledge Base/Tricks 1/Docker on LXC.md\|Docker on LXC]]                                | 10:47 PM - April 12, 2026 | 10:47 PM - April 12, 2026 |
| [[Knowledge Base/Tricks 1/DNS Service Records.md\|DNS Service Records]]                    | 10:47 PM - April 12, 2026 | 10:47 PM - April 12, 2026 |

%% DATAVIEW_PUBLISHER: end %%