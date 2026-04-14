%% DATAVIEW_PUBLISHER: start
```dataview
TABLE change[0] as "Action", change[1] as "Date"
FLATTEN list( list("modified", file.mtime), list("created", file.ctime)) as change
SORT change[1] DESC
LIMIT 10
```
%%

| File                                                        | Action   | Date                     |
| ----------------------------------------------------------- | -------- | ------------------------ |
| [[Internal/daily/2026/04/2026-04-12.md\|2026-04-12]]        | modified | 2:40 PM - April 13, 2026 |
| [[index.md\|index]]                                         | modified | 2:36 PM - April 13, 2026 |
| [[_templates/index.md\|index]]                              | modified | 2:36 PM - April 13, 2026 |
| [[_templates/Recent Activity.md\|Recent Activity]]          | modified | 2:36 PM - April 13, 2026 |
| [[_templates/Folder.md\|Folder]]                            | modified | 2:36 PM - April 13, 2026 |
| [[_assets/copilot/index.md\|index]]                         | modified | 2:36 PM - April 13, 2026 |
| [[_assets/_templates/Recent Activity.md\|Recent Activity]]  | modified | 2:36 PM - April 13, 2026 |
| [[_assets/_templates/Folder.md\|Folder]]                    | modified | 2:36 PM - April 13, 2026 |
| [[_assets/Excalidraw/index.md\|index]]                      | modified | 2:36 PM - April 13, 2026 |
| [[_assets/AI-Skills/secret-manager-expert/index.md\|index]] | modified | 2:36 PM - April 13, 2026 |

%% DATAVIEW_PUBLISHER: end %%

