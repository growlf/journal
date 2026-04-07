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

| Folder     | Documents                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| ---------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| _templates | [[_assets/_templates/AAR.md\|AAR]] \| [[_assets/_templates/dailynote.md\|dailynote]] \| [[_assets/_templates/Device.md\|Device]] \| [[_assets/_templates/Discovery Time.md\|Discovery Time]] \| [[_assets/_templates/Folder.md\|Folder]] \| [[_assets/_templates/index.md\|index]] \| [[_assets/_templates/Issue.md\|Issue]] \| [[_assets/_templates/IssueTest.md\|IssueTest]] \| [[_assets/_templates/Network.md\|Network]] \| [[_assets/_templates/Person.md\|Person]] \| [[_assets/_templates/Policy.md\|Policy]] \| [[_assets/_templates/Post-Implementation Review.md\|Post-Implementation Review]] \| [[_assets/_templates/Project Proposal (Standard or Major Changes).md\|Project Proposal (Standard or Major Changes)]] \| [[_assets/_templates/Project Proposal.md\|Project Proposal]] \| [[_assets/_templates/Project.md\|Project]] \| [[_assets/_templates/Recent Activity.md\|Recent Activity]] \| [[_assets/_templates/Service.md\|Service]] |

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

| File                                                                                                                 | Created                   | Updated                   |
| -------------------------------------------------------------------------------------------------------------------- | ------------------------- | ------------------------- |
| [[_assets/_templates/Recent Activity.md\|Recent Activity]]                                                           | 11:13 PM - April 05, 2026 | 1:38 PM - April 07, 2026  |
| [[_assets/_templates/Folder.md\|Folder]]                                                                             | 11:13 PM - April 05, 2026 | 1:38 PM - April 07, 2026  |
| [[_assets/_templates/AAR.md\|AAR]]                                                                                   | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[_assets/_templates/Discovery Time.md\|Discovery Time]]                                                             | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[_assets/_templates/Network.md\|Network]]                                                                           | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[_assets/_templates/Project.md\|Project]]                                                                           | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[_assets/_templates/Service.md\|Service]]                                                                           | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[_assets/_templates/dailynote.md\|dailynote]]                                                                       | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[_assets/_templates/Device.md\|Device]]                                                                             | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[_assets/_templates/Issue.md\|Issue]]                                                                               | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[_assets/_templates/IssueTest.md\|IssueTest]]                                                                       | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[_assets/_templates/Person.md\|Person]]                                                                             | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[_assets/_templates/Policy.md\|Policy]]                                                                             | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[_assets/_templates/Post-Implementation Review.md\|Post-Implementation Review]]                                     | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[_assets/_templates/Project Proposal (Standard or Major Changes).md\|Project Proposal (Standard or Major Changes)]] | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[_assets/_templates/Project Proposal.md\|Project Proposal]]                                                         | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[_assets/_templates/index.md\|index]]                                                                               | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |

%% DATAVIEW_PUBLISHER: end %%
