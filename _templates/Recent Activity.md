%% DATAVIEW_PUBLISHER: start
```dataview
TABLE change[0] as "Action", change[1] as "Date"
FLATTEN list( list("modified", file.mtime), list("created", file.ctime)) as change
SORT change[1] DESC
LIMIT 10
```
%%

| File                                                            | Action   | Date                       |
| --------------------------------------------------------------- | -------- | -------------------------- |
| [[index.md\|index]]                                             | modified | 1:56 PM - October 22, 2025 |
| [[daily/2025-10-22.md\|2025-10-22]]                             | modified | 1:55 PM - October 22, 2025 |
| [[daily/2025-10-22.md\|2025-10-22]]                             | created  | 1:55 PM - October 22, 2025 |
| [[devices/Gearbox.md\|Gearbox]]                                 | modified | 4:48 PM - October 21, 2025 |
| [[devices/Gearbox.md\|Gearbox]]                                 | created  | 4:48 PM - October 21, 2025 |
| [[_assets/Excalidraw/Scripts/Downloaded/index.md.md\|index.md]] | modified | 4:37 PM - October 21, 2025 |
| [[_assets/Excalidraw/Scripts/Downloaded/index.md.md\|index.md]] | created  | 4:37 PM - October 21, 2025 |
| [[Testing/index.md\|index]]                                     | modified | 4:14 PM - October 21, 2025 |
| [[Testing/index.md\|index]]                                     | created  | 4:14 PM - October 21, 2025 |
| [[daily/2025-10-21.md\|2025-10-21]]                             | modified | 4:05 PM - October 21, 2025 |

%% DATAVIEW_PUBLISHER: end %%

