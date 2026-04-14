---
title: _assets/AI-Skills/hypervisor-ops-officer
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

| Folder                  | Documents                                                                                                                      |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| public-signal-sanitizer | [[_assets/AI-Skills/public-signal-sanitizer/index.md\|index]] \| [[_assets/AI-Skills/public-signal-sanitizer/SKILL.md\|SKILL]] |

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

| File                                                          | Created                  | Updated                  |
| ------------------------------------------------------------- | ------------------------ | ------------------------ |
| [[_assets/AI-Skills/public-signal-sanitizer/index.md\|index]] | 8:33 PM - April 12, 2026 | 2:36 PM - April 13, 2026 |
| [[_assets/AI-Skills/public-signal-sanitizer/SKILL.md\|SKILL]] | 8:33 PM - April 12, 2026 | 8:33 PM - April 12, 2026 |

%% DATAVIEW_PUBLISHER: end %%
