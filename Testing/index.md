---
title: Testing
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

| Folder  | Documents                                                      |
| ------- | -------------------------------------------------------------- |
| Testing | [[Testing/_design.md\|_design]] \| [[Testing/index.md\|index]] |

%% DATAVIEW_PUBLISHER: end %%
### Recent Changes / Additions
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

| File                            | Created                    | Updated                       |
| ------------------------------- | -------------------------- | ----------------------------- |
| [[Testing/index.md\|index]]     | 4:14 PM - October 21, 2025 | 1:56 PM - October 22, 2025    |
| [[Testing/_design.md\|_design]] | 4:19 PM - October 20, 2025 | 12:43 AM - September 11, 2025 |

%% DATAVIEW_PUBLISHER: end %%
