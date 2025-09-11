---
tags: 
documentation: 
aliases:
---
# Description
Testing the dataview_publisher plugin to list latest edits.

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
| [[publish/Testing/Dataview Tasks.md\|Dataview Tasks]]                             | modified | 12:04 PM - September 11, 2025 |
| [[_templates/Recent Activity.md\|Recent Activity]]                                | modified | 12:04 PM - September 11, 2025 |
| [[publish/Testing/Dataview Latest.md\|Dataview Latest]]                           | modified | 12:04 PM - September 11, 2025 |
| [[publish/Testing/Dataview Tasks.md\|Dataview Tasks]]                             | created  | 11:44 AM - September 11, 2025 |
| [[publish/index.md\|index]]                                                       | modified | 11:43 AM - September 11, 2025 |
| [[publish/Glossary/LLM.md\|LLM]]                                                  | modified | 11:32 AM - September 11, 2025 |
| [[Tasks.md\|Tasks]]                                                               | modified | 10:52 AM - September 11, 2025 |
| [[Tasks.md\|Tasks]]                                                               | created  | 10:52 AM - September 11, 2025 |
| [[publish/Tricks/Examples/CouchDB Deployment Files.md\|CouchDB Deployment Files]] | modified | 12:43 AM - September 11, 2025 |
| [[publish/Tricks/Examples/Examples.md\|Examples]]                                 | modified | 12:43 AM - September 11, 2025 |

%% DATAVIEW_PUBLISHER: end %%
