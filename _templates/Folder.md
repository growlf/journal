---
title: <% tp.file.folder(true) %>
---
Contents:
%% DATAVIEW_PUBLISHER: start
```dataview
TABLE join(sort(rows.file.link), " | ") as Documents
FLATTEN regexreplace(file.folder, ".*/", "") as lastPart
WHERE contains(file.folder, this.file.folder)
GROUP BY lastPart as Folder
SORT lastPart
```
%%

| Folder     | Documents                                                                                                                                                    |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| _templates | [[_templates/Base.md\|Base]] \| [[_templates/Folder.md\|Folder]] \| [[_templates/Project.md\|Project]] \| [[_templates/Recent Activity.md\|Recent Activity]] |

%% DATAVIEW_PUBLISHER: end %%