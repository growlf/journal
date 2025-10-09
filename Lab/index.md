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

| Folder  | Documents                                                                                                                                                                                                                                                                                          |
| ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Lab     | [[Lab/Cloud Init.md\|Cloud Init]] \| [[Lab/index.md\|index]] \| [[Lab/The Stack.md\|The Stack]]                                                                                                                                                                                                    |
| Systems | [[Lab/Systems/Arc.md\|Arc]] \| [[Lab/Systems/Frank.md\|Frank]] \| [[Lab/Systems/Gearbox.md\|Gearbox]] \| [[Lab/Systems/index.md\|index]] \| [[Lab/Systems/Intercepter.md\|Intercepter]] \| [[Lab/Systems/Nexus.md\|Nexus]] \| [[Lab/Systems/Sliver.md\|Sliver]] \| [[Lab/Systems/Sylph.md\|Sylph]] |

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

| File                            | Created                       | Updated                    |
| ------------------------------- | ----------------------------- | -------------------------- |
| [[Lab/Systems/index.md\|index]] | 3:28 PM - October 09, 2025    | 4:13 PM - October 09, 2025 |
| [[Lab/index.md\|index]]         | 3:24 PM - October 09, 2025    | 4:13 PM - October 09, 2025 |
| [[Lab/The Stack.md\|The Stack]] | 12:43 AM - September 11, 2025 | 1:08 PM - October 09, 2025 |

%% DATAVIEW_PUBLISHER: end %%