%% DATAVIEW_PUBLISHER: start
```dataview
TABLE change[0] as "Action", change[1] as "Date"
FLATTEN list( list("modified", file.mtime), list("created", file.ctime)) as change
SORT change[1] DESC
LIMIT 10
```
%%

| File                                                               | Action   | Date                     |
| ------------------------------------------------------------------ | -------- | ------------------------ |
| [[index.md\|index]]                                                | modified | 1:39 PM - April 07, 2026 |
| [[_assets/_templates/Recent Activity.md\|Recent Activity]]         | modified | 1:38 PM - April 07, 2026 |
| [[_assets/_templates/Folder.md\|Folder]]                           | modified | 1:38 PM - April 07, 2026 |
| [[_assets/_excalidraw/index.md\|index]]                            | modified | 1:38 PM - April 07, 2026 |
| [[_assets/AI-Skills/index.md\|index]]                              | modified | 1:38 PM - April 07, 2026 |
| [[_assets/AI-Skills/ai-stack-engineer/scripts/index.md\|index]]    | modified | 1:38 PM - April 07, 2026 |
| [[_assets/AI-Skills/ai-stack-engineer/references/index.md\|index]] | modified | 1:38 PM - April 07, 2026 |
| [[_assets/AI-Skills/ai-stack-engineer/index.md\|index]]            | modified | 1:38 PM - April 07, 2026 |
| [[_assets/AI-Skills/ai-stack-engineer/assets/index.md\|index]]     | modified | 1:38 PM - April 07, 2026 |
| [[Network/Services/Ollama/ollama_data/index.md\|index]]            | modified | 1:38 PM - April 07, 2026 |

%% DATAVIEW_PUBLISHER: end %%

