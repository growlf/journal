---
title: _assets/_scripts
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

| Folder     | Documents                                                                                                                                                              |
| ---------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| _templates | [[dailynote\|dailynote]] \| [[Folder\|Folder]] \| [[Project\|Project]] \| [[Recent Activity\|Recent Activity]] |

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

| File                                               | Created                    | Updated                    |
| -------------------------------------------------- | -------------------------- | -------------------------- |
| [[Folder\|Folder]]                   | 4:19 PM - October 20, 2025 | 1:46 PM - October 28, 2025 |
| [[Recent Activity\|Recent Activity]] | 4:19 PM - October 20, 2025 | 1:46 PM - October 28, 2025 |
| [[dailynote\|dailynote]]             | 4:19 PM - October 20, 2025 | 1:39 PM - October 21, 2025 |

%% DATAVIEW_PUBLISHER: end %%
