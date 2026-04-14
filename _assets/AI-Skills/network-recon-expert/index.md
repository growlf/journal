---
title: _assets/AI-Skills/network-recon-expert
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

| Folder               | Documents                                                                                                                |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| network-recon-expert | [[_assets/AI-Skills/network-recon-expert/index.md\|index]] \| [[_assets/AI-Skills/network-recon-expert/SKILL.md\|SKILL]] |

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

| File                                                       | Created                  | Updated                  |
| ---------------------------------------------------------- | ------------------------ | ------------------------ |
| [[_assets/AI-Skills/network-recon-expert/index.md\|index]] | 8:33 PM - April 12, 2026 | 2:36 PM - April 13, 2026 |
| [[_assets/AI-Skills/network-recon-expert/SKILL.md\|SKILL]] | 8:33 PM - April 12, 2026 | 1:18 AM - April 13, 2026 |

%% DATAVIEW_PUBLISHER: end %%
