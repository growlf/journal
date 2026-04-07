---
title: Community
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

| Folder    | Documents                                                                                                                                                                                                                                                                                                |
| --------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Community | [[Knowledge Base/Community/CAB.md\|CAB]] \| [[Knowledge Base/Community/Discord Linkable ID.md\|Discord Linkable ID]] \| [[Knowledge Base/Community/FLOSS.md\|FLOSS]] \| [[Knowledge Base/Community/index.md\|index]] \| [[Knowledge Base/Community/Mentor-based Internship.md\|Mentor-based Internship]] |

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

| File                                                                             | Created                   | Updated                   |
| -------------------------------------------------------------------------------- | ------------------------- | ------------------------- |
| [[Knowledge Base/Community/CAB.md\|CAB]]                                         | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Community/Discord Linkable ID.md\|Discord Linkable ID]]         | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Community/FLOSS.md\|FLOSS]]                                     | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Community/Mentor-based Internship.md\|Mentor-based Internship]] | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Community/index.md\|index]]                                     | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |

%% DATAVIEW_PUBLISHER: end %%
