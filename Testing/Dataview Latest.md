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

| File                                                         | Action   | Date                       |
| ------------------------------------------------------------ | -------- | -------------------------- |
| [[Tools/index.md\|index]]                                    | modified | 2:33 PM - October 09, 2025 |
| [[Testing/Dataview Latest.md\|Dataview Latest]]              | modified | 2:32 PM - October 09, 2025 |
| [[_templates/Recent Activity.md\|Recent Activity]]           | modified | 2:32 PM - October 09, 2025 |
| [[Glossary/Hardware.md\|Hardware]]                           | modified | 2:31 PM - October 09, 2025 |
| [[Tools/Grafana.md\|Grafana]]                                | modified | 2:30 PM - October 09, 2025 |
| [[Tricks/Replicating my Desktop.md\|Replicating my Desktop]] | modified | 2:30 PM - October 09, 2025 |
| [[Tools/SyncThing.md\|SyncThing]]                            | modified | 2:30 PM - October 09, 2025 |
| [[Tools/PVE Monitor-All.md\|PVE Monitor-All]]                | modified | 2:30 PM - October 09, 2025 |
| [[Tools/CouchDB.md\|CouchDB]]                                | modified | 2:30 PM - October 09, 2025 |
| [[daily/2025-08-17.md\|2025-08-17]]                          | modified | 2:30 PM - October 09, 2025 |

%% DATAVIEW_PUBLISHER: end %%
