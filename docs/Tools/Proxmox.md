---
tags:
  - proxmox
  - linux
  - lab
Creation date: Monday April 4th 2022 11:18:30
---
Some very helpful stuff can be found in the [ProxMox Scripts](https://community-scripts.github.io/ProxmoxVE/scripts) -  awesome extras, LXCs "ready to go" VMs, etc.
I would *highly* recommend using the [post install](https://community-scripts.github.io/ProxmoxVE/scripts?id=post-pve-install) script as soon as you have Proxmox up and running.
Using the [Monitor-All](https://community-scripts.github.io/ProxmoxVE/scripts?id=monitor-all) tool, tag all critical VMs and LXC containers with `mon-restart`, this will ensure they keep running and are watched a bit more closely.