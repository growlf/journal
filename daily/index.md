---
tags: 
Creation date: <% tp.file.creation_date() %>
Documentation: 
aliases:
---
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
