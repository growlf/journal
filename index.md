---
tags:
  - about
title: Journal of The NetYeti
aliases:
  - BMS
---
![[1197883.jpg]]My personal journal of technology-land adventures ...and other ramblings.  I am using [[Obsidian]] to generate and maintain this journal, and then [[GitHub-Quartz-Obsidian]] to publish it. I like it because it is easy to show someone else how to do - and it is free! The best part is that [[Knowledge Base/Development/Obsidian/index|Obsidian]] helps me organize and connect my thoughts, schedule tasks, and collaborate with others - and yet it stays simple to use.
## Who am I?
I am The NetYeti. I answer to "hey, you!", "Yeti", and Garth Johnson - among other things.  I was born with a curious mind and an urge to question everything. Technology was placed in my view early in life and I found it to be the perfect playground to create and explore. I am an avid supporter of all things fun+community+educational.

> [!IMPORTANT] A Note on AI Ethics
> As an AI Advocate and Instructor, I believe in using every tool at our disposal to "raise the water level" of our collective knowledge. This journal is a living experiment in human-AI co-creation. I use AI ethically and carefully—not to replace my voice, but to amplify it, organize the "manageable mess," and ensure that my students and peers have the most accurate and well-linked information possible. I treat AI as a "force multiplier," but the tactical decisions and core philosophy remain 100% NetYeti.

I write from a standpoint of a technology professional and also a student - always curious and always learning. I strongly believe in "asking the *stupid* questions" because "if not me, then who will?" There is always someone in the audience that is either too shy or afraid to ask "*that*" question which is deemed too obvious (aka - common sense is not so common). Critical thinking requires the fuel of knowledge to have any accuracy or value in  outcomes.

After years of working in the tech industry, I now 
- instruct at [Bellingham Technical College](https://www.btc.edu/)
- freelance and consult with clients and non-profit or educational organizations
- am a founding member of [Cascade STEAM](https://www.cascadesteam.org) - a local 501.c3 non-profit organization dedicated to many of the things that I hold dear
- am a board member of the [Linuxfest Northwest](https://lfnw.org) organization that puts one of the largest free Linux festivals together in the USA - right here in little ole Bellingham Washington!
- am very involved in multiple local [[Communities|community organizations]].
### Friends, Peers, Students, and Associates (who blog)
Without friends and peers, where is the fun of discovery?  Sharing is caring, and the following is growing list of cool folx are also into the sharing spirit of what they do and what they know and learn.  I am of the opinion that *who we are as individuals* is a reflection of, and reflected by, the people with whom we associate. So.. here are a few that also blog/journal - check 'em out, these are some fun and engaging folx :)
- [Viv](https://itsvivianmill.github.io/journal), [Lili](https://lynxee123.github.io/journal/), [Ricky](https://rigunkes.github.io/obsidian-quartz-page/) - Student's with amazing passion and drive to become technology professionals. DISCLAIMER: many students are not listed, as each must personally give permission to list them *and* have a site to point to - it's a [FERPA](https://studentprivacy.ed.gov/ferpa) thing. *This is also a nudge to other students who are not yet listed.* ;)
- [Josh](https://joshbuker.com/) - Technology connoisseur and all around awesome dude. Deals with security standards... a lot.
- [Keith](https://kmatthews123.github.io/) - The "lets try it" guy. No-fear explorer and engineer extraordinaire. A prime example of the student became the Master.
- [Sam](https://github.com/orgs/RoboRuckus/people/ShVerni) - The dude is on fire! While not a journaler per-se, he is a prolific open-source contributor and peer that actively (and constantly) mentors and shares. Check out his [RoboRuckus](https://www.roboruckus.com/) and [Fabrica-IO](https://github.com/FabricaIO/FabricaIO-App/wiki/App-Usage) projects. His coding may "merely be a hobby" for *him*, but the ideas and info are well constructed and implemented at an exemplary level.
- [Lance](https://lanceleonard.com/) - One of my oldest friends and fellow technology buffs.
### Contact
Most of us can generally be found on the [Cascade Steam Discord](http://hub.cascadesteam.org/) or at any of the [Cascade STEAM](https://www.meetup.com/cascadesteam/) meetups. Also see my [[Communities]] page for more meetup opportunities.
## Current Projects
### Cascade STEAM Service Corp
Working with local colleges, local businesses, and [[BMS]] to create a Internship/Mentorship business model that allows for actual experience for new college graduates in our community as a free service.

### [[Knowledge Base/Development/Obsidian/index|Obsidian]] Sync (self-hosted)
I self hosting my own [[Knowledge Base/Development/Obsidian/index|Obsidian]] Sync service for my journal (and several other collaborative projects as well). I am writing some notes about it in the [[CouchDB|obsidian-sync]] page.  It is surprisingly very easy to setup and maintain. This is actually a part of a larger (and ongoing project - [[Home Lab 101]])

### Miscellaneous
Throughout my pages, you may see task boxes littered throughout. This is how I leave notes to myself for things that still need polishing or completing. I use Obsidian plugins to manage them. This journal is a *living* document that changes frequently and is in constant edit-mode. 

## Recent Changes / Additions
Site-wide listing of last 40 creations and modifications over the last 4 days:
%% DATAVIEW_PUBLISHER: start
```dataview
TABLE 
  file.mtime AS "Updated"
WHERE 
  (
    file.cday >= date(today) - dur(4 days)
    OR file.mday >= date(today) - dur(4 days)
  )
  AND !contains(file.folder, "daily")
  AND !contains(file.folder, "_templates")
  AND !contains(file.folder, "_assets")
  AND !contains(file.folder, "Discord")
SORT file.mtime DESC
LIMIT 40
```
%%

| File                                                                                                                       | Updated                   |
| -------------------------------------------------------------------------------------------------------------------------- | ------------------------- |
| [[Network/AAR - Network Discovery (Concept).md\|AAR - Network Discovery (Concept)]]                                        | 12:33 AM - April 08, 2026 |
| [[Network/Network Map.md\|Network Map]]                                                                                    | 12:33 AM - April 08, 2026 |
| [[Network/Devices/House-Router.md\|House-Router]]                                                                          | 12:33 AM - April 08, 2026 |
| [[Network/Devices/Core-Router.md\|Core-Router]]                                                                            | 12:33 AM - April 08, 2026 |
| [[Network/Devices/Hypervisor.md\|Hypervisor]]                                                                              | 12:33 AM - April 08, 2026 |
| [[Internal/Devices/Archive/index.md\|index]]                                                                               | 12:32 AM - April 08, 2026 |
| [[Internal/AAR - Network Discovery and Recon.md\|AAR - Network Discovery and Recon]]                                       | 12:32 AM - April 08, 2026 |
| [[Internal/Devices/Ubiquiti.md\|Ubiquiti]]                                                                                 | 12:32 AM - April 08, 2026 |
| [[Internal/Devices/Wireguard-Gateway.md\|Wireguard-Gateway]]                                                               | 12:32 AM - April 08, 2026 |
| [[Internal/Devices/Technitium-DNS.md\|Technitium-DNS]]                                                                     | 12:32 AM - April 08, 2026 |
| [[Internal/Devices/Synology.md\|Synology]]                                                                                 | 12:32 AM - April 08, 2026 |
| [[Internal/Devices/Sterling.md\|Sterling]]                                                                                 | 12:32 AM - April 08, 2026 |
| [[Internal/Devices/Sliver.md\|Sliver]]                                                                                     | 12:32 AM - April 08, 2026 |
| [[Internal/Devices/Samsung.md\|Samsung]]                                                                                   | 12:32 AM - April 08, 2026 |
| [[Internal/Devices/Routerboard.md\|Routerboard]]                                                                           | 12:32 AM - April 08, 2026 |
| [[Internal/Devices/Proxmox.md\|Proxmox]]                                                                                   | 12:32 AM - April 08, 2026 |
| [[Internal/Devices/LisaSU25.md\|LisaSU25]]                                                                                 | 12:32 AM - April 08, 2026 |
| [[Internal/Devices/Pheonix.md\|Pheonix]]                                                                                   | 12:32 AM - April 08, 2026 |
| [[Internal/Devices/Lenovo-XCC.md\|Lenovo-XCC]]                                                                             | 12:32 AM - April 08, 2026 |
| [[Internal/Devices/Interceptor.md\|Interceptor]]                                                                           | 12:32 AM - April 08, 2026 |
| [[Internal/Devices/House-Router.md\|House-Router]]                                                                         | 12:32 AM - April 08, 2026 |
| [[Internal/Devices/Home Assistant.md\|Home Assistant]]                                                                     | 12:32 AM - April 08, 2026 |
| [[Internal/Devices/Gearbox.md\|Gearbox]]                                                                                   | 12:32 AM - April 08, 2026 |
| [[Internal/Devices/dn3.md\|dn3]]                                                                                           | 12:32 AM - April 08, 2026 |
| [[Internal/Devices/dn2.md\|dn2]]                                                                                           | 12:32 AM - April 08, 2026 |
| [[Internal/Devices/dn1.md\|dn1]]                                                                                           | 12:32 AM - April 08, 2026 |
| [[Internal/Devices/Changeling.md\|Changeling]]                                                                             | 12:32 AM - April 08, 2026 |
| [[Internal/Devices/Cacher.md\|Cacher]]                                                                                     | 12:32 AM - April 08, 2026 |
| [[Internal/Devices/Archive/Synology.md\|Synology]]                                                                         | 12:32 AM - April 08, 2026 |
| [[Internal/Devices/Archive/Interceptor.md\|Interceptor]]                                                                   | 12:32 AM - April 08, 2026 |
| [[Internal/Devices/Archive/LisaSU25.md\|LisaSU25]]                                                                         | 12:32 AM - April 08, 2026 |
| [[Internal/Devices/Archive/Gearbox.md\|Gearbox]]                                                                           | 12:32 AM - April 08, 2026 |
| [[Internal/Devices/Alpha-UPS.md\|Alpha-UPS]]                                                                               | 12:32 AM - April 08, 2026 |
| [[Internal/Devices/index.md\|index]]                                                                                       | 12:32 AM - April 08, 2026 |
| [[Internal/index.md\|index]]                                                                                               | 12:30 AM - April 08, 2026 |
| [[Policies/SOP - Performing a Network Audit and Asset Discovery.md\|SOP - Performing a Network Audit and Asset Discovery]] | 11:12 PM - April 07, 2026 |
| [[index.md\|index]]                                                                                                        | 10:57 PM - April 07, 2026 |
| [[Knowledge Base/Hardware/Hardware.md\|Hardware]]                                                                          | 10:02 PM - April 07, 2026 |
| [[Knowledge Base/LLM/OpenClaw.md\|OpenClaw]]                                                                               | 8:13 PM - April 07, 2026  |
| [[Network/The Stack.md\|The Stack]]                                                                                        | 8:13 PM - April 07, 2026  |

%% DATAVIEW_PUBLISHER: end %%