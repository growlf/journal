---
tags:
  - daily
---
# {{date:dddd, MMMM Do, YYYY}}
<< [[{{yesterday}}|yesterday]] || [[{{date:YYYY-MM}}|month]] || [[{{tomorrow}}|tomorrow]] >> 
<% tp.web.daily_quote() %>

```button  
name Add Todo  
type command  
action QuickAdd: Add Todo  
```  
# What's Happening  
-  
# Task  
## Today  
```tasks  
hide backlink  
due on <% tp.file.title %>  
hide due date  
((path includes Task List) OR (path includes Entry))  
```  
## This Week  
```tasks  
hide backlink  
hide due date  
due after <% tp.file.title %>  
due before <% tp.date.now("YYYY-MM-DD", +6, moment(tp.file.title), "YYYY-MM-DD") %>  
((path includes Task List) OR (path includes Entry))  
group by function task.due.format("YYYY-MM-DD dddd")  
```  
## Overdue  
```tasks  
hide backlink  
due before <% tp.file.title %>  
not done  
```  
## Someday  
```tasks  
not done  
no due date  
((path includes Task List) OR (path includes Entry)) AND (path does not include Travel)  
filter by function task.status.symbol === ' '  
```