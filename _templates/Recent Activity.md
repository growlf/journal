%% DATAVIEW_PUBLISHER: start
```dataview
TABLE change[0] as "Action", change[1] as "Date"
FLATTEN list( list("modified", file.mtime), list("created", file.ctime)) as change
SORT change[1] DESC
LIMIT 10
```
%%

| File                                            | Action   | Date                       |
| ----------------------------------------------- | -------- | -------------------------- |
| [[Lab/index.md\|index]]                         | modified | 3:24 PM - October 09, 2025 |
| [[Lab/index.md\|index]]                         | created  | 3:24 PM - October 09, 2025 |
| [[_templates/Folder.md\|Folder]]                | modified | 3:23 PM - October 09, 2025 |
| [[Testing/Properties Test.md\|Properties Test]] | modified | 3:20 PM - October 09, 2025 |
| [[Testing/Properties Test.md\|Properties Test]] | created  | 3:09 PM - October 09, 2025 |
| [[Tricks/index.md\|index]]                      | modified | 3:08 PM - October 09, 2025 |
| [[Tools/index.md\|index]]                       | modified | 2:58 PM - October 09, 2025 |
| [[Testing/index.md\|index]]                     | modified | 2:58 PM - October 09, 2025 |
| [[Glossary/index.md\|index]]                    | modified | 2:58 PM - October 09, 2025 |
| [[Gizmos/index.md\|index]]                      | modified | 2:58 PM - October 09, 2025 |

%% DATAVIEW_PUBLISHER: end %%

