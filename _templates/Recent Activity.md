%% DATAVIEW_PUBLISHER: start
```dataview
TABLE change[0] as "Action", change[1] as "Date"
FLATTEN list( list("modified", file.mtime), list("created", file.ctime)) as change
SORT change[1] DESC
LIMIT 10
```
%%

| File                                    | Action   | Date                       |
| --------------------------------------- | -------- | -------------------------- |
| [[Tricks/Examples/_design.md\|_design]] | modified | 1:45 PM - October 28, 2025 |
| [[Testing/index.md\|index]]             | modified | 1:45 PM - October 28, 2025 |
| [[Lab/devices/dn3.md\|dn3]]             | modified | 1:43 PM - October 28, 2025 |
| [[Lab/devices/dn3.md\|dn3]]             | created  | 1:43 PM - October 28, 2025 |
| [[Lab/devices/dn1.md\|dn1]]             | modified | 1:43 PM - October 28, 2025 |
| [[Lab/devices/dn2.md\|dn2]]             | modified | 1:43 PM - October 28, 2025 |
| [[Lab/devices/dn2.md\|dn2]]             | created  | 1:43 PM - October 28, 2025 |
| [[Lab/devices/dn1.md\|dn1]]             | created  | 1:42 PM - October 28, 2025 |
| [[Lab/devices/Sterling.md\|Sterling]]   | modified | 1:39 PM - October 28, 2025 |
| [[Lab/devices/Sliver.md\|Sliver]]       | modified | 1:39 PM - October 28, 2025 |

%% DATAVIEW_PUBLISHER: end %%

