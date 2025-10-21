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

| File                                  | Action   | Date                        |
| ------------------------------------- | -------- | --------------------------- |
| [[daily/2025-08-17.md\|2025-08-17]]   | modified | 12:27 PM - October 14, 2025 |
| [[daily/2025-08-18.md\|2025-08-18]]   | modified | 12:27 PM - October 14, 2025 |
| [[daily/2025-10-09.md\|2025-10-09]]   | modified | 12:26 PM - October 14, 2025 |
| [[daily/2025-10-10.md\|2025-10-10]]   | modified | 12:26 PM - October 14, 2025 |
| [[daily/2025-10-13.md\|2025-10-13]]   | modified | 12:25 PM - October 14, 2025 |
| [[daily/2025-10-14.md\|2025-10-14]]   | modified | 12:23 PM - October 14, 2025 |
| [[daily/2025-10-14.md\|2025-10-14]]   | created  | 12:22 PM - October 14, 2025 |
| [[Lab/Home Lab 101.md\|Home Lab 101]] | modified | 4:48 PM - October 13, 2025  |
| [[Lab/index.md\|index]]               | modified | 4:42 PM - October 13, 2025  |
| [[Lab/Home Lab 101.md\|Home Lab 101]] | created  | 4:13 PM - October 13, 2025  |

%% DATAVIEW_PUBLISHER: end %%
