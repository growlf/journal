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

| File                                   | Action   | Date                        |
| -------------------------------------- | -------- | --------------------------- |
| [[index.md\|index]]                    | modified | 11:53 PM - October 09, 2025 |
| [[daily/2025-10-09.md\|2025-10-09]]    | modified | 11:51 PM - October 09, 2025 |
| [[_templates/dailynote.md\|dailynote]] | modified | 11:42 PM - October 09, 2025 |
| [[daily/index.md\|index]]              | modified | 11:40 PM - October 09, 2025 |
| [[daily/2025-08-17.md\|2025-08-17]]    | modified | 11:39 PM - October 09, 2025 |
| [[Tools/CouchDB.md\|CouchDB]]          | modified | 11:34 PM - October 09, 2025 |
| [[daily/2025-08-20.md\|2025-08-20]]    | modified | 11:18 PM - October 09, 2025 |
| [[daily/2025-10-09.md\|2025-10-09]]    | created  | 11:17 PM - October 09, 2025 |
| [[_templates/Daily2.md\|Daily2]]       | modified | 11:08 PM - October 09, 2025 |
| [[_templates/Daily2.md\|Daily2]]       | created  | 11:06 PM - October 09, 2025 |

%% DATAVIEW_PUBLISHER: end %%
