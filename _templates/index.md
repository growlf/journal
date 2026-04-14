---
title: _templates
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

| Folder     | Documents                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| ---------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| _templates | [[_assets/_templates/AAR.md\|AAR]] \| [[_assets/_templates/dailynote.md\|dailynote]] \| [[_assets/_templates/Device.md\|Device]] \| [[_assets/_templates/Discovery Time.md\|Discovery Time]] \| [[_assets/_templates/Folder.md\|Folder]] \| [[_assets/_templates/index.md\|index]] \| [[_assets/_templates/Issue.md\|Issue]] \| [[_assets/_templates/IssueTest.md\|IssueTest]] \| [[_assets/_templates/LearningModule.md\|LearningModule]] \| [[_assets/_templates/Network.md\|Network]] \| [[_assets/_templates/Person.md\|Person]] \| [[_assets/_templates/Policy.md\|Policy]] \| [[_assets/_templates/Post-Implementation Review.md\|Post-Implementation Review]] \| [[_assets/_templates/Project Proposal (Standard or Major Changes).md\|Project Proposal (Standard or Major Changes)]] \| [[_assets/_templates/Project Proposal.md\|Project Proposal]] \| [[_assets/_templates/Project.md\|Project]] \| [[_assets/_templates/Recent Activity.md\|Recent Activity]] \| [[_assets/_templates/Service.md\|Service]] \| [[_templates/Base.md\|Base]] \| [[_templates/Daily.md\|Daily]] \| [[_templates/Daily2.md\|Daily2]] \| [[_templates/dailynote.md\|dailynote]] \| [[_templates/Folder.md\|Folder]] \| [[_templates/index.md\|index]] \| [[_templates/Project.md\|Project]] \| [[_templates/Recent Activity.md\|Recent Activity]] |

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

| File                                                       | Created                   | Updated                   |
| ---------------------------------------------------------- | ------------------------- | ------------------------- |
| [[_templates/index.md\|index]]                             | 10:45 PM - April 12, 2026 | 2:36 PM - April 13, 2026  |
| [[_templates/Recent Activity.md\|Recent Activity]]         | 10:45 PM - April 12, 2026 | 2:36 PM - April 13, 2026  |
| [[_templates/Folder.md\|Folder]]                           | 10:45 PM - April 12, 2026 | 2:36 PM - April 13, 2026  |
| [[_assets/_templates/Recent Activity.md\|Recent Activity]] | 8:33 PM - April 12, 2026  | 2:36 PM - April 13, 2026  |
| [[_assets/_templates/Folder.md\|Folder]]                   | 8:33 PM - April 12, 2026  | 2:36 PM - April 13, 2026  |
| [[_templates/dailynote.md\|dailynote]]                     | 10:45 PM - April 12, 2026 | 2:09 PM - April 13, 2026  |
| [[_assets/_templates/Device.md\|Device]]                   | 8:33 PM - April 12, 2026  | 12:32 PM - April 13, 2026 |
| [[_assets/_templates/Service.md\|Service]]                 | 8:33 PM - April 12, 2026  | 1:57 AM - April 13, 2026  |
| [[_assets/_templates/LearningModule.md\|LearningModule]]   | 8:33 PM - April 12, 2026  | 11:18 PM - April 12, 2026 |
| [[_assets/_templates/AAR.md\|AAR]]                         | 8:33 PM - April 12, 2026  | 11:18 PM - April 12, 2026 |
| [[_templates/Project.md\|Project]]                         | 10:45 PM - April 12, 2026 | 10:45 PM - April 12, 2026 |
| [[_templates/Base.md\|Base]]                               | 10:45 PM - April 12, 2026 | 10:45 PM - April 12, 2026 |
| [[_templates/Daily2.md\|Daily2]]                           | 10:45 PM - April 12, 2026 | 10:45 PM - April 12, 2026 |
| [[_assets/_templates/Project.md\|Project]]                 | 8:33 PM - April 12, 2026  | 8:33 PM - April 12, 2026  |
| [[_assets/_templates/Discovery Time.md\|Discovery Time]]   | 8:33 PM - April 12, 2026  | 8:33 PM - April 12, 2026  |
| [[_assets/_templates/Issue.md\|Issue]]                     | 8:33 PM - April 12, 2026  | 8:33 PM - April 12, 2026  |
| [[_assets/_templates/IssueTest.md\|IssueTest]]             | 8:33 PM - April 12, 2026  | 8:33 PM - April 12, 2026  |
| [[_assets/_templates/Network.md\|Network]]                 | 8:33 PM - April 12, 2026  | 8:33 PM - April 12, 2026  |
| [[_assets/_templates/Person.md\|Person]]                   | 8:33 PM - April 12, 2026  | 8:33 PM - April 12, 2026  |
| [[_assets/_templates/Policy.md\|Policy]]                   | 8:33 PM - April 12, 2026  | 8:33 PM - April 12, 2026  |

%% DATAVIEW_PUBLISHER: end %%
