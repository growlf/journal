---
tags: 
documentation: 
aliases:
---
# Description
Testing the dataview_publisher plugin.

%% DATAVIEW_PUBLISHER: start
```dataview
TABLE change[0] as "Action", change[1] as "Date"
FLATTEN list( list("modified", file.mtime), list("created", file.ctime)) as change
SORT change[1] DESC
LIMIT 10
```
%%

| File                                                                              | Action   | Date                          |
| --------------------------------------------------------------------------------- | -------- | ----------------------------- |
| [[publish/Testing/Dataview.md\|Dataview]]                                         | modified | 12:06 AM - September 11, 2025 |
| [[_templates/Recent Activity.md\|Recent Activity]]                                | modified | 12:06 AM - September 11, 2025 |
| [[publish/Testing/Dataview.md\|Dataview]]                                         | created  | 12:03 AM - September 11, 2025 |
| [[_templates/Project.md\|Project]]                                                | modified | 11:47 PM - September 10, 2025 |
| [[publish/Tools/Obsidian.md\|Obsidian]]                                           | modified | 11:47 PM - September 10, 2025 |
| [[publish/_assets/banner.md\|banner]]                                             | modified | 11:34 PM - September 10, 2025 |
| [[publish/index.md\|index]]                                                       | modified | 11:32 PM - September 10, 2025 |
| [[publish/Tools/CouchDB.md\|CouchDB]]                                             | modified | 10:52 PM - September 10, 2025 |
| [[publish/Tricks/Examples/CouchDB Deployment Files.md\|CouchDB Deployment Files]] | modified | 10:05 PM - September 10, 2025 |
| [[publish/Community/index.md\|index]]                                             | modified | 5:11 PM - September 10, 2025  |

%% DATAVIEW_PUBLISHER: end %%
