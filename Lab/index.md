---
title: Lab
---
Contents:
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