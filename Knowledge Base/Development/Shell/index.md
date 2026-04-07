---
title: Knowledge Base/Development/Shell
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

| Folder | Documents                                                                                                    |
| ------ | ------------------------------------------------------------------------------------------------------------ |
| Shell  | [[Knowledge Base/Development/Shell/index.md\|index]] \| [[Knowledge Base/Development/Shell/RSync.md\|RSync]] |

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

| File                                                 | Created                   | Updated                   |
| ---------------------------------------------------- | ------------------------- | ------------------------- |
| [[Knowledge Base/Development/Shell/RSync.md\|RSync]] | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Development/Shell/index.md\|index]] | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |

%% DATAVIEW_PUBLISHER: end %%
