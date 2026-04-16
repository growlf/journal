---
title: ai-stack-engineer
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
| assets |  |
| references | [[_assets/AI-Skills/ai-stack-engineer/references/example_reference|example_reference]] |
| scripts |  |

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
| [[_assets/AI-Skills/ai-stack-engineer/scripts/index|index]] | 12:26 AM - April 16, 2026 | 12:26 AM - April 16, 2026 |
| [[_assets/AI-Skills/ai-stack-engineer/assets/index|index]] | 12:26 AM - April 16, 2026 | 12:26 AM - April 16, 2026 |
| [[_assets/AI-Skills/ai-stack-engineer/index|index]] | 12:26 AM - April 16, 2026 | 12:26 AM - April 16, 2026 |
| [[_assets/AI-Skills/ai-stack-engineer/references/index|index]] | 12:26 AM - April 16, 2026 | 12:26 AM - April 16, 2026 |
| [[_assets/AI-Skills/ai-stack-engineer/SKILL|SKILL]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/AI-Skills/ai-stack-engineer/troubleshooting|troubleshooting]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/AI-Skills/ai-stack-engineer/Ollama Signal Report|Ollama Signal Report]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/AI-Skills/ai-stack-engineer/references/example_reference|example_reference]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |

%% DATAVIEW_PUBLISHER: end %%
