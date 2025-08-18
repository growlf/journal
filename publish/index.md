---
tags:
  - about
Creation date: Monday April 4th 2022 11:18:30
---
---
![[banner.svg]]

My personal journal of technology-land adventures ...and other things.  I am using [[Obsidian]] to generate and maintain this journal - then [[GitHub-Quartz-Obsidian]] to publish it.  I write from a standpoint of a technology professional, but also a student - always curious and always learning. I strongly believe in "asking the stupid questions" because if not Me, then who will. There is always someone in the audience that is either too shy or afraid to ask "that" question that "should be obvious".

## Current Projects/Focuses
Updated fairly constantly as my attention shifts due to work, mentee questions, or just simply a matter of "Oh look! SHINY!"
1) [[Grafana]] - for alerting, monitoring, debugging, just plain-le-entertaining animated graphs... etc
2) [[Ansible]]!  ...*sigh* ... adding this as a "new" focus even though I have been poking it along for a while now ;)  This just resurfacing as a primary driver for various reasons.
3) [[WorkAdventure]] - a cool social communication tool with so much more to offer for hybrid events.  Still having some issues getting the voice and video to work outside the LAN.
4) [[Gizmos]] - beginning to add my gadgetry to this blog.  Not to be confused with my [[Hardware]] - which is a tad more stable and less likely to change from day to day.  This will be an ongoing task. LOL
5) Journaling.  Setting and example of documenting my experiences and sharing what I learn as I go.
### Background Focuses
- [[Cloud Init]] - This is mostly done and moving to my background tasks.
- [[The Stack]] - The tech stack I most often use or implement/manage/maintain. This is now fairly defined at a medium to high level.  Continuing updates will occur as I add specifics to individual pages.  Dropping this to background tasks now.
## Who am I?
I am The NetYeti. I answer to "hey, you!", "Yeti", and Garth Johnson - among other things.  I started with technology early in life and never slowed down or stopped. I am an avid supporter of all things fun+community+educational. 

After years of working in the industry, I now 
- instruct at [Bellingham Technical College](https://www.btc.edu/)
- freelance and consult with clients and non-profit or educational organizations
- am a founding member of [Cascade STEAM](https://www.cascadesteam.org) - a local 501.c3 non-profit organization dedicated to many of the things that I hold dear
- am a board member of the [Linuxfest Northwest](https://lfnw.org) organization that puts one of the largest free Linux festivals together in the USA - right here in little ole Bellingham Washington!
- am very involved in multiple local community organizations such as [BLUG](https://www.blug.org/), The BTC [Raspberry Pi Club](https://www.raspberrypiclub.org/), [Bellingham Makerspace](https://bellinghammakerspace.org/), and others.

### Friends, Peers, Students, and Associates
Without friends and peers, where is the fun of discovery?  Sharing is caring, and the following is growing list of cool folx are also into the sharing spirit of what they do and what they know or learn.  I am of the opinion that *who we are as individuals* is a reflection of, and reflected by, the people with whom we associate. So.. check 'em out, these are some fun and engaging folx :)
- [Viv](https://itsvivianmill.github.io/journal), [Lili](https://lynxee123.github.io/journal/), [Ricky](http://rigunkes.github.io/Journal/) - Student's with amazing passion and drive to become technology professionals. DISCLAIMER: not all students are listed, as each must personally give permission to list them *and* have a site to point to (it's a [FERPA](https://studentprivacy.ed.gov/ferpa) thing). This is also a nudge to other students who are not yet listed. ;)
- [Josh](https://joshbuker.com/) - Technology connoisseur and all around awesome dude. Deals with security standards... a lot.
- [Keith](https://kmatthews123.github.io/) - The "lets try it" guy. No-fear explorer and engineer extraordinaire. A prime example of the student became the Master.
- [Sam](https://github.com/orgs/RoboRuckus/people/ShVerni) - The dude is on fire! While not a journaler per-se, he is a prolific open-source contributor and peer that actively (and constantly) mentors and shares. Check out his [RoboRuckus](https://www.roboruckus.com/) and [Fabrica-IO](https://github.com/FabricaIO/FabricaIO-App/wiki/App-Usage) projects. His coding may "merely be a hobby" for *him*, but the ideas and info are well constructed and implemented at an exemplary level.
Most of us can generally be found on the [Cascade Steam Discord](http://hub.cascadesteam.org/), if you want to meet and chat with us.

---
## Status
Bellow is a set of tools that (currently) only works correctly in Obsidian and allows me to see what needs updating and where I have been focusing. At the moment Quartz does not support the two [[Obsidian]] plugins that I am using to generate the content - so, that is also a set of ToDos (like you will see throughout my other pages).
- [ ] Resolve issue with Quartz publishing method that does not support the Dataview plugin
- [ ] Resolve issue with Quartz publishing method that does not support the Tasks plugin

### Recent Changes / Additions
```dataview
TABLE change[0] as "Action", change[1] as "Date"
FLATTEN list( list("modified", file.mtime), list("created", file.ctime)) as change
SORT change[1] DESC
LIMIT 20
```
```dataview-publisher

```

### ToDo
My task list accumulated from my pages and notes:
```tasks
not done
sort by priority
limit 10
```

`=this.file.link`