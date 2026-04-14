---
title: _assets/AI-Skills/task-sergeant
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

| Folder        | Documents                                                                                                  |
| ------------- | ---------------------------------------------------------------------------------------------------------- |
| task-sergeant | [[_assets/AI-Skills/task-sergeant/index.md\|index]] \| [[_assets/AI-Skills/task-sergeant/SKILL.md\|SKILL]] |

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

| File                                                | Created                  | Updated                  |
| --------------------------------------------------- | ------------------------ | ------------------------ |
| [[_assets/AI-Skills/task-sergeant/index.md\|index]] | 2:16 PM - April 13, 2026 | 2:36 PM - April 13, 2026 |
| [[_assets/AI-Skills/task-sergeant/SKILL.md\|SKILL]] | 2:16 PM - April 13, 2026 | 2:16 PM - April 13, 2026 |

%% DATAVIEW_PUBLISHER: end %%
