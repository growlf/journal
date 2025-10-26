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
### Cascade STEAM Service Corp
Working with local colleges, local businesses, and [[BMS]] to create a Internship/Mentorship business model that allows for actual experience for new college graduates in our community as a free service.

### Obsidian Sync (self-hosted)
I self hosting my own Obsidian Sync service for my journal (and several other collaborative projects as well). I am writing some notes about it in the [[Tools/CouchDB|obsidian-sync]] page.  It is surprisingly very easy to setup and maintain.

### Miscelaneous
Throughout my pages, you may see task boxes littered throughout. This is how I leave notes to myself for things that still need polishing or completing. I use Obsidian plugins to manage them. This journal is a *living* document that changes frequently and is in constant edit-mode. 

## Recent Changes / Additions
Site-wide listing of last 20 creations and modifications over the last 4 days:
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
LIMIT 20
```
%%

| File                                          | Updated                    |
| --------------------------------------------- | -------------------------- |
| [[index.md\|index]]                           | 2:21 PM - October 22, 2025 |
| [[Tools/SyncThing.md\|SyncThing]]             | 2:19 PM - October 22, 2025 |
| [[Tools/PVE Monitor-All.md\|PVE Monitor-All]] | 2:19 PM - October 22, 2025 |
| [[Knowledge Base/DHCP.md\|DHCP]]              | 2:18 PM - October 22, 2025 |
| [[Knowledge Base/DNS.md\|DNS]]                | 2:15 PM - October 22, 2025 |
| [[Knowledge Base/WiFi.md\|WiFi]]              | 2:13 PM - October 22, 2025 |
| [[Knowledge Base/Router.md\|Router]]          | 2:13 PM - October 22, 2025 |
| [[Knowledge Base/Firewall.md\|Firewall]]      | 2:13 PM - October 22, 2025 |
| [[Knowledge Base/Obsidian.md\|Obsidian]]      | 2:12 PM - October 22, 2025 |
| [[Knowledge Base/ISP.md\|ISP]]                | 2:10 PM - October 22, 2025 |
| [[Lab/The Stack.md\|The Stack]]               | 2:09 PM - October 22, 2025 |
| [[Lab/Home Lab 101.md\|Home Lab 101]]         | 2:09 PM - October 22, 2025 |
| [[Gizmos/index.md\|index]]                    | 2:06 PM - October 22, 2025 |
| [[Tools/CouchDB.md\|CouchDB]]                 | 2:03 PM - October 22, 2025 |
| [[Tricks/index.md\|index]]                    | 1:56 PM - October 22, 2025 |
| [[Testing/index.md\|index]]                   | 1:56 PM - October 22, 2025 |
| [[Tools/index.md\|index]]                     | 1:56 PM - October 22, 2025 |
| [[Knowledge Base/index.md\|index]]            | 1:56 PM - October 22, 2025 |
| [[Lab/index.md\|index]]                       | 1:56 PM - October 22, 2025 |
| [[Gearbox\|Gearbox]]               | 4:48 PM - October 21, 2025 |

%% DATAVIEW_PUBLISHER: end %%