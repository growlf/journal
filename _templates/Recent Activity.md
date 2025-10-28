%% DATAVIEW_PUBLISHER: start
```dataview
TABLE change[0] as "Action", change[1] as "Date"
FLATTEN list( list("modified", file.mtime), list("created", file.ctime)) as change
SORT change[1] DESC
LIMIT 10
```
%%

| File                                                 | Action   | Date                       |
| ---------------------------------------------------- | -------- | -------------------------- |
| [[Lab/services/Openmediavault.md\|Openmediavault]]   | modified | 1:13 PM - October 28, 2025 |
| [[Lab/devices/Interceptor.md\|Interceptor]]          | modified | 1:12 PM - October 28, 2025 |
| [[Lab/devices/Interceptor.md\|Interceptor]]          | created  | 1:12 PM - October 28, 2025 |
| [[Lab/services/Docker Registry.md\|Docker Registry]] | modified | 1:10 PM - October 28, 2025 |
| [[Lab/services/Grafana.md\|Grafana]]                 | modified | 1:10 PM - October 28, 2025 |
| [[Lab/index.md\|index]]                              | modified | 1:08 PM - October 28, 2025 |
| [[Lab/services/Apt Cacher NG.md\|Apt Cacher NG]]     | modified | 1:07 PM - October 28, 2025 |
| [[index.md\|index]]                                  | modified | 1:03 PM - October 28, 2025 |
| [[_templates/Recent Activity.md\|Recent Activity]]   | modified | 1:03 PM - October 28, 2025 |
| [[_templates/Folder.md\|Folder]]                     | modified | 1:01 PM - October 28, 2025 |

%% DATAVIEW_PUBLISHER: end %%

