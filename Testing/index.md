---
title: Testing
---

> [!WARNING] Warning!!
> There might be dragons in these here experiments...

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
%% DATAVIEW_PUBLISHER: end %%