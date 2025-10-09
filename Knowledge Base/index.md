---
title: Knowledge Base
---
Contents:
%% DATAVIEW_PUBLISHER: start
```dataview
TABLE join(sort(rows.file.link), " | ") as Documents
FLATTEN regexreplace(file.folder, ".*/", "") as lastPart
WHERE contains(file.folder, this.file.folder)
GROUP BY lastPart as Folder
SORT lastPart
```
%%

| Folder         | Documents                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Knowledge Base | [[Knowledge Base/DNS.md\|DNS]] \| [[Knowledge Base/Domain.md\|Domain]] \| [[Knowledge Base/Email.md\|Email]] \| [[Knowledge Base/GIT.md\|GIT]] \| [[Knowledge Base/Github Workflow.md\|Github Workflow]] \| [[Knowledge Base/Hardware.md\|Hardware]] \| [[Knowledge Base/index.md\|index]] \| [[Knowledge Base/LLM.md\|LLM]] \| [[Knowledge Base/LXC.md\|LXC]] \| [[Knowledge Base/Mark Down.md\|Mark Down]] \| [[Knowledge Base/NAS.md\|NAS]] \| [[Knowledge Base/PXEBoot.md\|PXEBoot]] \| [[Knowledge Base/ssh.md\|ssh]] \| [[Knowledge Base/ZFS.md\|ZFS]] |

%% DATAVIEW_PUBLISHER: end %%