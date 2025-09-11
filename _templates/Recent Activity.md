%% DATAVIEW_PUBLISHER: start
```dataview
TABLE change[0] as "Action", change[1] as "Date"
FLATTEN list( list("modified", file.mtime), list("created", file.ctime)) as change
SORT change[1] DESC
LIMIT 10
```
%%

| File                                                                              | Action   | Date                          |
| --------------------------------------------------------------------------------- | -------- | ----------------------------- |
| [[publish/index.md\|index]]                                                       | modified | 11:27 AM - September 11, 2025 |
| [[Tasks.md\|Tasks]]                                                               | modified | 10:52 AM - September 11, 2025 |
| [[Tasks.md\|Tasks]]                                                               | created  | 10:52 AM - September 11, 2025 |
| [[publish/Tricks/Examples/CouchDB Deployment Files.md\|CouchDB Deployment Files]] | modified | 12:43 AM - September 11, 2025 |
| [[publish/Tricks/Examples/Examples.md\|Examples]]                                 | modified | 12:43 AM - September 11, 2025 |
| [[publish/Tricks/Wireguard Search Domain.md\|Wireguard Search Domain]]            | modified | 12:43 AM - September 11, 2025 |
| [[publish/Tricks/ZFS Backup.md\|ZFS Backup]]                                      | modified | 12:43 AM - September 11, 2025 |
| [[publish/Tricks/Proxmox Commandline.md\|Proxmox Commandline]]                    | modified | 12:43 AM - September 11, 2025 |
| [[publish/Tricks/Replicating my Desktop.md\|Replicating my Desktop]]              | modified | 12:43 AM - September 11, 2025 |
| [[publish/Tricks/Smoother Updates.md\|Smoother Updates]]                          | modified | 12:43 AM - September 11, 2025 |

%% DATAVIEW_PUBLISHER: end %%

