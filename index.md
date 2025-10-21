---
tags:
  - about
title: Journal of The NetYeti
---
![[banner.svg]] My personal journal of technology-land adventures ...and other ramblings.  I am using [[Obsidian]] to generate and maintain this journal, and then [[GitHub-Quartz-Obsidian]] to publish it. I like it because it is easy to show someone else how to do - and it is free! The best part is that Obsidian helps me organize and connect my thoughts, schedule tasks, and collaborate with others - and yet it stays simple to use.
## Who am I?
I am The NetYeti. I answer to "hey, you!", "Yeti", and Garth Johnson - among other things.  I was born with a curious mind and an urge to question everything. Technology was placed in my view early in life and I found it to be the perfect playground to create and explore. I am an avid supporter of all things fun+community+educational.

I write from a standpoint of a technology professional and also a student - always curious and always learning. I strongly believe in "asking the *stupid* questions" because "if not me, then who will?" There is always someone in the audience that is either too shy or afraid to ask "*that*" question which is deemed too obvious (aka - common sense is not so common). Critical thinking requires the fuel of knowledge to have any accuracy or value in  outcomes.

After years of working in the tech industry, I now 
- instruct at [Bellingham Technical College](https://www.btc.edu/)
- freelance and consult with clients and non-profit or educational organizations
- am a founding member of [Cascade STEAM](https://www.cascadesteam.org) - a local 501.c3 non-profit organization dedicated to many of the things that I hold dear
- am a board member of the [Linuxfest Northwest](https://lfnw.org) organization that puts one of the largest free Linux festivals together in the USA - right here in little ole Bellingham Washington!
- am very involved in multiple local [[Communities|community organizations]].
### Friends, Peers, Students, and Associates
Without friends and peers, where is the fun of discovery?  Sharing is caring, and the following is growing list of cool folx are also into the sharing spirit of what they do and what they know and learn.  I am of the opinion that *who we are as individuals* is a reflection of, and reflected by, the people with whom we associate. So.. here are a few that also blog/journal - check 'em out, these are some fun and engaging folx :)
- [Viv](https://itsvivianmill.github.io/journal), [Lili](https://lynxee123.github.io/journal/), [Ricky](https://rigunkes.github.io/obsidian-quartz-page/) - Student's with amazing passion and drive to become technology professionals. DISCLAIMER: many students are not listed, as each must personally give permission to list them *and* have a site to point to - it's a [FERPA](https://studentprivacy.ed.gov/ferpa) thing. *This is also a nudge to other students who are not yet listed.* ;)
- [Josh](https://joshbuker.com/) - Technology connoisseur and all around awesome dude. Deals with security standards... a lot.
- [Keith](https://kmatthews123.github.io/) - The "lets try it" guy. No-fear explorer and engineer extraordinaire. A prime example of the student became the Master.
- [Sam](https://github.com/orgs/RoboRuckus/people/ShVerni) - The dude is on fire! While not a journaler per-se, he is a prolific open-source contributor and peer that actively (and constantly) mentors and shares. Check out his [RoboRuckus](https://www.roboruckus.com/) and [Fabrica-IO](https://github.com/FabricaIO/FabricaIO-App/wiki/App-Usage) projects. His coding may "merely be a hobby" for *him*, but the ideas and info are well constructed and implemented at an exemplary level.
- [Lance](https://lanceleonard.com/) - One of my oldest friends and fellow technology buffs.
### Contact
Most of us can generally be found on the [Cascade Steam Discord](http://hub.cascadesteam.org/) or at any of the [Cascade STEAM](https://www.meetup.com/cascadesteam/) meetups. Also see my [[Communities]] page for more meetup opportunities.
## Current Projects
I am now self hosting my own Obsidian Sync service and loving it. I am writing some notes about it that are not quite finished on my self-hosted [[CouchDB|obsidian-sync]] page.  It is surprisingly very easy to setup and maintain.

Throughout my pages, you may see task boxes littered throughout. This is how I leave notes to myself for things that still need polishing or completing. I use Obsidian plugins to manage them. This journal is a *living* document that changes frequently and is in constant edit-mode. 

## Recent Changes / Additions
Site-wide listing of all creations and modifications.


%% DATAVIEW_PUBLISHER: start
```dataview
TABLE 
  file.mtime AS "Updated", 
  file.ctime AS "Created"
WHERE file.cday >= date(today) - dur(4 days)
  OR file.mday >= date(today) - dur(4 days)
WHERE !contains(file.folder, "daily")
WHERE !contains(file.folder, "_templates")
WHERE !contains(file.folder, "_assets")
SORT file.mtime DESC
LIMIT 70
```
%%

| File                                                                      | Updated                    | Created                    |
| ------------------------------------------------------------------------- | -------------------------- | -------------------------- |
| [[index.md\|index]]                                                       | 8:04 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tricks/Split DNS.md\|Split DNS]]                                        | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tricks/Wireguard Search Domain.md\|Wireguard Search Domain]]            | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tricks/ZFS Backup.md\|ZFS Backup]]                                      | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tricks/index.md\|index]]                                                | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tricks/Examples/index.md\|index]]                                       | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tricks/Excalidraw Test.md\|Excalidraw Test]]                            | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tricks/GitHub-Quartz-Obsidian.md\|GitHub-Quartz-Obsidian]]              | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tricks/LXC Desktop.md\|LXC Desktop]]                                    | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tricks/Obsidian Plugins.md\|Obsidian Plugins]]                          | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tricks/Proxmox Commandline.md\|Proxmox Commandline]]                    | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tricks/Replicating my Desktop.md\|Replicating my Desktop]]              | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tricks/Smoother Updates.md\|Smoother Updates]]                          | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/Wireguard.md\|Wireguard]]                                         | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/Wordpress.md\|Wordpress]]                                         | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/WorkAdventure.md\|WorkAdventure]]                                 | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/index.md\|index]]                                                 | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tricks/DNS Service Records.md\|DNS Service Records]]                    | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tricks/Docker on LXC.md\|Docker on LXC]]                                | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tricks/Examples/CouchDB Deployment Files.md\|CouchDB Deployment Files]] | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/Proxmox Backup Server.md\|Proxmox Backup Server]]                 | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/Proxmox.md\|Proxmox]]                                             | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/Registry.md\|Registry]]                                           | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/Semaphore.md\|Semaphore]]                                         | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/Shell.md\|Shell]]                                                 | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/SyncThing.md\|SyncThing]]                                         | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/Tailscale.md\|Tailscale]]                                         | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/Technitium.md\|Technitium]]                                       | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/Vaultwarden.md\|Vaultwarden]]                                     | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/HomeAssistant.md\|HomeAssistant]]                                 | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/Homepage.md\|Homepage]]                                           | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/LXC.md\|LXC]]                                                     | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/Nextcloud.md\|Nextcloud]]                                         | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/NtopNG.md\|NtopNG]]                                               | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/PVE Monitor-All.md\|PVE Monitor-All]]                             | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/Portainer.md\|Portainer]]                                         | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/Prometheus.md\|Prometheus]]                                       | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/Ansible.md\|Ansible]]                                             | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/Apt Cacher NG.md\|Apt Cacher NG]]                                 | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/Beszel.md\|Beszel]]                                               | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/CouchDB.md\|CouchDB]]                                             | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/DjangoCMS.md\|DjangoCMS]]                                         | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/Docker.md\|Docker]]                                               | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/Grafana.md\|Grafana]]                                             | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Tools/Harbor.md\|Harbor]]                                               | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Testing/Properties Test.md\|Properties Test]]                           | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Testing/_design.md\|_design]]                                           | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Testing/footer.md\|footer]]                                             | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Testing/header.md\|header]]                                             | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Testing/index.md\|index]]                                               | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/ZFS.md\|ZFS]]                                            | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/index.md\|index]]                                        | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/ssh.md\|ssh]]                                            | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Lab/Home Lab 101.md\|Home Lab 101]]                                     | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Lab/The Stack.md\|The Stack]]                                           | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Lab/index.md\|index]]                                                   | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Testing/Dataview Latest.md\|Dataview Latest]]                           | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/LXC.md\|LXC]]                                            | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/Mark Down.md\|Mark Down]]                                | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/NAS.md\|NAS]]                                            | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/Obsidian.md\|Obsidian]]                                  | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/PXEBoot.md\|PXEBoot]]                                    | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/Router.md\|Router]]                                      | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/WiFi.md\|WiFi]]                                          | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/ZFS Backups.md\|ZFS Backups]]                            | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/GIT.md\|GIT]]                                            | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/Github Workflow.md\|Github Workflow]]                    | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/Hardware.md\|Hardware]]                                  | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/ISP.md\|ISP]]                                            | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |
| [[Knowledge Base/LLM.md\|LLM]]                                            | 7:58 PM - October 20, 2025 | 7:58 PM - October 20, 2025 |

%% DATAVIEW_PUBLISHER: end %%