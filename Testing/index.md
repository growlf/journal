---
title: Testing
---
> [!WARNING] Warning!!
> There might be dragons in these here experiments...

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

| Folder  | Documents                                                                                                                                                                                                                              |
| ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Testing | [[Testing/_design.md\|_design]] \| [[Testing/Dataview Latest.md\|Dataview Latest]] \| [[Testing/footer.md\|footer]] \| [[Testing/header.md\|header]] \| [[Testing/index.md\|index]] \| [[Testing/Properties Test.md\|Properties Test]] |

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
%% DATAVIEW_PUBLISHER: end %%