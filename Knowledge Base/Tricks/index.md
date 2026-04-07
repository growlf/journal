---
title: Knowledge Base/Tricks
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

| Folder | Documents                                                                                                                                                                                                                                                                                                                 |
| ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Tricks | [[Knowledge Base/Tricks/index.md\|index]] \| [[Knowledge Base/Tricks/LXC Desktop.md\|LXC Desktop]] \| [[Knowledge Base/Tricks/Replicating my Desktop.md\|Replicating my Desktop]] \| [[Knowledge Base/Tricks/Wireguard Search Domain.md\|Wireguard Search Domain]] \| [[Knowledge Base/Tricks/ZFS Backup.md\|ZFS Backup]] |

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

| File                                                                          | Created                   | Updated                   |
| ----------------------------------------------------------------------------- | ------------------------- | ------------------------- |
| [[Knowledge Base/Tricks/index.md\|index]]                                     | 11:13 PM - April 05, 2026 | 1:38 PM - April 07, 2026  |
| [[Knowledge Base/Tricks/LXC Desktop.md\|LXC Desktop]]                         | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Tricks/Replicating my Desktop.md\|Replicating my Desktop]]   | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Tricks/Wireguard Search Domain.md\|Wireguard Search Domain]] | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Tricks/ZFS Backup.md\|ZFS Backup]]                           | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |

%% DATAVIEW_PUBLISHER: end %%
