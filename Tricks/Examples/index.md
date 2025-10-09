---
title: Examples
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

| Folder   | Documents                                                                                                        |
| -------- | ---------------------------------------------------------------------------------------------------------------- |
| Examples | [[Tricks/Examples/CouchDB Deployment Files.md\|CouchDB Deployment Files]] \| [[Tricks/Examples/index.md\|index]] |

%% DATAVIEW_PUBLISHER: end %%