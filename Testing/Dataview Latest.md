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

| File                                               | Action   | Date                       |
| -------------------------------------------------- | -------- | -------------------------- |
| [[daily/index.md\|index]]                          | modified | 3:34 PM - October 09, 2025 |
| [[Gizmos/index.md\|index]]                         | modified | 3:30 PM - October 09, 2025 |
| [[Knowledge Base/index.md\|index]]                 | modified | 3:30 PM - October 09, 2025 |
| [[_templates/Recent Activity.md\|Recent Activity]] | modified | 3:30 PM - October 09, 2025 |
| [[Testing/Dataview Latest.md\|Dataview Latest]]    | modified | 3:30 PM - October 09, 2025 |
| [[Lab/Systems/index.md\|index]]                    | modified | 3:30 PM - October 09, 2025 |
| [[Tools/Grafana.md\|Grafana]]                      | modified | 3:29 PM - October 09, 2025 |
| [[Tricks/Examples/index.md\|index]]                | modified | 3:28 PM - October 09, 2025 |
| [[Lab/Systems/index.md\|index]]                    | created  | 3:28 PM - October 09, 2025 |
| [[Testing/index.md\|index]]                        | modified | 3:28 PM - October 09, 2025 |

%% DATAVIEW_PUBLISHER: end %%
