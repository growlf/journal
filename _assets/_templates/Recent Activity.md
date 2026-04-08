%% DATAVIEW_PUBLISHER: start
```dataview
TABLE change[0] as "Action", change[1] as "Date"
FLATTEN list( list("modified", file.mtime), list("created", file.ctime)) as change
SORT change[1] DESC
LIMIT 10
```
%%

| File                                                 | Action   | Date                     |
| ---------------------------------------------------- | -------- | ------------------------ |
| [[Internal/daily/2025/09/index.md\|index]]           | modified | 1:04 AM - April 08, 2026 |
| [[Internal/daily/2026/02/index.md\|index]]           | modified | 1:04 AM - April 08, 2026 |
| [[Internal/daily/2025/index.md\|index]]              | modified | 1:04 AM - April 08, 2026 |
| [[Internal/daily/2026/01/index.md\|index]]           | modified | 1:04 AM - April 08, 2026 |
| [[Internal/daily/2025/12/index.md\|index]]           | modified | 1:04 AM - April 08, 2026 |
| [[Internal/daily/2025/11/index.md\|index]]           | modified | 1:04 AM - April 08, 2026 |
| [[Internal/daily/2025/10/index.md\|index]]           | modified | 1:04 AM - April 08, 2026 |
| [[Internal/daily/2025/08/index.md\|index]]           | modified | 1:04 AM - April 08, 2026 |
| [[Internal/daily/2025/07/index.md\|index]]           | modified | 1:04 AM - April 08, 2026 |
| [[Internal/daily/2025/11/2025-11-11.md\|2025-11-11]] | modified | 1:04 AM - April 08, 2026 |

%% DATAVIEW_PUBLISHER: end %%

