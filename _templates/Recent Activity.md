%% DATAVIEW_PUBLISHER: start
```dataview
TABLE change[0] as "Action", change[1] as "Date"
FLATTEN list( list("modified", file.mtime), list("created", file.ctime)) as change
SORT change[1] DESC
LIMIT 10
```
%%

| File                                             | Action   | Date                        |
| ------------------------------------------------ | -------- | --------------------------- |
| [[daily/2025-10-28.md\|2025-10-28]]              | modified | 12:06 PM - October 28, 2025 |
| [[Lab/devices/Sterling.md\|Sterling]]            | modified | 1:18 AM - October 28, 2025  |
| [[Lab/devices/Sliver.md\|Sliver]]                | modified | 1:18 AM - October 28, 2025  |
| [[Lab/devices/Router.md\|Router]]                | modified | 1:18 AM - October 28, 2025  |
| [[Lab/devices/Pheonix.md\|Pheonix]]              | modified | 1:17 AM - October 28, 2025  |
| [[Lab/devices/Nexus.md\|Nexus]]                  | modified | 1:16 AM - October 28, 2025  |
| [[Lab/devices/Changeling.md\|Changeling]]        | modified | 1:16 AM - October 28, 2025  |
| [[Lab/devices/Gearbox.md\|Gearbox]]              | modified | 1:15 AM - October 28, 2025  |
| [[Tricks/Obsidian Plugins.md\|Obsidian Plugins]] | modified | 1:13 AM - October 28, 2025  |
| [[Lab/services/TBD/index.md\|index]]             | modified | 1:11 AM - October 28, 2025  |

%% DATAVIEW_PUBLISHER: end %%

