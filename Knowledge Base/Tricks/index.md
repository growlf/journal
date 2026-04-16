---
title: Knowledge Base/Tricks
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
| Examples | [[Knowledge Base/Tricks/Examples/CouchDB Deployment Files|CouchDB Deployment Files]] |

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
| [[Knowledge Base/Tricks/Examples/index|index]] | 12:26 AM - April 16, 2026 | 12:26 AM - April 16, 2026 |
| [[Knowledge Base/Tricks/index|index]] | 12:26 AM - April 16, 2026 | 12:26 AM - April 16, 2026 |
| [[Knowledge Base/Tricks/Gemini-CLI-Mastery|Gemini-CLI-Mastery]] | 7:10 PM - April 15, 2026 | 7:10 PM - April 15, 2026 |
| [[Knowledge Base/Tricks/Wireguard Search Domain|Wireguard Search Domain]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tricks/ZFS Backup|ZFS Backup]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tricks/Replicating my Desktop|Replicating my Desktop]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tricks/LXC Desktop|LXC Desktop]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tricks/Proxmox Commandline|Proxmox Commandline]] | 8:07 PM - April 15, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tricks/Docker on LXC|Docker on LXC]] | 8:07 PM - April 15, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tricks/Smoother Updates|Smoother Updates]] | 8:07 PM - April 15, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tricks/DNS Service Records|DNS Service Records]] | 8:07 PM - April 15, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tricks/GitHub-Quartz-Obsidian|GitHub-Quartz-Obsidian]] | 8:07 PM - April 15, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tricks/Split DNS|Split DNS]] | 8:07 PM - April 15, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tricks/Excalidraw Test|Excalidraw Test]] | 8:07 PM - April 15, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tricks/Obsidian Plugins|Obsidian Plugins]] | 8:07 PM - April 15, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Tricks/Examples/CouchDB Deployment Files|CouchDB Deployment Files]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |

%% DATAVIEW_PUBLISHER: end %%
