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
| [[Knowledge Base/Storage/index|index]] | 12:26 AM - April 16, 2026 | 12:26 AM - April 16, 2026 |
| [[Knowledge Base/Storage/ZFS|ZFS]] | 8:08 PM - April 15, 2026 | 7:10 PM - April 15, 2026 |
| [[Knowledge Base/Storage/Openmediavault|Openmediavault]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Storage/ZFS Backups|ZFS Backups]] | 8:08 PM - April 15, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Storage/NAS|NAS]] | 8:08 PM - April 15, 2026 | 2:06 PM - April 14, 2026 |

%% DATAVIEW_PUBLISHER: end %%
