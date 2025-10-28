---
tags:
  - lab
  - lxc
  - staging
  - linux
Creation date: Monday April 4th 2022 11:18:30
management_url: http://192.168.42.5:3142/
---
Apt-cacher-ng is a caching proxy server that speeds up package downloads for multiple computers on a local network. It stores copies of software packages downloaded from external repositories like those from Debian or Ubuntu. When another machine on the network requests the same package, Apt-cacher-ng serves it from its local cache, which reduces download times and saves on internet bandwidth. 

How it works
- **Caching:** When a client machine downloads a package (e.g., using `sudo apt-get install package-name`), Apt-cacher-ng intercepts the request, downloads the package, and stores a copy.
- **Local delivery:** If another client needs the same package, it retrieves it directly from the local Apt-cacher-ng server instead of the internet.
- **Benefits:** This significantly lowers latency and reduces external network traffic, especially in environments with many machines, such as testing labs or large networks. 

Key features
- **Broad compatibility:** It works with Debian-based systems like Ubuntu, Debian, and Linux Mint, as well as other distribution mirrors.
- **Low resource usage:** It is designed to be efficient, requiring low system resources while maintaining high throughput.
- **Web interface:** It includes a web frontend to view statistics on cached data and trigger actions.- **Configuration:** It can be configured to work with both standard and encrypted (SSL/TLS) repositories, though HTTPS may require special setup.

Use an apt cache for your network!  It speeds up Linux deployments and upgrades substantially, and also reduces network bandwidth usage to the internet.

Since I am an avid [[Proxmox]] user, I use the simplicity of the community scripts to install [Apt-Cacher-ng](https://community-scripts.github.io/ProxmoxVE/scripts?id=apt-cacher-ng) as an LXC container. See my [[The Stack]] page.

Along with this, you may want to install [auto-apt-proxy](https://manpages.ubuntu.com/manpages/oracular/man1/auto-apt-proxy.1.html) and follow the advice to set up a [DNS Service record](https://www.cloudflare.com/learning/dns/dns-records/dns-srv-record/) in your [[DNS]] to make it more easily available. This will add the `/etc/apt/apt.conf.d/00apt-proxy.comf` file with the something like the following:
```conf
Acquire::http::Proxy-Auto-Detect "/usr/bin/auto-apt-proxy";
Acquire::ftp::Proxy-Auto-Detect "/usr/bin/auto-apt-proxy";
```
