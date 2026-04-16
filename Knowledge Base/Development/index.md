---
title: Development
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

| Folder | Documents |
| --- | --- |
| Ansible | [[Knowledge Base/Development/Ansible/Ansible Vault|Ansible Vault]] | [[Knowledge Base/Development/Ansible/Ansible config file|Ansible config file]] | [[Knowledge Base/Development/Ansible/Best Practices|Best Practices]] | [[Knowledge Base/Development/Ansible/Inventory|Inventory]] | [[Knowledge Base/Development/Ansible/Jinja Templating|Jinja Templating]] | [[Knowledge Base/Development/Ansible/Playbook|Playbook]] | [[Knowledge Base/Development/Ansible/Roles|Roles]] | [[Knowledge Base/Development/Ansible/Troubleshooting|Troubleshooting]] | [[Knowledge Base/Development/Ansible/Variables|Variables]] |
| Obsidian | [[Knowledge Base/Development/Obsidian/Couch DB Tricks|Couch DB Tricks]] | [[Knowledge Base/Development/Obsidian/CouchDB Deployment Files|CouchDB Deployment Files]] | [[Knowledge Base/Development/Obsidian/Create a CouchDB User Account|Create a CouchDB User Account]] | [[Knowledge Base/Development/Obsidian/Form Test|Form Test]] | [[Knowledge Base/Development/Obsidian/GitHub-Quartz-Obsidian|GitHub-Quartz-Obsidian]] | [[Knowledge Base/Development/Obsidian/Joining to Obsidian LiveSync|Joining to Obsidian LiveSync]] | [[Knowledge Base/Development/Obsidian/Obsidian Plugins|Obsidian Plugins]] | [[Knowledge Base/Development/Obsidian/Tasks|Tasks]] | [[Knowledge Base/Development/Obsidian/_design|_design]] |
| Shell | [[Knowledge Base/Development/Shell/RSync|RSync]] | [[Knowledge Base/Development/Shell/Shell (921428)|Shell (921428)]] |

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

| File | Created | Updated |
| --- | --- |
| [[Knowledge Base/Development/Shell/Shell (921428)|Shell (921428)]] | 12:26 AM - April 16, 2026 | 12:26 AM - April 16, 2026 |
| [[Knowledge Base/Development/index|index]] | 12:26 AM - April 16, 2026 | 12:26 AM - April 16, 2026 |
| [[Knowledge Base/Development/Ansible/Roles|Roles]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Development/Ansible/Best Practices|Best Practices]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Development/Shell/index|index]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Development/Shell/RSync|RSync]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Development/Ansible/index|index]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Development/Ansible/Variables|Variables]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Development/Ansible/Inventory|Inventory]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Development/Ansible/Jinja Templating|Jinja Templating]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Development/Ansible/Troubleshooting|Troubleshooting]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Development/Ansible/Playbook|Playbook]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Development/Ansible/Ansible config file|Ansible config file]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Development/Obsidian/Joining to Obsidian LiveSync|Joining to Obsidian LiveSync]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Development/Obsidian/_design|_design]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Development/Obsidian/GitHub-Quartz-Obsidian|GitHub-Quartz-Obsidian]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Development/Obsidian/Obsidian Plugins|Obsidian Plugins]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Development/Obsidian/Form Test|Form Test]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Development/Obsidian/Couch DB Tricks|Couch DB Tricks]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[Knowledge Base/Development/Ansible/Ansible Vault|Ansible Vault]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |

%% DATAVIEW_PUBLISHER: end %%
