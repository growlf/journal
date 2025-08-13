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
  - rebuild
---
---
To be clear - this idea of "replicating" is more of an "oh no! I need to downgrade! But, there is no clear path!" ...and I decided that making an automation process to generate my system would be a good test of my DevOps skills anyhow. 

Recently, I discovered the laptop that I was using had somehow been upgraded from the LTS version of Ubuntu to the extremely short lived 24.10 release - which just hit EOL. To make matters worse, I chose (for various reasons) to use [ZFS](https://pve.proxmox.com/wiki/ZFS_on_Linux) during my initial installation - and guess what is not supported in 25.04. You guessed it, [ZFS](https://pve.proxmox.com/wiki/ZFS_on_Linux). I am not willing to give up my features.

Well, heck. Not sure how I managed this, especially when I frequently advise others not to do such a thing, but here I am. I blame the gremlins that take over my fingers during late night stints on the keyboard. They are generally the culprits. 

Since I am still an avid Ubuntu user and not yet converted to something like [NixOS](https://nixos.org/), I need to replicate my install with the older (and supported) [Ubuntu 24.04](https://releases.ubuntu.com/noble/) - like I thought I still was using.  The following is the journal of that unexpected journey.

## The Journey Begins
I am not going to format this system till I ***know*** that I have a fool-proof solution to get me back up and running in a very short period of time - i.e. less than an hour or so.  While twiddling away on a solution that may take a day or three to create and have absolute faith in, I cannot afford actual down time on my daily driver.

Using `deje-dupe`, I made a backup to my [[NAS]] - just to be safe.
### Getting a list of Installed Packages
I guess step one is to get a list of all of my installed packages, since I will want to make sure I have all of them **re**installed. To do that, we can use any one of several tools. In this case, however, I am going to use the old and sure way:
```bash
apt list --manual-installed > /tmp/packages.txt
```

This generated a reasonable list of packages that I had manually added after the system was staged. I do not need all of the automatic ones or upgrades, etc.  Also, I will need to modify this list a bit to remove all of the 'oracular' mentions (and versions) and simply boil it down to just the package names. If you were simply looking for a "reinstall" using something like `dpkg --get-selections` might be a better option, but I am going to be downgrading to an older release and this would collide. Badly.

So, to parse the part I want out and have a nice simple list of packages to reinstall:
```bash
cat /tmp/packages.txt | awk -F'/' '{print $1}' > /tmp/reinstall_list.txt
```
A small edit or two to remove unwanted lines here and there, such as the first line that is not a package, and a few packages that I just don't need or are referenced/installed manually from `.deb` files instead.

Storing that on my local NAS for later.

### Safety Net
OK, but what about the "one-off" packages that I downloaded the deb-file for or did some sort of manual thing with `make`?  ...and, *cough*, any snaps I accidentally allowed in?  Not even starting the conversation about all of the UI and other customization's that I tend to do to my desktop, ***sigh***.  How will I know for certain that everything was copied before I format and have no recourse? 

I do know that a lot of my settings are stored in `dconf`, so a quick backup of that to a dump file is a good idea.
```bash
dconf dump / > /tmp/dconf_dump_current.ini
```
And then copy that to my NAS.  I can use that to restore many of my settings on the new system after everything is installed on it with
```bash
dconf load / < /tmp/dconf_dump_current.ini
```

Lets get a VM setup that I can test on, for safety and prevent my bumbling from causing data-loss.  Using my trusty [[Proxmox]] server, this is an easy task.  I already had a copy of the 24.04.2 Ubuntu Desktop ISO on there, so I generated an instance to throw things at and then immediately made a snapshot so that I can roll back to the last stage when things go wrong. 

I *could* have used an `autoinstall.yml` as described [here](https://linuxconfig.org/how-to-write-and-perform-ubuntu-unattended-installations-with-autoinstall) and [here](https://nsg.cc/post/2024/autoinstall/), but I am in a hurry to get things moving. Besides, I suspect I can apply all of my steps easily to this option again later when I re-try for the umpteenth time - later on.  I just selected my usual config options manually.

OK, the system is up, running, my ssh-keys are installed for remote access (my private keys will be copied later with the rest of my personal data)
```bash
wget -O ~/.ssh/authorized_keys https://github.com/growlf.keys
sudo apt install openssh-server -y
```
and I am logging out of the GUI now to start the process remotely through [[ssh]]. Anything I can do over SSH, I can later automate with [[Ansible]].
### The Apps
Logging into the test system with ssh, execute the following:
- add the apt proxy and misc debs to the system - use `scp` to copy them to the other system
```bash
scp -r scp/* wight:/tmp/
```
- Log into the target over [[ssh]] and begin the process:
```bash
# Add my local apt proxy and expected repos
sudo mv rebuild/00aptproxy.conf /etc/apt/apt.conf.d/
sudo add-apt-repository multiverse -y
sudo add-apt-repository restricted -y
sudo add-apt-repository ppa:dotnet/backports
sudo apt update && sudo apt upgrade -y
# Basic required tools
sudo apt install curl nano git -y
# Install Docker
curl -fsSL https://get.docker.com | sudo sh
sudo usermod -aG docker ${USER}
# Install Signal (no deb available?)
sudo snap install signal-desktop
# Manual .deb downloads installs
sudo apt install /tmp/code_1.102.3-1753759567_amd64.deb -y
sudo apt install /tmp/discord-0.0.104.deb -y
sudo apt install /tmp/obsidian_1.8.10_amd64.deb -y
sudo apt install /tmp/google-chrome-stable_current_amd64.deb -y
sudo apt install /tmp/Modrinth\ App_0.10.3_amd64.deb -y
sudo apt install /tmp/warp-terminal_0.2025.07.30.08.12.stable.02_amd64.deb -y
sudo apt install /tmp/zoom_amd64.deb -y
# Everything else - this takes a few
sudo apt install $( cat /tmp/reinstall_packages_list.txt ) -y 
```
- Install [[TailScale]]
```bash
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/noble.noarmor.gpg | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/noble.tailscale-keyring.list | sudo tee /etc/apt/sources.list.d/tailscale.list
sudo apt-get update
sudo apt-get install tailscale
```
- install Teams
```bash
sudo mkdir -p /etc/apt/keyrings
sudo wget -qO /etc/apt/keyrings/teams-for-linux.asc https://repo.teamsforlinux.de/teams-for-linux.asc
sh -c 'echo "Types: deb\nURIs: https://repo.teamsforlinux.de/debian/\nSuites: stable\nComponents: main\nSigned-By: /etc/apt/keyrings/teams-for-linux.asc\nArchitectures: amd64" | sudo tee /etc/apt/sources.list.d/teams-for-linux-packages.sources'
sudo apt update && sudo apt install teams-for-linux -y
sudo apt auto-remove -y
sudo reboot
```

So far so good.  Minor errors with some packages left in the main list that collided like `fuse` or a printer driver which I removed from the list (about 8 of them), but then everything worked.
### Yet To Be Done
Personal files/settings and customization from existing system (then I will compare the installed packages):
- cnrdrvcups-ufr2lt-us - my Cannon printer driver
- Settings, keys, Syncthing config, etc
	I made a complete backup, of course (just in case), and will be considering using a `zfs send` option in the future.
- `.zshrc`, `.bashrc`, etc

Taking a break and getting back to work on my [[Grafana]] project for a few.
