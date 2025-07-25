---
tags:
  - github
  - documentation
  - github-pages
  - quartz
  - obsidian
Creation date: Monday April 4th 2022 11:18:30
---
---
After much struggle with attempting to publish my [[Obsidian]] journal to an existing [[BookStack]] instance, I found that [[Quartz]] is an amazing solution for getting my content in front of folx.  What follows is the successful part of my journey (so that you can use it on your own Journals as well.)

## Step 1
Create a public [GitHub](https://github.com/) project and add a `docs` folder to it, a license, etc.   Then clone it to your local system (yes, even on Windows).
## Step 2
Open your [Obsidian](https://obsidian.md/download) instance and add a new vault that points at the cloned project's `docs` folder.  Add an `index` page.  Make note named, literally, `index` - lowercase (it is an issue with the quartz workflow that it is so specific).  Now add the [Community Plugin](https://help.obsidian.md/community-plugins) for [GIT](https://publish.obsidian.md/git-doc/Installation). This will enable easy updates to your repository from within the Obsidian interface.
## Step 3
Add the magic in! Create a `.github/workflows` directory next to the `docs` directory in your locally cloned project, and then add [the buiild script](https://raw.githubusercontent.com/growlf/journal/refs/heads/main/.github/workflows/Build_Quartz_Site.yml) to it.  Simply down load the file into the folder as `.github/workflows/Build_Quartz_Site.yml`.
## Step 4
Commit all of your changes and push them up to your repository.  Watch the actions kick in and on the `deploy` task, it will also tell you where it got published to. 
## Notes
- You can deploy your page to a custom domain as well (i.e. `journal.yeticraft.net` instead of the default that it shows up as, which is `growlf.github.io/journal`)
- If you want to customize your theme, look at my [quartz](https://github.com/growlf/journal/tree/main/.github/quartz) folder for an example, or look at the links below here.
## Links
My inspiration and ability, as always, comes from those that have already pioneerd what I am using.  This project is no different.  Checkout these sources:
1) [GitHub marketplace actions - Build Quartz](https://github.com/marketplace/actions/build-quartz-for-github-pages)
2) [Quartz](https://quartz.jzhao.xyz/)
3) [Obsidian](https://obsidian.md/download) - the source, but also my own thoughts on [[Obsidian]]