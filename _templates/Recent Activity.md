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
| [[daily/index.md\|index]]                          | modified | 4:41 PM - October 09, 2025 |
| [[Discord/Clippings/index.md\|index]]              | modified | 4:27 PM - October 09, 2025 |
| [[Tricks/index.md\|index]]                         | modified | 4:14 PM - October 09, 2025 |
| [[Tools/index.md\|index]]                          | modified | 4:14 PM - October 09, 2025 |
| [[Testing/index.md\|index]]                        | modified | 4:14 PM - October 09, 2025 |
| [[Lab/Systems/index.md\|index]]                    | modified | 4:13 PM - October 09, 2025 |
| [[Lab/index.md\|index]]                            | modified | 4:13 PM - October 09, 2025 |
| [[Knowledge Base/index.md\|index]]                 | modified | 4:13 PM - October 09, 2025 |
| [[_templates/Folder.md\|Folder]]                   | modified | 4:10 PM - October 09, 2025 |
| [[_templates/Recent Activity.md\|Recent Activity]] | modified | 4:09 PM - October 09, 2025 |

%% DATAVIEW_PUBLISHER: end %%

