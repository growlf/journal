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

| Folder  | Documents                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Modules | [[Learning/Home-Lab-Series/Modules/00-Philosophy.md\|00-Philosophy]] \| [[Learning/Home-Lab-Series/Modules/01-Physical.md\|01-Physical]] \| [[Learning/Home-Lab-Series/Modules/02-Proxmox.md\|02-Proxmox]] \| [[Learning/Home-Lab-Series/Modules/03-GitOps.md\|03-GitOps]] \| [[Learning/Home-Lab-Series/Modules/04-AI-C2.md\|04-AI-C2]] \| [[Learning/Home-Lab-Series/Modules/05-Obsidian.md\|05-Obsidian]] \| [[Learning/Home-Lab-Series/Modules/index.md\|index]] |

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

| File                                                                 | Created                  | Updated                   |
| -------------------------------------------------------------------- | ------------------------ | ------------------------- |
| [[Learning/Home-Lab-Series/Modules/index.md\|index]]                 | 8:33 PM - April 12, 2026 | 2:36 PM - April 13, 2026  |
| [[Learning/Home-Lab-Series/Modules/05-Obsidian.md\|05-Obsidian]]     | 8:33 PM - April 12, 2026 | 11:18 PM - April 12, 2026 |
| [[Learning/Home-Lab-Series/Modules/00-Philosophy.md\|00-Philosophy]] | 8:33 PM - April 12, 2026 | 11:18 PM - April 12, 2026 |
| [[Learning/Home-Lab-Series/Modules/01-Physical.md\|01-Physical]]     | 8:33 PM - April 12, 2026 | 8:33 PM - April 12, 2026  |
| [[Learning/Home-Lab-Series/Modules/03-GitOps.md\|03-GitOps]]         | 8:33 PM - April 12, 2026 | 8:33 PM - April 12, 2026  |
| [[Learning/Home-Lab-Series/Modules/02-Proxmox.md\|02-Proxmox]]       | 8:33 PM - April 12, 2026 | 8:33 PM - April 12, 2026  |
| [[Learning/Home-Lab-Series/Modules/04-AI-C2.md\|04-AI-C2]]           | 8:33 PM - April 12, 2026 | 8:33 PM - April 12, 2026  |

%% DATAVIEW_PUBLISHER: end %%
