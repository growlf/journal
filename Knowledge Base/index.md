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

| Folder         | Documents                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Knowledge Base | [[Knowledge Base/DNS.md\|DNS]] \| [[Knowledge Base/Domain.md\|Domain]] \| [[Knowledge Base/Email.md\|Email]] \| [[Knowledge Base/GIT.md\|GIT]] \| [[Knowledge Base/Github Workflow.md\|Github Workflow]] \| [[Knowledge Base/Hardware.md\|Hardware]] \| [[Knowledge Base/index.md\|index]] \| [[Knowledge Base/LLM.md\|LLM]] \| [[Knowledge Base/LXC.md\|LXC]] \| [[Knowledge Base/Mark Down.md\|Mark Down]] \| [[Knowledge Base/NAS.md\|NAS]] \| [[Knowledge Base/PXEBoot.md\|PXEBoot]] \| [[Knowledge Base/ssh.md\|ssh]] \| [[Knowledge Base/ZFS Backups.md\|ZFS Backups]] \| [[Knowledge Base/ZFS.md\|ZFS]] |

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

| File                                     | Created                       | Updated                    |
| ---------------------------------------- | ----------------------------- | -------------------------- |
| [[Knowledge Base/index.md\|index]]       | 1:17 PM - October 09, 2025    | 4:42 PM - October 09, 2025 |
| [[Knowledge Base/Hardware.md\|Hardware]] | 12:43 AM - September 11, 2025 | 2:31 PM - October 09, 2025 |

%% DATAVIEW_PUBLISHER: end %%