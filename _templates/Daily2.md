---
created: <% tp.file.creation_date() %>
filename: <% tp.config.target_file.path %>
tags:
  - daily
---
tags:: [[+daily]]
- comment-option

# <% moment(tp.file.title,'YYYY-MM-DD').format("dddd, DD MMMM YYYY") %>

---
## Tasks due today

```tasks
not done
due before tomorrow
sort by due
```

---
## 📝 General Notes
-

---

### Tasks/Notes Private
-

### Tasks/Notes PostgreSQL
-

### Tasks Notes Work
-

---
### Notes created today
> [!info]- List of notes created today
> ```dataview
List FROM "" WHERE file.cday = date("<%tp.date.now("YYYY-MM-DD")%>") SORT file.ctime asc
>```

### Notes last touched today
> [!info]- List of notes modified today
> ```dataview
List FROM "" WHERE file.mday = date("<%tp.date.now("YYYY-MM-DD")%>") SORT file.mtime asc
>```

## News Postings (posted/answered)

## Attached content