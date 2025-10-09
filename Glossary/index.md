---
title: {{this.folder.name}}
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

| Folder   | Documents                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Glossary | [[Glossary/DNS.md\|DNS]] \| [[Glossary/Domain.md\|Domain]] \| [[Glossary/Email.md\|Email]] \| [[Glossary/GIT.md\|GIT]] \| [[Glossary/Github Workflow.md\|Github Workflow]] \| [[Glossary/Hardware.md\|Hardware]] \| [[Glossary/index.md\|index]] \| [[Glossary/LLM.md\|LLM]] \| [[Glossary/LXC.md\|LXC]] \| [[Glossary/Mark Down.md\|Mark Down]] \| [[Glossary/NAS.md\|NAS]] \| [[Glossary/PXEBoot.md\|PXEBoot]] \| [[Glossary/ssh.md\|ssh]] \| [[Glossary/ZFS.md\|ZFS]] |

%% DATAVIEW_PUBLISHER: end %%