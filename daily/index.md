---
title: Daily (ish) Notes
tags: 
Creation date: 2025-08-18 00:18
Documentation: 
aliases:
---

# Status

## Recent Changes / Additions
Site-wide listing of all creations and modifications.
%% DATAVIEW_PUBLISHER: start
```dataview
TABLE 
  file.mtime AS "Updated", 
  file.ctime AS "Created"
WHERE file.cday >= date(today) - dur(7 days)
  OR file.mday >= date(today) - dur(7 days)
SORT file.mtime ASC
LIMIT 20
```
%%

| File                                                         | Updated                     | Created                       |
| ------------------------------------------------------------ | --------------------------- | ----------------------------- |
| [[Testing/footer.md\|footer]]                                | 12:19 AM - October 09, 2025 | 12:19 AM - October 09, 2025   |
| [[Testing/header.md\|header]]                                | 12:19 AM - October 09, 2025 | 12:19 AM - October 09, 2025   |
| [[Lab/The Stack.md\|The Stack]]                              | 1:08 PM - October 09, 2025  | 12:43 AM - September 11, 2025 |
| [[Excalidraw/Scripts/index.md\|index]]                       | 1:17 PM - October 09, 2025  | 1:17 PM - October 09, 2025    |
| [[_assets/index.md\|index]]                                  | 1:17 PM - October 09, 2025  | 1:17 PM - October 09, 2025    |
| [[Excalidraw/Scripts/Downloaded/index.md\|index]]            | 1:17 PM - October 09, 2025  | 1:17 PM - October 09, 2025    |
| [[index.md\|index]]                                          | 2:09 PM - October 09, 2025  | 12:43 AM - September 11, 2025 |
| [[Communities.md\|Communities]]                              | 2:27 PM - October 09, 2025  | 12:43 AM - September 11, 2025 |
| [[daily/2025-08-17.md\|2025-08-17]]                          | 2:30 PM - October 09, 2025  | 12:43 AM - September 11, 2025 |
| [[Tools/CouchDB.md\|CouchDB]]                                | 2:30 PM - October 09, 2025  | 12:43 AM - September 11, 2025 |
| [[Tools/PVE Monitor-All.md\|PVE Monitor-All]]                | 2:30 PM - October 09, 2025  | 12:43 AM - September 11, 2025 |
| [[Tools/SyncThing.md\|SyncThing]]                            | 2:30 PM - October 09, 2025  | 12:43 AM - September 11, 2025 |
| [[Tricks/Replicating my Desktop.md\|Replicating my Desktop]] | 2:30 PM - October 09, 2025  | 12:43 AM - September 11, 2025 |
| [[Knowledge Base/Hardware.md\|Hardware]]                     | 2:31 PM - October 09, 2025  | 12:43 AM - September 11, 2025 |
| [[Tools/HomeAssistant.md\|HomeAssistant]]                    | 2:36 PM - October 09, 2025  | 12:43 AM - September 11, 2025 |
| [[_templates/Base.md\|Base]]                                 | 2:44 PM - October 09, 2025  | 12:43 AM - September 11, 2025 |
| [[_templates/Project.md\|Project]]                           | 2:44 PM - October 09, 2025  | 12:43 AM - September 11, 2025 |
| [[Discord/index.md\|index]]                                  | 2:57 PM - October 09, 2025  | 2:47 PM - September 11, 2025  |
| [[Discord/Logs/index.md\|index]]                             | 2:57 PM - October 09, 2025  | 1:21 PM - October 09, 2025    |
| [[Testing/Properties Test.md\|Properties Test]]              | 3:20 PM - October 09, 2025  | 3:09 PM - October 09, 2025    |

%% DATAVIEW_PUBLISHER: end %%

### ToDo

%% DATAVIEW_PUBLISHER: start
```dataview
TASK 
WHERE !completed 
LIMIT 20 
```
%%

- [ ] Fill out more data on each resource in Gizmos and some of the specific devices I have used / am using and for what.
- [ ] Reinstall Ubuntu 24.04 LTS
    - [ ] "move in" all personal settings from backups
- [ ] Start actually documenting steps and tricks I have found over the years.  Especially some of the new stuff that makes this tool even BETTER.
- [ ] Complete this section or generate a page with further details.
- [ ] Complete this section or generate a page with further details.
- [ ] Fill in details on how to actually deploy for each method ⏫
- [ ] Screenshots and description of connecting to the interface ⏫
- [ ] Add screenshots, links, and details for firewall and Tailscale ⏫
- [ ] Add screenshots, links, and details
- [ ] Continue working with Harbor 🔁 every week
- [ ] See if Harbor implementation allows multiple node expansion
- [ ] Create a tutorial on a basic use for LXC on a local system such as a Laptop
- [ ] Add container commandline code🔽
- [ ] Complete the rebuild process and test it fully from scratch. 🛫 2025-08-14 🔼
- [ ] ...
- [ ] Ansible my LXC on [[Nexus]]
- [ ] DAFO - document IPs and update ⏫
- [ ] Test/configure Ollama with Obsidian 🔼
- [ ] [[BMS]] and [[Nexus]]- setup [DRBL](https://drbl.org/installation/02-install-required-packages.php) and PXE boot options

%% DATAVIEW_PUBLISHER: end %%