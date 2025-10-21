---
title: Lab
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

| Folder | Documents                                                                                           |
| ------ | --------------------------------------------------------------------------------------------------- |
| Lab    | [[Lab/Home Lab 101.md\|Home Lab 101]] \| [[Lab/index.md\|index]] \| [[Lab/The Stack.md\|The Stack]] |

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

| File                                  | Created                    | Updated                    |
| ------------------------------------- | -------------------------- | -------------------------- |
| [[Lab/Home Lab 101.md\|Home Lab 101]] | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Lab/The Stack.md\|The Stack]]       | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Lab/index.md\|index]]               | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |

%% DATAVIEW_PUBLISHER: end %%