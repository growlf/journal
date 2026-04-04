---
title: Knowledge Base/Untitled
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

| Folder     | Documents                                                                                                                                                                                                                                                                                                                                                                                                                            |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| _templates | [[_assets/_templates/dailynote.md\|dailynote]] \| [[_assets/_templates/Device.md\|Device]] \| [[_assets/_templates/Folder.md\|Folder]] \| [[_assets/_templates/Issue.md\|Issue]] \| [[_assets/_templates/Network.md\|Network]] \| [[_assets/_templates/Person.md\|Person]] \| [[_assets/_templates/Project.md\|Project]] \| [[_assets/_templates/Recent Activity.md\|Recent Activity]] \| [[_assets/_templates/Service.md\|Service]] |

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

| File                                                       | Created                     | Updated                      |
| ---------------------------------------------------------- | --------------------------- | ---------------------------- |
| [[_assets/_templates/Issue.md\|Issue]]                     | 5:55 PM - November 05, 2025 | 6:41 PM - October 31, 2025   |
| [[_assets/_templates/Device.md\|Device]]                   | 5:55 PM - November 05, 2025 | 11:04 PM - October 30, 2025  |
| [[_assets/_templates/Recent Activity.md\|Recent Activity]] | 5:55 PM - November 05, 2025 | 9:50 PM - October 30, 2025   |
| [[_assets/_templates/Folder.md\|Folder]]                   | 5:55 PM - November 05, 2025 | 9:43 PM - October 30, 2025   |
| [[_assets/_templates/Service.md\|Service]]                 | 5:55 PM - November 05, 2025 | 11:46 PM - October 29, 2025  |
| [[_assets/_templates/dailynote.md\|dailynote]]             | 5:55 PM - November 05, 2025 | 1:39 PM - October 21, 2025   |
| [[_assets/_templates/Project.md\|Project]]                 | 5:55 PM - November 05, 2025 | 2:44 PM - October 09, 2025   |
| [[_assets/_templates/Network.md\|Network]]                 | 5:55 PM - November 05, 2025 | 6:26 PM - September 20, 2025 |
| [[_assets/_templates/Person.md\|Person]]                   | 5:55 PM - November 05, 2025 | 2:47 PM - September 15, 2025 |

%% DATAVIEW_PUBLISHER: end %%
