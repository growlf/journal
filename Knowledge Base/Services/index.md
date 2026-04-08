---
title: Services
---
## Contents:
%% DATAVIEW_PUBLISHER: start
```dataview
TABLE join(sort(rows.file.link), " | ") as Documents
FLATTEN regexreplace(file.folder, ".*/", "") as lastPart
WHERE contains(file.folder, this.file.folder)
GROUP BY lastPart as Folder
SORT lastPart
```
%%

| Folder     | Documents                                                                                                                                                                                                                                                                                                                                                                                                                                |
| ---------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Monitoring | [[Knowledge Base/Services/Monitoring/Grafana.md\|Grafana]] \| [[Knowledge Base/Services/Monitoring/index.md\|index]] \| [[Knowledge Base/Services/Monitoring/NtopNG.md\|NtopNG]]                                                                                                                                                                                                                                                         |
| Services   | [[Knowledge Base/Services/Discord Webhooks.md\|Discord Webhooks]] \| [[Knowledge Base/Services/DjangoCMS.md\|DjangoCMS]] \| [[Knowledge Base/Services/Email.md\|Email]] \| [[Knowledge Base/Services/Homepage.md\|Homepage]] \| [[Knowledge Base/Services/index.md\|index]] \| [[Knowledge Base/Services/MFA.md\|MFA]] \| [[Knowledge Base/Services/Syncthing.md\|Syncthing]] \| [[Knowledge Base/Services/Vaultwarden.md\|Vaultwarden]] |

%% DATAVIEW_PUBLISHER: end %%

## Recent Changes / Additions
%% DATAVIEW_PUBLISHER: start
```dataview
TABLE 
  file.ctime AS "Created", 
  file.mtime AS "Updated"
WHERE file.cday >= date(today) - dur(7 days)
  OR file.mday >= date(today) - dur(7 days)
WHERE contains(file.folder, this.file.folder)
SORT file.mtime DESC
LIMIT 20
```
%%

| File                                                              | Created                   | Updated                   |
| ----------------------------------------------------------------- | ------------------------- | ------------------------- |
| [[Knowledge Base/Services/index.md\|index]]                       | 11:13 PM - April 05, 2026 | 1:40 PM - April 07, 2026  |
| [[Knowledge Base/Services/Discord Webhooks.md\|Discord Webhooks]] | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Services/DjangoCMS.md\|DjangoCMS]]               | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Services/Email.md\|Email]]                       | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Services/Homepage.md\|Homepage]]                 | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Services/MFA.md\|MFA]]                           | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Services/Monitoring/Grafana.md\|Grafana]]        | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Services/Monitoring/NtopNG.md\|NtopNG]]          | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Services/Monitoring/index.md\|index]]            | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Services/Syncthing.md\|Syncthing]]               | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Services/Vaultwarden.md\|Vaultwarden]]           | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |

%% DATAVIEW_PUBLISHER: end %%
