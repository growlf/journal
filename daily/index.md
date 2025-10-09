---
title: {{this.folder.name}}
tags: 
Creation date: 2025-08-18 00:18
Documentation: 
aliases:
---
# Status

### Recent Changes / Additions
```dataview
TABLE change[0] as "Action", change[1] as "Date"
FLATTEN list( list("modified", file.mtime), list("created", file.ctime)) as change
SORT change[1] DESC
LIMIT 20
```

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