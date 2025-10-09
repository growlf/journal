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

| File                                         | Action   | Date                          |
| -------------------------------------------- | -------- | ----------------------------- |
| [[index\|index]]                  | modified | 1:21 AM - September 21, 2025  |
| [[banner\|banner]]        | modified | 1:15 AM - September 21, 2025  |
| [[daily/2025-09-17.md\|2025-09-17]]          | modified | 12:32 AM - September 19, 2025 |
| [[daily/2025-09-17.md\|2025-09-17]]          | created  | 6:38 PM - September 17, 2025  |
| [[ZFS Backup\|ZFS Backup]] | modified | 3:41 PM - September 17, 2025  |
| [[header\|header]]        | modified | 12:22 PM - September 17, 2025 |
| [[header\|header]]        | created  | 12:22 PM - September 17, 2025 |
| [[footer\|footer]]        | modified | 12:21 PM - September 17, 2025 |
| [[footer\|footer]]        | created  | 12:19 PM - September 17, 2025 |
| [[daily/ZFS Backups.md\|ZFS Backups]]        | modified | 10:01 PM - September 16, 2025 |

%% DATAVIEW_PUBLISHER: end %%
