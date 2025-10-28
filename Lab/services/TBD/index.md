---
title: Tools
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

| Folder | Documents                                                                                                                                |
| ------ | ---------------------------------------------------------------------------------------------------------------------------------------- |
| TBD    | [[Lab/services/TBD/index.md\|index]] \| [[Lab/services/TBD/PVE Monitor-All.md\|PVE Monitor-All]] \| [[Lab/services/TBD/Shell.md\|Shell]] |

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

| File                                                     | Created                    | Updated                    |
| -------------------------------------------------------- | -------------------------- | -------------------------- |
| [[Lab/services/TBD/index.md\|index]]                     | 4:19 PM - October 20, 2025 | 1:00 PM - October 28, 2025 |
| [[Lab/services/TBD/PVE Monitor-All.md\|PVE Monitor-All]] | 4:41 PM - October 20, 2025 | 1:00 PM - October 28, 2025 |

%% DATAVIEW_PUBLISHER: end %%