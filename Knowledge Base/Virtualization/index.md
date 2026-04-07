---
title: Virtualization
---
## Contents:
%% DATAVIEW_PUBLISHER: start
```dataview
TABLE join(sort(rows.file.link), " | ") as Documents
FLATTEN regexreplace(file.folder, ".*/", "") as lastPart
WHERE contains(file.folder, this.file.folder)
GROUP BY lastPart as Folder
SORT lastPart
```
%%

| Folder         | Documents                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| -------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Docker         | [[Knowledge Base/Virtualization/Docker/Docker on LXC.md\|Docker on LXC]] \| [[Knowledge Base/Virtualization/Docker/Docker Registry.md\|Docker Registry]] \| [[Knowledge Base/Virtualization/Docker/index.md\|index]] \| [[Knowledge Base/Virtualization/Docker/Portainer.md\|Portainer]] \| [[Knowledge Base/Virtualization/Docker/Shutting Down a Single Swarm Node.md\|Shutting Down a Single Swarm Node]] \| [[Knowledge Base/Virtualization/Docker/Smoother Updates.md\|Smoother Updates]] \| [[Knowledge Base/Virtualization/Docker/Swarm Shutdown.md\|Swarm Shutdown]] |
| Virtualization | [[Knowledge Base/Virtualization/Apt Cacher NG.md\|Apt Cacher NG]] \| [[Knowledge Base/Virtualization/Cloud Init.md\|Cloud Init]] \| [[Knowledge Base/Virtualization/index.md\|index]] \| [[Knowledge Base/Virtualization/LXC.md\|LXC]] \| [[Knowledge Base/Virtualization/PXEBoot.md\|PXEBoot]]                                                                                                                                                                                                                                                                              |

%% DATAVIEW_PUBLISHER: end %%

## Recent Changes / Additions
%% DATAVIEW_PUBLISHER: start
```dataview
TABLE 
  file.ctime AS "Created", 
  file.mtime AS "Updated"
WHERE file.cday >= date(today) - dur(7 days)
  OR file.mday >= date(today) - dur(7 days)
WHERE contains(file.folder, this.file.folder)
SORT file.mtime DESC
LIMIT 20
```
%%

| File                                                                                                             | Created                   | Updated                   |
| ---------------------------------------------------------------------------------------------------------------- | ------------------------- | ------------------------- |
| [[Knowledge Base/Virtualization/index.md\|index]]                                                                | 11:13 PM - April 05, 2026 | 1:38 PM - April 07, 2026  |
| [[Knowledge Base/Virtualization/Apt Cacher NG.md\|Apt Cacher NG]]                                                | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Virtualization/Cloud Init.md\|Cloud Init]]                                                      | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Virtualization/Docker/Docker Registry.md\|Docker Registry]]                                     | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Virtualization/Docker/Docker on LXC.md\|Docker on LXC]]                                         | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Virtualization/Docker/Portainer.md\|Portainer]]                                                 | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Virtualization/Docker/Shutting Down a Single Swarm Node.md\|Shutting Down a Single Swarm Node]] | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Virtualization/Docker/Smoother Updates.md\|Smoother Updates]]                                   | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Virtualization/Docker/Swarm Shutdown.md\|Swarm Shutdown]]                                       | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Virtualization/Docker/index.md\|index]]                                                         | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Virtualization/LXC.md\|LXC]]                                                                    | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Virtualization/PXEBoot.md\|PXEBoot]]                                                            | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |

%% DATAVIEW_PUBLISHER: end %%
