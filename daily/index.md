---
title: Daily (ish) Notes
tags: 
Creation date: 2025-08-18 00:18
Documentation: 
aliases:
---
# Status

### Recent Changes / Additions
%% DATAVIEW_PUBLISHER: start
```dataview
TABLE 
  file.mtime AS "Updated", 
  file.ctime AS "Created"
WHERE file.cday >= date(today) - dur(7 days)
  OR file.mday >= date(today) - dur(7 days)
WHERE contains(file.folder, this.file.folder)
SORT file.mtime DESC
LIMIT 20
```
%%

| File                                | Updated                    | Created                       |
| ----------------------------------- | -------------------------- | ----------------------------- |
| [[daily/index.md\|index]]           | 4:09 PM - October 09, 2025 | 3:51 PM - August 30, 2025     |
| [[daily/2025-08-17.md\|2025-08-17]] | 2:30 PM - October 09, 2025 | 12:43 AM - September 11, 2025 |

%% DATAVIEW_PUBLISHER: end %%

### ToDo
My task list accumulated from my pages and notes:
```tasks
not done
sort by priority
limit 10
```

Lists all tasks (completed or not) in your vault
```dataview 
TASK 
```
Lists the 10 oldest and incomplete tasks of your vault as an interactive task list, grouped by their containing file and sorted from oldest to newest file. 
```dataview 
TASK WHERE !completed SORT created ASC LIMIT 10 GROUP BY file.link SORT rows.file.ctime ASC 
```
DataviewJS
```dataviewjs 
dv.pages("#lab") 
```
CALENDAR file.cdayx
```dataview 
CALENDAR 
file.cday 
```
Lists the 10 most recently created pages in your vault that have the tag #status/open 
```dataview 
LIST FROM #status/open SORT file.ctime DESC LIMIT 10 
```
Shows a table with all pages of your vault, their field value of due, the files' tags and an average of the values of multi-value field working-hours 
```dataview 
TABLE due, file.tags AS "tags", average(working-hours) 
```