---
title: Network/Services/Ollama/ollama_data/models
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

| Folder | Documents                                                            |
| ------ | -------------------------------------------------------------------- |
| blobs  | [[Network/Services/Ollama/ollama_data/models/blobs/index.md\|index]] |
| models | [[Network/Services/Ollama/ollama_data/models/index.md\|index]]       |

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

| File                                                                 | Created                  | Updated                  |
| -------------------------------------------------------------------- | ------------------------ | ------------------------ |
| [[Network/Services/Ollama/ollama_data/models/blobs/index.md\|index]] | 1:36 PM - April 07, 2026 | 1:40 PM - April 07, 2026 |
| [[Network/Services/Ollama/ollama_data/models/index.md\|index]]       | 1:36 PM - April 07, 2026 | 1:40 PM - April 07, 2026 |

%% DATAVIEW_PUBLISHER: end %%
