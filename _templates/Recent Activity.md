%% DATAVIEW_PUBLISHER: start
```dataview
TABLE change[0] as "Action", change[1] as "Date"
FLATTEN list( list("modified", file.mtime), list("created", file.ctime)) as change
SORT change[1] DESC
LIMIT 10
```
%%

| File                                               | Action   | Date                        |
| -------------------------------------------------- | -------- | --------------------------- |
| [[index.md\|index]]                                | modified | 11:56 PM - October 09, 2025 |
| [[_templates/Recent Activity.md\|Recent Activity]] | modified | 11:53 PM - October 09, 2025 |
| [[_assets/Excalidraw/index.md\|index]]             | modified | 11:53 PM - October 09, 2025 |
| [[_templates/Folder.md\|Folder]]                   | modified | 11:53 PM - October 09, 2025 |
| [[Tricks/index.md\|index]]                         | modified | 11:53 PM - October 09, 2025 |
| [[Tools/index.md\|index]]                          | modified | 11:53 PM - October 09, 2025 |
| [[Testing/Dataview Latest.md\|Dataview Latest]]    | modified | 11:53 PM - October 09, 2025 |
| [[Testing/index.md\|index]]                        | modified | 11:53 PM - October 09, 2025 |
| [[Lab/index.md\|index]]                            | modified | 11:53 PM - October 09, 2025 |
| [[Lab/Systems/index.md\|index]]                    | modified | 11:53 PM - October 09, 2025 |

%% DATAVIEW_PUBLISHER: end %%

