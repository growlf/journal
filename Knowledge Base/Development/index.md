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

| Folder      | Documents                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| ----------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Ansible     | [[Knowledge Base/Development/Ansible/Ansible config file.md\|Ansible config file]] \| [[Knowledge Base/Development/Ansible/Ansible Vault.md\|Ansible Vault]] \| [[Knowledge Base/Development/Ansible/Best Practices.md\|Best Practices]] \| [[Knowledge Base/Development/Ansible/index.md\|index]] \| [[Knowledge Base/Development/Ansible/Inventory.md\|Inventory]] \| [[Knowledge Base/Development/Ansible/Jinja Templating.md\|Jinja Templating]] \| [[Knowledge Base/Development/Ansible/Playbook.md\|Playbook]] \| [[Knowledge Base/Development/Ansible/Roles.md\|Roles]] \| [[Knowledge Base/Development/Ansible/Troubleshooting.md\|Troubleshooting]] \| [[Knowledge Base/Development/Ansible/Variables.md\|Variables]]                                                                                                         |
| Development | [[Knowledge Base/Development/GIT.md\|GIT]] \| [[Knowledge Base/Development/Github Workflow.md\|Github Workflow]] \| [[Knowledge Base/Development/index.md\|index]] \| [[Knowledge Base/Development/Mark Down.md\|Mark Down]] \| [[Knowledge Base/Development/Shell/index\|Shell]] \| [[Knowledge Base/Development/ssh.md\|ssh]]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| Obsidian    | [[Knowledge Base/Development/Obsidian/_design.md\|_design]] \| [[Knowledge Base/Development/Obsidian/Couch DB Tricks.md\|Couch DB Tricks]] \| [[Knowledge Base/Development/Obsidian/CouchDB Deployment Files.md\|CouchDB Deployment Files]] \| [[Knowledge Base/Development/Obsidian/Create a CouchDB User Account.md\|Create a CouchDB User Account]] \| [[Knowledge Base/Development/Obsidian/Form Test.md\|Form Test]] \| [[Knowledge Base/Development/Obsidian/GitHub-Quartz-Obsidian.md\|GitHub-Quartz-Obsidian]] \| [[Knowledge Base/Development/Obsidian/index.md\|index]] \| [[Knowledge Base/Development/Obsidian/Joining to Obsidian LiveSync.md\|Joining to Obsidian LiveSync]] \| [[Knowledge Base/Development/Obsidian/Obsidian Plugins.md\|Obsidian Plugins]] \| [[Knowledge Base/Development/Obsidian/Tasks.md\|Tasks]] |
| Shell       | [[Shell (921428)\|Shell (921428)]] \| [[Knowledge Base/Development/Shell/RSync.md\|RSync]]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |

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

| File                                                                                                    | Created                   | Updated                   |
| ------------------------------------------------------------------------------------------------------- | ------------------------- | ------------------------- |
| [[Shell (921428)\|Shell (921428)]]                                                    | 11:13 PM - April 05, 2026 | 1:40 PM - April 07, 2026  |
| [[Knowledge Base/Development/index.md\|index]]                                                          | 11:13 PM - April 05, 2026 | 1:40 PM - April 07, 2026  |
| [[Knowledge Base/Development/Ansible/Ansible config file.md\|Ansible config file]]                      | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Development/Ansible/Best Practices.md\|Best Practices]]                                | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Development/Ansible/Playbook.md\|Playbook]]                                            | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Development/Ansible/Roles.md\|Roles]]                                                  | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Development/Shell/RSync.md\|RSync]]                                                    | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Development/Ansible/Ansible Vault.md\|Ansible Vault]]                                  | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Development/Ansible/Inventory.md\|Inventory]]                                          | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Development/Ansible/Jinja Templating.md\|Jinja Templating]]                            | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Development/Ansible/Troubleshooting.md\|Troubleshooting]]                              | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Development/Ansible/Variables.md\|Variables]]                                          | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Development/Ansible/index.md\|index]]                                                  | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Development/Obsidian/Couch DB Tricks.md\|Couch DB Tricks]]                             | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Development/Obsidian/CouchDB Deployment Files.md\|CouchDB Deployment Files]]           | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Development/Obsidian/GitHub-Quartz-Obsidian.md\|GitHub-Quartz-Obsidian]]               | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Development/Obsidian/Create a CouchDB User Account.md\|Create a CouchDB User Account]] | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Development/Obsidian/Joining to Obsidian LiveSync.md\|Joining to Obsidian LiveSync]]   | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Development/Obsidian/Obsidian Plugins.md\|Obsidian Plugins]]                           | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |
| [[Knowledge Base/Development/Obsidian/Form Test.md\|Form Test]]                                         | 11:13 PM - April 05, 2026 | 11:13 PM - April 05, 2026 |

%% DATAVIEW_PUBLISHER: end %%
