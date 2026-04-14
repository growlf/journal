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
| Development | [[Knowledge Base/Development/GIT.md\|GIT]] \| [[Knowledge Base/Development/Github Workflow.md\|Github Workflow]] \| [[Knowledge Base/Development/index.md\|index]] \| [[Knowledge Base/Development/Mark Down.md\|Mark Down]] \| [[Knowledge Base/Development/ssh.md\|ssh]]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| Obsidian    | [[Knowledge Base/Development/Obsidian/_design.md\|_design]] \| [[Knowledge Base/Development/Obsidian/Couch DB Tricks.md\|Couch DB Tricks]] \| [[Knowledge Base/Development/Obsidian/CouchDB Deployment Files.md\|CouchDB Deployment Files]] \| [[Knowledge Base/Development/Obsidian/Create a CouchDB User Account.md\|Create a CouchDB User Account]] \| [[Knowledge Base/Development/Obsidian/Form Test.md\|Form Test]] \| [[Knowledge Base/Development/Obsidian/GitHub-Quartz-Obsidian.md\|GitHub-Quartz-Obsidian]] \| [[Knowledge Base/Development/Obsidian/index.md\|index]] \| [[Knowledge Base/Development/Obsidian/Joining to Obsidian LiveSync.md\|Joining to Obsidian LiveSync]] \| [[Knowledge Base/Development/Obsidian/Obsidian Plugins.md\|Obsidian Plugins]] \| [[Knowledge Base/Development/Obsidian/Tasks.md\|Tasks]] |
| Shell       | [[Knowledge Base/Development/Shell/index.md\|index]] \| [[Knowledge Base/Development/Shell/RSync.md\|RSync]] \| [[Knowledge Base/Development/Shell/Shell (921428).md\|Shell (921428)]]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |

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

| File                                                                                          | Created                  | Updated                   |
| --------------------------------------------------------------------------------------------- | ------------------------ | ------------------------- |
| [[Knowledge Base/Development/index.md\|index]]                                                | 8:33 PM - April 12, 2026 | 2:36 PM - April 13, 2026  |
| [[Knowledge Base/Development/Shell/Shell (921428).md\|Shell (921428)]]                        | 8:33 PM - April 12, 2026 | 2:36 PM - April 13, 2026  |
| [[Knowledge Base/Development/Obsidian/index.md\|index]]                                       | 8:33 PM - April 12, 2026 | 11:29 PM - April 12, 2026 |
| [[Knowledge Base/Development/ssh.md\|ssh]]                                                    | 8:33 PM - April 12, 2026 | 11:28 PM - April 12, 2026 |
| [[Knowledge Base/Development/GIT.md\|GIT]]                                                    | 8:33 PM - April 12, 2026 | 11:28 PM - April 12, 2026 |
| [[Knowledge Base/Development/Shell/RSync.md\|RSync]]                                          | 8:33 PM - April 12, 2026 | 11:18 PM - April 12, 2026 |
| [[Knowledge Base/Development/Ansible/Ansible config file.md\|Ansible config file]]            | 8:33 PM - April 12, 2026 | 8:33 PM - April 12, 2026  |
| [[Knowledge Base/Development/Ansible/Best Practices.md\|Best Practices]]                      | 8:33 PM - April 12, 2026 | 8:33 PM - April 12, 2026  |
| [[Knowledge Base/Development/Ansible/Playbook.md\|Playbook]]                                  | 8:33 PM - April 12, 2026 | 8:33 PM - April 12, 2026  |
| [[Knowledge Base/Development/Ansible/Roles.md\|Roles]]                                        | 8:33 PM - April 12, 2026 | 8:33 PM - April 12, 2026  |
| [[Knowledge Base/Development/Shell/index.md\|index]]                                          | 8:33 PM - April 12, 2026 | 8:33 PM - April 12, 2026  |
| [[Knowledge Base/Development/Ansible/Ansible Vault.md\|Ansible Vault]]                        | 8:33 PM - April 12, 2026 | 8:33 PM - April 12, 2026  |
| [[Knowledge Base/Development/Ansible/Inventory.md\|Inventory]]                                | 8:33 PM - April 12, 2026 | 8:33 PM - April 12, 2026  |
| [[Knowledge Base/Development/Ansible/Jinja Templating.md\|Jinja Templating]]                  | 8:33 PM - April 12, 2026 | 8:33 PM - April 12, 2026  |
| [[Knowledge Base/Development/Ansible/Troubleshooting.md\|Troubleshooting]]                    | 8:33 PM - April 12, 2026 | 8:33 PM - April 12, 2026  |
| [[Knowledge Base/Development/Ansible/Variables.md\|Variables]]                                | 8:33 PM - April 12, 2026 | 8:33 PM - April 12, 2026  |
| [[Knowledge Base/Development/Ansible/index.md\|index]]                                        | 8:33 PM - April 12, 2026 | 8:33 PM - April 12, 2026  |
| [[Knowledge Base/Development/Obsidian/Couch DB Tricks.md\|Couch DB Tricks]]                   | 8:33 PM - April 12, 2026 | 8:33 PM - April 12, 2026  |
| [[Knowledge Base/Development/Obsidian/Form Test.md\|Form Test]]                               | 8:33 PM - April 12, 2026 | 8:33 PM - April 12, 2026  |
| [[Knowledge Base/Development/Obsidian/CouchDB Deployment Files.md\|CouchDB Deployment Files]] | 8:33 PM - April 12, 2026 | 8:33 PM - April 12, 2026  |

%% DATAVIEW_PUBLISHER: end %%
