---
title: Ollama Role Templates
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

| Folder | Documents |
| --- | --- |

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

| File | Created | Updated |
| --- | --- |
| [[_assets/_templates/Recent Activity|Recent Activity]] | 12:26 AM - April 16, 2026 | 12:26 AM - April 16, 2026 |
| [[_assets/_templates/Folder|Folder]] | 12:26 AM - April 16, 2026 | 12:26 AM - April 16, 2026 |
| [[_assets/_templates/Project|Project]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/AAR|AAR]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/Post-Implementation Review|Post-Implementation Review]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/dailynote|dailynote]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/Discovery Time|Discovery Time]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/Network|Network]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/Service|Service]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/Person|Person]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/Daily|Daily]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/Issue|Issue]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/index|index]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/Project Proposal|Project Proposal]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/Base|Base]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/Daily2|Daily2]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/Policy|Policy]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/Device|Device]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/LearningModule|LearningModule]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/IssueTest|IssueTest]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |

%% DATAVIEW_PUBLISHER: end %%
