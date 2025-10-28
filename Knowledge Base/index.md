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

| File                                         | Created                    | Updated                     |
| -------------------------------------------- | -------------------------- | --------------------------- |
| [[Knowledge Base/Cloud Init.md\|Cloud Init]] | 4:19 PM - October 20, 2025 | 1:11 AM - October 28, 2025  |
| [[Knowledge Base/DNS.md\|DNS]]               | 4:19 PM - October 20, 2025 | 12:57 AM - October 28, 2025 |
| [[Knowledge Base/index.md\|index]]           | 4:19 PM - October 20, 2025 | 2:24 PM - October 22, 2025  |
| [[Knowledge Base/DHCP.md\|DHCP]]             | 4:19 PM - October 20, 2025 | 2:18 PM - October 22, 2025  |
| [[Knowledge Base/WiFi.md\|WiFi]]             | 4:19 PM - October 20, 2025 | 2:13 PM - October 22, 2025  |
| [[Knowledge Base/Router.md\|Router]]         | 4:19 PM - October 20, 2025 | 2:13 PM - October 22, 2025  |
| [[Knowledge Base/Firewall.md\|Firewall]]     | 4:19 PM - October 20, 2025 | 2:13 PM - October 22, 2025  |
| [[Knowledge Base/Obsidian.md\|Obsidian]]     | 4:19 PM - October 20, 2025 | 2:12 PM - October 22, 2025  |
| [[Knowledge Base/ISP.md\|ISP]]               | 4:19 PM - October 20, 2025 | 2:10 PM - October 22, 2025  |

%% DATAVIEW_PUBLISHER: end %%