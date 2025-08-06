---
tags:
  - linux
  - ubuntu
  - desktop
  - backup
Creation date: Monday April 4th 2022 11:18:30
modification date: 
Documentation: 
aliases:
  - Ubuntu release EOL
---
---
To be clear - this idea of "replicating" is more of an "oh no! I need to downgrade! But, there is no clear path!" ...and I decided that making an automation process to generate my system would be a good test of my DevOps skills anyhow. 

Recently, I discovered the laptop that I was using had somehow been upgraded from the LTS version of Ubuntu to the extremely short lived 24.10 release - which just hit EOL. To make matters worse, I chose (for various reasons) to use [ZFS](https://pve.proxmox.com/wiki/ZFS_on_Linux) during my initial installation - and guess what is not supported in 25.04. You guessed it, [ZFS](https://pve.proxmox.com/wiki/ZFS_on_Linux). I am not willing to give up my features.

Well, heck. Not sure how I managed this, especially when I frequently advise others not to do such a thing, but here I am. I blame the gremlins that take over my fingers during late night stints on the keyboard. They are generally the culprits. 

Since I am still an avid Ubuntu user and not yet converted to something like NixOS, I need to replicate my install with the older (and supported) Ubuntu 24.04 - like I thought I still was using.  The following is the journal of that unexpected journey.

## The Journey Begins
I am not going to format this system till I ***know*** that I have a fool-proof solution to get me back up and running in a very short period of time - i.e. less than an hour or so.  While twiddling away on a solution that may take a day or three to create and have absolute faith in, I cannot afford actual down time on my daily driver.
### Getting a list of Installed Packages
I guess step one is to get a list of all of my installed packages, since I will want to make sure I have all of them **re**installed. To do that, we can use any one of several tools. In this case, however, I am going to use the old and sure way:
```bash
apt list --manual-installed > ~/packages.txt
```

This generated a reasonable list of packages that I had manually added after the system was staged. I do not need all of the automatic ones or upgrades, etc.  Also, I will need to modify this list a bit to remove all of the 'oracular' mentions (and versions) and simply boil it down to just the package names. If you were simply looking for a "reinstall" using something like `dpkg --get-selections` might be a better option, but I am going to be downgrading to an older release and this would collide. Badly.

So, to parse the part I want out and have a nice simple list of packages to reinstall:
```bash
cat packages.txt | awk -F'/' '{print $1}' > reinstall_list.txt
```
Storing that on my local NAS for later.

### Safetynet
Ok, but what about the "one-off" packages that I downloaded the deb-file for or did some sort of manual thing with `make`?  ...and, *cough*, any snaps I accidentally allowed in?  Not even starting the conversation about all of the UI and other customizations that I tend to do to my desktop, ***sigh***.  How will I know for certain that everything was copied before I format and have no recourse? 

One thing at a time. Lets get a VM setup that I can test on.  Using my trusty [[Proxmox]] server, this is an easy task.  I already had a copy of the 24.04.2 Ubuntu Desktop ISO on there, so I generated a quick instance to throw things at and made a snapshot so that I can roll back to the last stage when things go wrong.

I *could* have used an `autoinstall.yml` as described [here](https://linuxconfig.org/how-to-write-and-perform-ubuntu-unattended-installations-with-autoinstall) and [here](https://nsg.cc/post/2024/autoinstall/), but I am in a hurry to get things moving. Besides, I suspect I can apply all of my steps easily to this option again later when I re-try for the umpteenth time - later on.  I just selected my usual config options manually.

Ok, the system is up, running, my ssh-keys are installed, and I am literally logging out of the GUI now to start the process through [[Ansible]].
### Automation with Ansible
