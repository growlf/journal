%% DATAVIEW_PUBLISHER: start
```dataview
TABLE change[0] as "Action", change[1] as "Date"
FLATTEN list( list("modified", file.mtime), list("created", file.ctime)) as change
SORT change[1] DESC
LIMIT 10
```
%%

| File                                                                | Action   | Date                       |
| ------------------------------------------------------------------- | -------- | -------------------------- |
| [[index.md\|index]]                                                 | modified | 3:08 PM - October 28, 2025 |
| [[_assets/obsidian-directory-layout.md\|obsidian-directory-layout]] | modified | 3:01 PM - October 28, 2025 |
| [[Knowledge Base/Obsidian.md\|Obsidian]]                            | modified | 2:55 PM - October 28, 2025 |
| [[Network/index\|index]]                                             | modified | 2:12 PM - October 28, 2025 |
| [[Folder\|Folder]]                                    | modified | 1:46 PM - October 28, 2025 |
| [[Recent Activity\|Recent Activity]]                  | modified | 1:46 PM - October 28, 2025 |
| [[_assets/Excalidraw/Scripts/Downloaded/index.md.md\|index.md]]     | modified | 1:46 PM - October 28, 2025 |
| [[Tricks/Examples/index.md\|index]]                                 | modified | 1:46 PM - October 28, 2025 |
| [[Tricks/index.md\|index]]                                          | modified | 1:46 PM - October 28, 2025 |
| [[Knowledge Base/index.md\|index]]                                  | modified | 1:46 PM - October 28, 2025 |

%% DATAVIEW_PUBLISHER: end %%

