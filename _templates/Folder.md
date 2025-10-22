---
title: <% tp.file.folder(true) %>
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
| _templates | [[_templates/dailynote.md\|dailynote]] \| [[_templates/Folder.md\|Folder]] \| [[_templates/Project.md\|Project]] \| [[_templates/Recent Activity.md\|Recent Activity]] |

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
| [[_templates/Recent Activity.md\|Recent Activity]] | 4:19 PM - October 20, 2025 | 1:56 PM - October 22, 2025 |
| [[_templates/Folder.md\|Folder]]                   | 4:19 PM - October 20, 2025 | 1:56 PM - October 22, 2025 |
| [[_templates/dailynote.md\|dailynote]]             | 4:19 PM - October 20, 2025 | 1:39 PM - October 21, 2025 |
| [[_templates/Project.md\|Project]]                 | 4:19 PM - October 20, 2025 | 2:44 PM - October 09, 2025 |

%% DATAVIEW_PUBLISHER: end %%
