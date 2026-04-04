---
banner: "![[network_banner.png]]"
banner-display: auto
banner-height: 200
content-start: 160
banner-repeat: false
banner-fade: -165
banner-x: 51
banner-y: 31
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

| Folder   | Documents                            |
| -------- | ------------------------------------ |
| Networks | [[Network/Networks/index.md\|index]] |

%% DATAVIEW_PUBLISHER: end %%
### Recent Changes / Additions
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

| File                                 | Created                     | Updated                     |
| ------------------------------------ | --------------------------- | --------------------------- |
| [[Network/Networks/index.md\|index]] | 4:28 PM - November 10, 2025 | 4:28 PM - November 10, 2025 |

%% DATAVIEW_PUBLISHER: end %%
