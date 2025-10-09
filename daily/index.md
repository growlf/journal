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
TABLE change[0] as "Action", change[1] as "Date"
FLATTEN list( list("modified", file.mtime), list("created", file.ctime)) as change
SORT change[1] DESC
LIMIT 20
```
%%

| File                                               | Action   | Date                       |
| -------------------------------------------------- | -------- | -------------------------- |
| [[daily/index.md\|index]]                          | modified | 3:34 PM - October 09, 2025 |
| [[Gizmos/index.md\|index]]                         | modified | 3:30 PM - October 09, 2025 |
| [[Knowledge Base/index.md\|index]]                 | modified | 3:30 PM - October 09, 2025 |
| [[_templates/Recent Activity.md\|Recent Activity]] | modified | 3:30 PM - October 09, 2025 |
| [[Testing/Dataview Latest.md\|Dataview Latest]]    | modified | 3:30 PM - October 09, 2025 |
| [[Lab/Systems/index.md\|index]]                    | modified | 3:30 PM - October 09, 2025 |
| [[Tools/Grafana.md\|Grafana]]                      | modified | 3:29 PM - October 09, 2025 |
| [[Tricks/Examples/index.md\|index]]                | modified | 3:28 PM - October 09, 2025 |
| [[Lab/Systems/index.md\|index]]                    | created  | 3:28 PM - October 09, 2025 |
| [[Testing/index.md\|index]]                        | modified | 3:28 PM - October 09, 2025 |
| [[Tools/index.md\|index]]                          | modified | 3:27 PM - October 09, 2025 |
| [[Tricks/index.md\|index]]                         | modified | 3:27 PM - October 09, 2025 |
| [[Lab/index.md\|index]]                            | modified | 3:26 PM - October 09, 2025 |
| [[_templates/Folder.md\|Folder]]                   | modified | 3:26 PM - October 09, 2025 |
| [[Excalidraw/index.md\|index]]                     | modified | 3:26 PM - October 09, 2025 |
| [[Lab/index.md\|index]]                            | created  | 3:24 PM - October 09, 2025 |
| [[Testing/Properties Test.md\|Properties Test]]    | modified | 3:20 PM - October 09, 2025 |
| [[Testing/Properties Test.md\|Properties Test]]    | created  | 3:09 PM - October 09, 2025 |
| [[Discord/Logs/index.md\|index]]                   | modified | 2:57 PM - October 09, 2025 |
| [[Discord/Clippings/index.md\|index]]              | modified | 2:57 PM - October 09, 2025 |

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