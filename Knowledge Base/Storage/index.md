---
title: Storage
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

| Folder  | Documents                                                                                                                                                                                                                                                |
| ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Storage | [[Knowledge Base/Storage/index.md\|index]] \| [[Knowledge Base/Storage/NAS.md\|NAS]] \| [[Knowledge Base/Storage/Openmediavault.md\|Openmediavault]] \| [[Knowledge Base/Storage/ZFS Backups.md\|ZFS Backups]] \| [[Knowledge Base/Storage/ZFS.md\|ZFS]] |

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

| File                                                         | Created                  | Updated                   |
| ------------------------------------------------------------ | ------------------------ | ------------------------- |
| [[Knowledge Base/Storage/index.md\|index]]                   | 8:33 PM - April 12, 2026 | 2:36 PM - April 13, 2026  |
| [[Knowledge Base/Storage/NAS.md\|NAS]]                       | 8:33 PM - April 12, 2026 | 2:23 PM - April 13, 2026  |
| [[Knowledge Base/Storage/ZFS.md\|ZFS]]                       | 8:33 PM - April 12, 2026 | 11:29 PM - April 12, 2026 |
| [[Knowledge Base/Storage/Openmediavault.md\|Openmediavault]] | 8:33 PM - April 12, 2026 | 8:33 PM - April 12, 2026  |
| [[Knowledge Base/Storage/ZFS Backups.md\|ZFS Backups]]       | 8:33 PM - April 12, 2026 | 8:33 PM - April 12, 2026  |

%% DATAVIEW_PUBLISHER: end %%
