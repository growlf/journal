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

| File                                                         | Created                       | Updated                     |
| ------------------------------------------------------------ | ----------------------------- | --------------------------- |
| [[Tricks/index.md\|index]]                                   | 1:17 PM - October 09, 2025    | 12:04 AM - October 10, 2025 |
| [[Tricks/Examples/index.md\|index]]                          | 1:22 PM - October 09, 2025    | 3:28 PM - October 09, 2025  |
| [[Tricks/Replicating my Desktop.md\|Replicating my Desktop]] | 12:43 AM - September 11, 2025 | 2:30 PM - October 09, 2025  |

%% DATAVIEW_PUBLISHER: end %%