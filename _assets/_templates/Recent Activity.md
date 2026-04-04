%% DATAVIEW_PUBLISHER: start
```dataview
TABLE change[0] as "Action", change[1] as "Date"
FLATTEN list( list("modified", file.mtime), list("created", file.ctime)) as change
SORT change[1] DESC
LIMIT 10
```
%%

| File                                                                                      | Action   | Date                        |
| ----------------------------------------------------------------------------------------- | -------- | --------------------------- |
| [[Knowledge Base/Hardware.md\|Hardware]]                                                  | modified | 8:13 PM - November 10, 2025 |
| [[Knowledge Base/Hardware.md\|Hardware]]                                                  | created  | 8:13 PM - November 10, 2025 |
| [[Knowledge Base/Obsidian/_design.md\|_design]]                                           | modified | 8:12 PM - November 10, 2025 |
| [[Knowledge Base/Obsidian/_design.md\|_design]]                                           | created  | 8:12 PM - November 10, 2025 |
| [[Knowledge Base/Obsidian/Joining to Obsidian LiveSync.md\|Joining to Obsidian LiveSync]] | modified | 8:12 PM - November 10, 2025 |
| [[Knowledge Base/Obsidian/Joining to Obsidian LiveSync.md\|Joining to Obsidian LiveSync]] | created  | 8:12 PM - November 10, 2025 |
| [[Knowledge Base/Obsidian/CouchDB Deployment Files.md\|CouchDB Deployment Files]]         | modified | 8:06 PM - November 10, 2025 |
| [[Knowledge Base/Obsidian/CouchDB Deployment Files.md\|CouchDB Deployment Files]]         | created  | 8:06 PM - November 10, 2025 |
| [[Knowledge Base/DNS/index.md\|index]]                                                    | modified | 8:02 PM - November 10, 2025 |
| [[Knowledge Base/DNS/index.md\|index]]                                                    | created  | 8:02 PM - November 10, 2025 |

%% DATAVIEW_PUBLISHER: end %%

