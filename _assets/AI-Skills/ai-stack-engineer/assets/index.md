---
title: ai-stack-engineer
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

| Folder | Documents                                                      |
| ------ | -------------------------------------------------------------- |
| assets | [[_assets/AI-Skills/ai-stack-engineer/assets/index.md\|index]] |

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

| File                                                           | Created                   | Updated                  |
| -------------------------------------------------------------- | ------------------------- | ------------------------ |
| [[_assets/AI-Skills/ai-stack-engineer/assets/index.md\|index]] | 11:13 PM - April 05, 2026 | 1:40 PM - April 07, 2026 |

%% DATAVIEW_PUBLISHER: end %%
