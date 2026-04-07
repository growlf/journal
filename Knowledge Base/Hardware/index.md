---
title: Hardware
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

| Folder   | Documents                                                                                                                                                                                                                                                                                                                        |
| -------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Hardware | [[Knowledge Base/Hardware/E-Ink Tags.md\|E-Ink Tags]] \| [[Knowledge Base/Hardware/Hardware.md\|Hardware]] \| [[Knowledge Base/Hardware/index.md\|index]] \| [[Knowledge Base/Hardware/Ubiquiti UAP-AC-PRO.md\|Ubiquiti UAP-AC-PRO]] \| [[Knowledge Base/Hardware/UPS.md\|UPS]] \| [[Knowledge Base/Hardware/Zigbee.md\|Zigbee]] |

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

| File                                                                    | Created                   | Updated                   |
| ----------------------------------------------------------------------- | ------------------------- | ------------------------- |
| [[Knowledge Base/Hardware/index.md\|index]]                             | 11:13 PM - April 05, 2026 | 1:38 PM - April 07, 2026  |
| [[Knowledge Base/Hardware/Hardware.md\|Hardware]]                       | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Hardware/UPS.md\|UPS]]                                 | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Hardware/Zigbee.md\|Zigbee]]                           | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Hardware/E-Ink Tags.md\|E-Ink Tags]]                   | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Hardware/Ubiquiti UAP-AC-PRO.md\|Ubiquiti UAP-AC-PRO]] | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |

%% DATAVIEW_PUBLISHER: end %%
