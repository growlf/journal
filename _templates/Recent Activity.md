%% DATAVIEW_PUBLISHER: start
```dataview
TABLE change[0] as "Action", change[1] as "Date"
FLATTEN list( list("modified", file.mtime), list("created", file.ctime)) as change
SORT change[1] DESC
LIMIT 10
```
%%

| File                                  | Action   | Date                       |
| ------------------------------------- | -------- | -------------------------- |
| [[index.md\|index]]                   | modified | 8:04 PM - October 20, 2025 |
| [[daily/2025-10-14.md\|2025-10-14]]   | created  | 8:01 PM - October 20, 2025 |
| [[daily/2025-07-17.md\|2025-07-17]]   | created  | 8:01 PM - October 20, 2025 |
| [[daily/2025-10-15.md\|2025-10-15]]   | created  | 8:01 PM - October 20, 2025 |
| [[daily/2025-08-17.md\|2025-08-17]]   | created  | 8:01 PM - October 20, 2025 |
| [[daily/2025-10-10.md\|2025-10-10]]   | created  | 8:01 PM - October 20, 2025 |
| [[daily/settings.md\|settings]]       | created  | 8:01 PM - October 20, 2025 |
| [[daily/2025-07-28.md\|2025-07-28]]   | created  | 8:01 PM - October 20, 2025 |
| [[daily/2025-10-13.md\|2025-10-13]]   | created  | 8:01 PM - October 20, 2025 |
| [[daily/Install URI.md\|Install URI]] | created  | 8:01 PM - October 20, 2025 |

%% DATAVIEW_PUBLISHER: end %%

