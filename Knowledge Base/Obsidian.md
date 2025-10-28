---
tags:
  - documentation
  - obsidian
Creation date: Monday April 4th 2022 11:18:30
---
## What is Obsidian
First off check out the [Obsidian website](https://obsidian.md/) and read their own documentation and marketing content.

In a nutshell, Obsidian is a personal knowledge management and note-taking application that uses plain-ole Markdown (`.md`) text files stored locally on your device. Its key features include a powerful linking system to connect notes, a customizable interface, SQL-like access to all content and properties, as well as a focus on user ownership and data control. All of this allows you to build a "second brain".  It can be extended to do many additional things using a very large ecosphere of plugins and services (most of which are actually free - [[FLOSS]]).
## Working with Obsidian

My current layout is fairly simple.  I have a vault with the following directory structure (the relevant parts at least):
![[obsidian-directory-layout.svg]]
Only the `publish` directory gets published due to my settings in my `.github/workflow` files.  This allows me to keep my templates and source files (such as Excalidraw files) out of the journal publishing, but still keep them in the same repository.
## Publishing to GitHub
I am using [[GitHub-Quartz-Obsidian]] to automatically publish my content to a public audience on a *huge* platform, complete with SSL and versioning control.
## Links
- [[Obsidian Plugins]]
- [Obsidian Help](https://help.obsidian.md/Plugins/Templates)
- [Timeblocking](https://thesweetsetup.com/timeblocking-in-obsidian/)
- [Time date Format](https://momentjs.com/docs/#/displaying/format/)
- [Organizing Notes](https://papierlos-studieren.net/en/2021/04/04/organize-notes-in-obsidian-my-workflow/)
- [[GitHub-Quartz-Obsidian]]

-----
## Tasks:
- [ ] Update obsidian layout to reflect most recent move to remove the publish folder and implement dataview-publisher