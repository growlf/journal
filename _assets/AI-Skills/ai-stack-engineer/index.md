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

| Folder            | Documents                                                                                                                                                                                         |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ai-stack-engineer | [[_assets/AI-Skills/ai-stack-engineer/index.md\|index]] \| [[_assets/AI-Skills/ai-stack-engineer/SKILL.md\|SKILL]] \| [[_assets/AI-Skills/ai-stack-engineer/troubleshooting.md\|troubleshooting]] |
| assets            | [[_assets/AI-Skills/ai-stack-engineer/assets/index.md\|index]]                                                                                                                                    |
| references        | [[_assets/AI-Skills/ai-stack-engineer/references/example_reference.md\|example_reference]] \| [[_assets/AI-Skills/ai-stack-engineer/references/index.md\|index]]                                  |
| scripts           | [[_assets/AI-Skills/ai-stack-engineer/scripts/index.md\|index]]                                                                                                                                   |

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

| File                                                                                       | Created                   | Updated                   |
| ------------------------------------------------------------------------------------------ | ------------------------- | ------------------------- |
| [[_assets/AI-Skills/ai-stack-engineer/scripts/index.md\|index]]                            | 11:13 PM - April 05, 2026 | 1:38 PM - April 07, 2026  |
| [[_assets/AI-Skills/ai-stack-engineer/references/index.md\|index]]                         | 11:13 PM - April 05, 2026 | 1:38 PM - April 07, 2026  |
| [[_assets/AI-Skills/ai-stack-engineer/index.md\|index]]                                    | 11:13 PM - April 05, 2026 | 1:38 PM - April 07, 2026  |
| [[_assets/AI-Skills/ai-stack-engineer/assets/index.md\|index]]                             | 11:13 PM - April 05, 2026 | 1:38 PM - April 07, 2026  |
| [[_assets/AI-Skills/ai-stack-engineer/SKILL.md\|SKILL]]                                    | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[_assets/AI-Skills/ai-stack-engineer/references/example_reference.md\|example_reference]] | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[_assets/AI-Skills/ai-stack-engineer/troubleshooting.md\|troubleshooting]]                | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |

%% DATAVIEW_PUBLISHER: end %%
