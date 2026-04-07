---
title: Knowledge Base/LLM/Past Attempts
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

| Folder        | Documents                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Past Attempts | [[Knowledge Base/LLM/Past Attempts/00-Prompt.md\|00-Prompt]] \| [[Knowledge Base/LLM/Past Attempts/01-Prompt.md\|01-Prompt]] \| [[Knowledge Base/LLM/Past Attempts/02-Prompt.md\|02-Prompt]] \| [[Knowledge Base/LLM/Past Attempts/03-Prompt.md\|03-Prompt]] \| [[Knowledge Base/LLM/Past Attempts/2026-03-22.md\|2026-03-22]] \| [[Knowledge Base/LLM/Past Attempts/2026-03-29-start.md\|2026-03-29-start]] \| [[Knowledge Base/LLM/Past Attempts/2026-04-01-AI-Sysadmin-Stack-Installation.md\|2026-04-01-AI-Sysadmin-Stack-Installation]] \| [[Knowledge Base/LLM/Past Attempts/2026-04-03-Sycl-Discovery.md\|2026-04-03-Sycl-Discovery]] \| [[Knowledge Base/LLM/Past Attempts/AI Sysadmin Stack - Usage Guide.md\|AI Sysadmin Stack - Usage Guide]] \| [[Knowledge Base/LLM/Past Attempts/Arc-GPU-Optimization-Guide.md\|Arc-GPU-Optimization-Guide]] \| [[Knowledge Base/LLM/Past Attempts/index.md\|index]] |

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

| File                                                                                                                         | Created                   | Updated                   |
| ---------------------------------------------------------------------------------------------------------------------------- | ------------------------- | ------------------------- |
| [[Knowledge Base/LLM/Past Attempts/2026-03-29-start.md\|2026-03-29-start]]                                                   | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/LLM/Past Attempts/2026-04-01-AI-Sysadmin-Stack-Installation.md\|2026-04-01-AI-Sysadmin-Stack-Installation]] | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/LLM/Past Attempts/2026-04-03-Sycl-Discovery.md\|2026-04-03-Sycl-Discovery]]                                 | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/LLM/Past Attempts/AI Sysadmin Stack - Usage Guide.md\|AI Sysadmin Stack - Usage Guide]]                     | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/LLM/Past Attempts/00-Prompt.md\|00-Prompt]]                                                                 | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/LLM/Past Attempts/01-Prompt.md\|01-Prompt]]                                                                 | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/LLM/Past Attempts/02-Prompt.md\|02-Prompt]]                                                                 | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/LLM/Past Attempts/03-Prompt.md\|03-Prompt]]                                                                 | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/LLM/Past Attempts/2026-03-22.md\|2026-03-22]]                                                               | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/LLM/Past Attempts/Arc-GPU-Optimization-Guide.md\|Arc-GPU-Optimization-Guide]]                               | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/LLM/Past Attempts/index.md\|index]]                                                                         | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |

%% DATAVIEW_PUBLISHER: end %%
