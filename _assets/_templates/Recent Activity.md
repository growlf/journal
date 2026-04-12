---
title: Recent Activity
---
## 🕒 Recent Activity
%% DATAVIEW_PUBLISHER: start
```dataview
TABLE 
  file.mtime AS "Updated"
WHERE 
  !contains(file.folder, "daily")
  AND !contains(file.folder, "_templates")
  AND !contains(file.folder, "_assets")
  AND !contains(file.folder, "Internal")
  AND !contains(file.folder, "Discord")
SORT file.mtime DESC
LIMIT 40
```
%%

| File | Updated |
| ---- | ------- |

%% DATAVIEW_PUBLISHER: end %%
