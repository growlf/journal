%% DATAVIEW_PUBLISHER: start
```dataview
TABLE change[0] as "Action", change[1] as "Date"
FLATTEN list( list("modified", file.mtime), list("created", file.ctime)) as change
SORT change[1] DESC
LIMIT 10
```
%%

| File                                          | Action   | Date                       |
| --------------------------------------------- | -------- | -------------------------- |
| [[index.md\|index]]                           | modified | 2:21 PM - October 22, 2025 |
| [[SyncThing\|SyncThing]]             | modified | 2:19 PM - October 22, 2025 |
| [[PVE Monitor-All\|PVE Monitor-All]] | modified | 2:19 PM - October 22, 2025 |
| [[Knowledge Base/DHCP.md\|DHCP]]              | modified | 2:18 PM - October 22, 2025 |
| [[Knowledge Base/DNS.md\|DNS]]                | modified | 2:15 PM - October 22, 2025 |
| [[Knowledge Base/WiFi.md\|WiFi]]              | modified | 2:13 PM - October 22, 2025 |
| [[Knowledge Base/Router.md\|Router]]          | modified | 2:13 PM - October 22, 2025 |
| [[Knowledge Base/Firewall.md\|Firewall]]      | modified | 2:13 PM - October 22, 2025 |
| [[Knowledge Base/Obsidian.md\|Obsidian]]      | modified | 2:12 PM - October 22, 2025 |
| [[Knowledge Base/ISP.md\|ISP]]                | modified | 2:10 PM - October 22, 2025 |

%% DATAVIEW_PUBLISHER: end %%

