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
After much struggle with attempting to publish my [[Obsidian]] journal to an existing BookStack instance, I found that [[Quartz]] is an amazing solution for getting my content in front of folx yet keeping it easy to update with my favorite note-taking app.  What follows is the successful part of my journey (so that you can use it on your own Journals as well.)

## Step 1
I created a public [GitHub](https://github.com/) project and added a LICENSE, README.md, .gitignore, etc.   Also created a `publish` folder in it. Then cloned it to my local system. Yes, I live on Linux systems but this whole process works on Windows and Mac just as easily.
## Step 2
I opened my [Obsidian](https://obsidian.md/download) instance and added a new vault that points at the cloned project's folder.  I added a default landing page - `index` - to the `publish` folder.  NOTE: named literally, `index` - lowercase (it is an issue with the quartz workflow that it is so specific).  Now I added the [Community Plugin](https://help.obsidian.md/community-plugins) for [GIT](https://publish.obsidian.md/git-doc/Installation). This enables easy updates to my repository from within the Obsidian interface itself. This *does* require that I have [[Git]] properly installed on my system.
## Step 3
Add the magic in! I created a `.github/workflows` directory next to the `publish` directory in my locally cloned project, and then added [the buiild script](https://raw.githubusercontent.com/growlf/journal/refs/heads/main/.github/workflows/Build_Quartz_Site.yml) to it.  Simply down load the file into the folder as `.github/workflows/Build_Quartz_Site.yml`.
## Step 4
Commited all of my changes and pushed them up to my repository, sat back and watched the actions kick in. On the `deploy` task in GitHub's `Actions`, it will also tell you where it got published to. It will be `https://<your account name>.github.io/<your repo name>` by default.
## Notes
- You can deploy your page to a custom domain as well (i.e. `journal.yeticraft.net` instead of the default that it shows up as, which for me is `growlf.github.io/journal`)
- If you want to customize your theme, look at my [quartz](https://github.com/growlf/journal/tree/main/.github/quartz) folder for a rough example, or look at the links below here.
## Links
My inspiration and ability, as always, comes from those that have already pioneerd what I am using.  This project is no different.  Checkout these sources:
1) [GitHub marketplace actions - Build Quartz](https://github.com/marketplace/actions/build-quartz-for-github-pages)
2) [Quartz](https://quartz.jzhao.xyz/)
3) [Obsidian](https://obsidian.md/download) - the source, and also my *own* thoughts on [[Obsidian]]
4) [Themes!!!](https://github.com/saberzero1/quartz-themes) - but also a different way to implement Quartz rendering for Github Pages, but slightly more customizable and manual.