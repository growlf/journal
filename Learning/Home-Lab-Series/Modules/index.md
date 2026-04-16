---
title: Learning/Home-Lab-Series/Modules
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
| [[Learning/Home-Lab-Series/Modules/index|index]] | 12:26 AM - April 16, 2026 | 12:26 AM - April 16, 2026 |
| [[Learning/Home-Lab-Series/Modules/00-Philosophy|00-Philosophy]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Learning/Home-Lab-Series/Modules/05-Obsidian|05-Obsidian]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Learning/Home-Lab-Series/Modules/02-Proxmox|02-Proxmox]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Learning/Home-Lab-Series/Modules/03-GitOps|03-GitOps]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Learning/Home-Lab-Series/Modules/04-AI-C2|04-AI-C2]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Learning/Home-Lab-Series/Modules/01-Physical|01-Physical]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |

%% DATAVIEW_PUBLISHER: end %%
