The purpose of this folder is to house the source files and `svg` outputs from Excalidraw as well as other media and asset files.

## Contents:
```dataview 
TABLE join(sort(rows.file.link), " | ") as Documents
FLATTEN regexreplace(file.folder, ".*/", "") as lastPart
WHERE contains(file.folder, this.file.folder)
GROUP BY lastPart as Folder
SORT lastPart
```
