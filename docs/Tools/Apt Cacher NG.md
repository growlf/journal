---
tags:
  - lab
  - lxc
  - staging
  - linux
Creation date: Monday April 4th 2022 11:18:30
---
---
Use an apt cache for your network!  It speeds up Linux deployments and upgrades substantially, and also reduces network bandwidth usage to the internet.
Since I am an avid [[Proxmox]] user, I use the simplicity of the community scripts to install [Apt-Cacher-ng](https://community-scripts.github.io/ProxmoxVE/scripts?id=apt-cacher-ng).
Along with this, you may want to install [auto-apt-cacher](https://manpages.ubuntu.com/manpages/oracular/man1/auto-apt-proxy.1.html) and follow the advice to set up a `SRV` record in your [[DNS]] to make it more easily available.
