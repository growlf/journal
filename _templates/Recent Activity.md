%% DATAVIEW_PUBLISHER: start
```dataview
TABLE change[0] as "Action", change[1] as "Date"
FLATTEN list( list("modified", file.mtime), list("created", file.ctime)) as change
SORT change[1] DESC
LIMIT 10
```
%%

| File                                                     | Action   | Date                        |
| -------------------------------------------------------- | -------- | --------------------------- |
| [[Lab/services/Grafana.md\|Grafana]]                     | modified | 1:00 PM - October 28, 2025  |
| [[daily/2025-08-17.md\|2025-08-17]]                      | modified | 1:00 PM - October 28, 2025  |
| [[Lab/services/TBD/index.md\|index]]                     | modified | 1:00 PM - October 28, 2025  |
| [[PVE Monitor-All\|PVE Monitor-All]] | modified | 1:00 PM - October 28, 2025  |
| [[Lab/services/CouchDB.md\|CouchDB]]                     | modified | 1:00 PM - October 28, 2025  |
| [[Lab/index.md\|index]]                                  | modified | 1:00 PM - October 28, 2025  |
| [[Knowledge Base/DNS.md\|DNS]]                           | modified | 1:00 PM - October 28, 2025  |
| [[Knowledge Base/LXC.md\|LXC]]                           | modified | 12:58 PM - October 28, 2025 |
| [[Lab/The Stack.md\|The Stack]]                          | modified | 12:53 PM - October 28, 2025 |
| [[Lab/services/Proxmox.md\|Proxmox]]                     | modified | 12:52 PM - October 28, 2025 |

%% DATAVIEW_PUBLISHER: end %%

