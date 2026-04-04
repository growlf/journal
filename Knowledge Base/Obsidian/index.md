---
title: Knowledge Base/Obsidian
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

| Folder   | Documents                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| -------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Obsidian | [[Knowledge Base/Obsidian/_design.md\|_design]] \| [[Knowledge Base/Obsidian/Couch DB Tricks.md\|Couch DB Tricks]] \| [[Knowledge Base/Obsidian/CouchDB Deployment Files.md\|CouchDB Deployment Files]] \| [[Knowledge Base/Obsidian/Create a CouchDB User Account.md\|Create a CouchDB User Account]] \| [[Knowledge Base/Obsidian/Form Test.md\|Form Test]] \| [[Knowledge Base/Obsidian/GitHub-Quartz-Obsidian.md\|GitHub-Quartz-Obsidian]] \| [[Knowledge Base/Obsidian/index.md\|index]] \| [[Knowledge Base/Obsidian/Joining to Obsidian LiveSync.md\|Joining to Obsidian LiveSync]] \| [[Knowledge Base/Obsidian/Obsidian Plugins.md\|Obsidian Plugins]] \| [[Knowledge Base/Obsidian/Tasks.md\|Tasks]] |

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

| File                                                                                      | Created                     | Updated                     |
| ----------------------------------------------------------------------------------------- | --------------------------- | --------------------------- |
| [[Knowledge Base/Obsidian/_design.md\|_design]]                                           | 8:12 PM - November 10, 2025 | 8:12 PM - November 10, 2025 |
| [[Knowledge Base/Obsidian/Joining to Obsidian LiveSync.md\|Joining to Obsidian LiveSync]] | 8:12 PM - November 10, 2025 | 8:12 PM - November 10, 2025 |
| [[Knowledge Base/Obsidian/CouchDB Deployment Files.md\|CouchDB Deployment Files]]         | 8:06 PM - November 10, 2025 | 8:06 PM - November 10, 2025 |
| [[Knowledge Base/Obsidian/Tasks.md\|Tasks]]                                               | 5:55 PM - November 05, 2025 | 5:55 PM - November 05, 2025 |
| [[Knowledge Base/Obsidian/Obsidian Plugins.md\|Obsidian Plugins]]                         | 5:55 PM - November 05, 2025 | 5:55 PM - November 05, 2025 |
| [[Knowledge Base/Obsidian/GitHub-Quartz-Obsidian.md\|GitHub-Quartz-Obsidian]]             | 5:55 PM - November 05, 2025 | 5:55 PM - November 05, 2025 |
| [[Knowledge Base/Obsidian/Form Test.md\|Form Test]]                                       | 5:55 PM - November 05, 2025 | 5:55 PM - November 05, 2025 |

%% DATAVIEW_PUBLISHER: end %%
