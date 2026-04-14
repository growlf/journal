---
title: _assets/AI-Skills
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

| Folder                  | Documents                                                                                                                                                                                                                                                                                  |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| AI-Skills               | [[_assets/AI-Skills/index.md\|index]]                                                                                                                                                                                                                                                      |
| ai-stack-engineer       | [[_assets/AI-Skills/ai-stack-engineer/index.md\|index]] \| [[_assets/AI-Skills/ai-stack-engineer/Ollama Signal Report.md\|Ollama Signal Report]] \| [[_assets/AI-Skills/ai-stack-engineer/SKILL.md\|SKILL]] \| [[_assets/AI-Skills/ai-stack-engineer/troubleshooting.md\|troubleshooting]] |
| assets                  | [[_assets/AI-Skills/ai-stack-engineer/assets/index.md\|index]]                                                                                                                                                                                                                             |
| hypervisor-ops-officer  | [[_assets/AI-Skills/hypervisor-ops-officer/index.md\|index]] \| [[_assets/AI-Skills/hypervisor-ops-officer/SKILL.md\|SKILL]]                                                                                                                                                               |
| network-recon-expert    | [[_assets/AI-Skills/network-recon-expert/index.md\|index]] \| [[_assets/AI-Skills/network-recon-expert/SKILL.md\|SKILL]]                                                                                                                                                                   |
| public-signal-sanitizer | [[_assets/AI-Skills/public-signal-sanitizer/index.md\|index]] \| [[_assets/AI-Skills/public-signal-sanitizer/SKILL.md\|SKILL]]                                                                                                                                                             |
| references              | [[_assets/AI-Skills/ai-stack-engineer/references/example_reference.md\|example_reference]] \| [[_assets/AI-Skills/ai-stack-engineer/references/index.md\|index]]                                                                                                                           |
| scripts                 | [[_assets/AI-Skills/ai-stack-engineer/scripts/index.md\|index]]                                                                                                                                                                                                                            |
| secret-manager-expert   | [[_assets/AI-Skills/secret-manager-expert/index.md\|index]] \| [[_assets/AI-Skills/secret-manager-expert/SKILL.md\|SKILL]]                                                                                                                                                                 |
| task-sergeant           | [[_assets/AI-Skills/task-sergeant/index.md\|index]] \| [[_assets/AI-Skills/task-sergeant/SKILL.md\|SKILL]]                                                                                                                                                                                 |
| vault-archivist         | [[_assets/AI-Skills/vault-archivist/index.md\|index]] \| [[_assets/AI-Skills/vault-archivist/SKILL.md\|SKILL]]                                                                                                                                                                             |

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

| File                                                                                       | Created                  | Updated                  |
| ------------------------------------------------------------------------------------------ | ------------------------ | ------------------------ |
| [[_assets/AI-Skills/secret-manager-expert/index.md\|index]]                                | 2:24 PM - April 13, 2026 | 2:36 PM - April 13, 2026 |
| [[_assets/AI-Skills/task-sergeant/index.md\|index]]                                        | 2:16 PM - April 13, 2026 | 2:36 PM - April 13, 2026 |
| [[_assets/AI-Skills/vault-archivist/index.md\|index]]                                      | 8:33 PM - April 12, 2026 | 2:36 PM - April 13, 2026 |
| [[_assets/AI-Skills/public-signal-sanitizer/index.md\|index]]                              | 8:33 PM - April 12, 2026 | 2:36 PM - April 13, 2026 |
| [[_assets/AI-Skills/network-recon-expert/index.md\|index]]                                 | 8:33 PM - April 12, 2026 | 2:36 PM - April 13, 2026 |
| [[_assets/AI-Skills/index.md\|index]]                                                      | 8:33 PM - April 12, 2026 | 2:36 PM - April 13, 2026 |
| [[_assets/AI-Skills/hypervisor-ops-officer/index.md\|index]]                               | 8:33 PM - April 12, 2026 | 2:36 PM - April 13, 2026 |
| [[_assets/AI-Skills/ai-stack-engineer/scripts/index.md\|index]]                            | 8:33 PM - April 12, 2026 | 2:36 PM - April 13, 2026 |
| [[_assets/AI-Skills/ai-stack-engineer/references/index.md\|index]]                         | 8:33 PM - April 12, 2026 | 2:36 PM - April 13, 2026 |
| [[_assets/AI-Skills/ai-stack-engineer/index.md\|index]]                                    | 8:33 PM - April 12, 2026 | 2:36 PM - April 13, 2026 |
| [[_assets/AI-Skills/ai-stack-engineer/assets/index.md\|index]]                             | 8:33 PM - April 12, 2026 | 2:36 PM - April 13, 2026 |
| [[_assets/AI-Skills/secret-manager-expert/SKILL.md\|SKILL]]                                | 2:24 PM - April 13, 2026 | 2:24 PM - April 13, 2026 |
| [[_assets/AI-Skills/task-sergeant/SKILL.md\|SKILL]]                                        | 2:16 PM - April 13, 2026 | 2:16 PM - April 13, 2026 |
| [[_assets/AI-Skills/network-recon-expert/SKILL.md\|SKILL]]                                 | 8:33 PM - April 12, 2026 | 1:18 AM - April 13, 2026 |
| [[_assets/AI-Skills/ai-stack-engineer/SKILL.md\|SKILL]]                                    | 8:33 PM - April 12, 2026 | 8:33 PM - April 12, 2026 |
| [[_assets/AI-Skills/ai-stack-engineer/Ollama Signal Report.md\|Ollama Signal Report]]      | 8:33 PM - April 12, 2026 | 8:33 PM - April 12, 2026 |
| [[_assets/AI-Skills/ai-stack-engineer/references/example_reference.md\|example_reference]] | 8:33 PM - April 12, 2026 | 8:33 PM - April 12, 2026 |
| [[_assets/AI-Skills/ai-stack-engineer/troubleshooting.md\|troubleshooting]]                | 8:33 PM - April 12, 2026 | 8:33 PM - April 12, 2026 |
| [[_assets/AI-Skills/hypervisor-ops-officer/SKILL.md\|SKILL]]                               | 8:33 PM - April 12, 2026 | 8:33 PM - April 12, 2026 |
| [[_assets/AI-Skills/public-signal-sanitizer/SKILL.md\|SKILL]]                              | 8:33 PM - April 12, 2026 | 8:33 PM - April 12, 2026 |

%% DATAVIEW_PUBLISHER: end %%
