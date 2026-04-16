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

| Folder | Documents |
| --- | --- |
| Docker | [[Knowledge Base/Virtualization/Docker/Docker Registry|Docker Registry]] | [[Knowledge Base/Virtualization/Docker/Docker on LXC|Docker on LXC]] | [[Knowledge Base/Virtualization/Docker/Portainer|Portainer]] | [[Knowledge Base/Virtualization/Docker/Shutting Down a Single Swarm Node|Shutting Down a Single Swarm Node]] | [[Knowledge Base/Virtualization/Docker/Smoother Updates|Smoother Updates]] | [[Knowledge Base/Virtualization/Docker/Swarm Shutdown|Swarm Shutdown]] |

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

| File | Created | Updated |
| --- | --- |
| [[Knowledge Base/Virtualization/LXC|LXC]] | 12:29 AM - April 16, 2026 | 12:29 AM - April 16, 2026 |
| [[Knowledge Base/Virtualization/index|index]] | 12:26 AM - April 16, 2026 | 12:26 AM - April 16, 2026 |
| [[Knowledge Base/Virtualization/Apt Cacher NG|Apt Cacher NG]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Virtualization/PXEBoot|PXEBoot]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Virtualization/Docker/index|index]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Virtualization/Docker/Swarm Shutdown|Swarm Shutdown]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Virtualization/Docker/Portainer|Portainer]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Virtualization/Docker/Shutting Down a Single Swarm Node|Shutting Down a Single Swarm Node]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Virtualization/Docker/Docker on LXC|Docker on LXC]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Virtualization/Docker/Docker Registry|Docker Registry]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Virtualization/Docker/Smoother Updates|Smoother Updates]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Virtualization/Cloud Init|Cloud Init]] | 8:08 PM - April 15, 2026 | 2:06 PM - April 14, 2026 |

%% DATAVIEW_PUBLISHER: end %%
