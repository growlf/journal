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

Since I am an avid [[Knowledge Base/Tools/Proxmox]] user, I use the simplicity of the community scripts to install [Apt-Cacher-ng](https://community-scripts.github.io/ProxmoxVE/scripts?id=apt-cacher-ng) as an LXC container. See my [[Learning/Home-Lab-Series/Default-Stack-Blueprint|The Stack]] page.

Along with this, you may want to install [auto-apt-proxy](https://manpages.ubuntu.com/manpages/oracular/man1/auto-apt-proxy.1.html) and follow the advice to set up a [DNS Service record](https://www.cloudflare.com/learning/dns/dns-records/dns-srv-record/) in your [[DNS]] to make it more easily available. Once that is done, add the `/etc/apt/apt.conf.d/00apt-proxy.comf` file with the following:
```conf
Acquire::http::Proxy-Auto-Detect "/usr/bin/auto-apt-proxy";
Acquire::ftp::Proxy-Auto-Detect "/usr/bin/auto-apt-proxy";
```
