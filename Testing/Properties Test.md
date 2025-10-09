---
title: "{{this.folder}}"
---
```dataview 
TABLE 
    file.folder AS "Object"
FROM "" 
WHERE file.folder = this.file.folder
WHERE file.name = this.file.name
SORT file.name ASC 
LIMIT 1
```

