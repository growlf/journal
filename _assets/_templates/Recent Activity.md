%% DATAVIEW_PUBLISHER: start
```dataview
TABLE change[0] as "Action", change[1] as "Date"
FLATTEN list( list("modified", file.mtime), list("created", file.ctime)) as change
SORT change[1] DESC
LIMIT 10
```
%%

| File                                                                 | Action   | Date                     |
| -------------------------------------------------------------------- | -------- | ------------------------ |
| [[Discord/Logs/20260406_180825.md\|20260406_180825]]                 | modified | 1:37 PM - April 07, 2026 |
| [[Discord/Logs/20260406_180801.md\|20260406_180801]]                 | modified | 1:37 PM - April 07, 2026 |
| [[Discord/Logs/20260406_180825.md\|20260406_180825]]                 | created  | 1:37 PM - April 07, 2026 |
| [[Discord/Logs/20260406_180801.md\|20260406_180801]]                 | created  | 1:37 PM - April 07, 2026 |
| [[Network/Services/Ollama/ollama_data/models/index.md\|index]]       | modified | 1:36 PM - April 07, 2026 |
| [[Network/Services/Ollama/ollama_data/models/blobs/index.md\|index]] | modified | 1:36 PM - April 07, 2026 |
| [[Network/Services/Ollama/ollama_data/index.md\|index]]              | modified | 1:36 PM - April 07, 2026 |
| [[Network/Services/Ollama/ollama_data/models/blobs/index.md\|index]] | created  | 1:36 PM - April 07, 2026 |
| [[Network/Services/Ollama/ollama_data/models/index.md\|index]]       | created  | 1:36 PM - April 07, 2026 |
| [[Network/Services/Ollama/ollama_data/index.md\|index]]              | created  | 1:36 PM - April 07, 2026 |

%% DATAVIEW_PUBLISHER: end %%

