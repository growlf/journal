---
title: Knowledge Base
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

| Folder         | Documents                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Knowledge Base | [[Knowledge Base/Cloud Init.md\|Cloud Init]] \| [[Knowledge Base/DHCP.md\|DHCP]] \| [[Knowledge Base/DNS.md\|DNS]] \| [[Knowledge Base/Domain.md\|Domain]] \| [[Knowledge Base/Email.md\|Email]] \| [[Knowledge Base/Firewall.md\|Firewall]] \| [[Knowledge Base/GIT.md\|GIT]] \| [[Knowledge Base/Github Workflow.md\|Github Workflow]] \| [[Knowledge Base/Hardware.md\|Hardware]] \| [[Knowledge Base/index.md\|index]] \| [[Knowledge Base/ISP.md\|ISP]] \| [[Knowledge Base/LLM.md\|LLM]] \| [[Knowledge Base/LXC.md\|LXC]] \| [[Knowledge Base/Mark Down.md\|Mark Down]] \| [[Knowledge Base/NAS.md\|NAS]] \| [[Knowledge Base/Obsidian.md\|Obsidian]] \| [[Knowledge Base/PXEBoot.md\|PXEBoot]] \| [[Knowledge Base/Router.md\|Router]] \| [[Knowledge Base/ssh.md\|ssh]] \| [[Knowledge Base/WiFi.md\|WiFi]] \| [[Knowledge Base/ZFS Backups.md\|ZFS Backups]] \| [[Knowledge Base/ZFS.md\|ZFS]] |

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

| File                                                   | Created                    | Updated                    |
| ------------------------------------------------------ | -------------------------- | -------------------------- |
| [[Knowledge Base/ZFS.md\|ZFS]]                         | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/index.md\|index]]                     | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/ssh.md\|ssh]]                         | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/LXC.md\|LXC]]                         | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/Mark Down.md\|Mark Down]]             | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/NAS.md\|NAS]]                         | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/Obsidian.md\|Obsidian]]               | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/PXEBoot.md\|PXEBoot]]                 | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/Router.md\|Router]]                   | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/WiFi.md\|WiFi]]                       | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/ZFS Backups.md\|ZFS Backups]]         | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/GIT.md\|GIT]]                         | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/Github Workflow.md\|Github Workflow]] | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/Hardware.md\|Hardware]]               | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/ISP.md\|ISP]]                         | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/LLM.md\|LLM]]                         | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/Cloud Init.md\|Cloud Init]]           | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/DHCP.md\|DHCP]]                       | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/DNS.md\|DNS]]                         | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/Domain.md\|Domain]]                   | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |

%% DATAVIEW_PUBLISHER: end %%