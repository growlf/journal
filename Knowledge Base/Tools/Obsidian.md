---
tags:
  - documentation
  - obsidian
Creation date: Monday April 4th 2022 11:18:30
---
## What is Obsidian
First off check out the [Obsidian website](https://obsidian.md/).

In a nutshell, Obsidian is a personal knowledge management and note-taking application that uses plain Markdown (.md) files stored locally on your device. Its key features include a powerful linking system to connect notes, a customizable interface, and a focus on user ownership and data control, allowing you to build a "second brain".  It can be extended to do many additional things using a large ecosphere of plugins and services (most are free)
## Working with Obsidian

My current layout has evolved to be more dynamic. I have a vault with the following directory structure (the relevant parts at least):
![[obsidian-directory-layout.svg]]

Previously, I used a `publish` directory to segregate public and private content. I have since removed that folder and implemented **[[DATAVIEW_PUBLISHER]]**. This allows me to use Dataview queries to dynamically generate index pages and content while keeping private information in the `Internal/` folder (which is Git-ignored). This ensures my templates and source files (such as Excalidraw files) stay out of the public journal while remaining in the same repository.

## Publishing to GitHub
I am using [[Knowledge Base/Development/Obsidian/GitHub-Quartz-Obsidian]] to automatically publish my content to a public audience on a *huge* platform, complete with SSL and versioning control.
## Links
- [[Knowledge Base/Development/Obsidian/Obsidian Plugins]]
- [Obsidian Help](https://help.obsidian.md/Plugins/Templates)
- [Timeblocking](https://thesweetsetup.com/timeblocking-in-obsidian/)
- [Time date Format](https://momentjs.com/docs/#/displaying/format/)
- [Organizing Notes](https://papierlos-studieren.net/en/2021/04/04/organize-notes-in-obsidian-my-workflow/)
- [[Knowledge Base/Development/Obsidian/GitHub-Quartz-Obsidian]]

-----
## Tasks:
- [x] Update obsidian layout to reflect most recent move to remove the publish folder and implement dataview-publisher