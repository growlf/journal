---
banner: "![[homelabv1.jpg]]"
banner-x: 60
banner-y: 40
banner-height: 260
content-start: 211
---
## Who is this for?
This document series is intended as a foundational baseline for most simple network implementations where multiple users, services, and access to/from the internet is expected to exist for business-like purposes.  

 This basic design is applicable for "home lab" scenarios and for personal and community learning purposes.  A strong bias towards Opensource software is intended (and shown where possible) to allow an inexpensive yet professional implementation with personal and non-profit usage.
## Why do this
Having a safe environment to explore and experiment within makes learning much easier, more effective, and considerably more valuable. Having an environment that is also one that you use on a daily basis and actually somewhat rely upon, makes it much more likely that you will notice issues and critical nuances of configuration that can lead to important learning moments that a typical classroom setting just *can not* simulate. Making it inexpensive lowers the barrier to entry and allows a wider base of collaborators and peers to join in the learning.

> [!NOTE] Perfection is NOT always what you think it is
> Do not go into this project thinking that you are going to create the most perfect network, devices, and lab imaginable. In fact - assume that you are making a "manageable mess" that allows you to learn and explore with safety and near complete abandon.  In other words - please have fun with it!

## Overview

### Step 1 - Document EVERYTHING!!
I will use [[Obsidian]] for this.  You might want to do so as well.  It is a very easy to use note taking application and can be extended to the universe and **beyond!** (We will also cover this application and it's capabilities in more depth in other documents and sessions)
Why document? Memory is a curious and fickle thing - and collaboration is easier when you can share tangible content. I highly recommend looking at my dear friend Vivian's [documentation](https://itsvivianmill.github.io/journal/Instructions/How-to-Create-a-GitHub-Journal-with-Obsidian) on creating an Obsidian managed, Github hosted, free, public journal.
### Step 2 - Acquire the Basic Hardware Components
Beyond the obvious cabling and individual system's LAN network interfaces, we will require the following:
- A Modem/internet-interface with service to the internet (aka an [[ISP]])
- [[Knowledge Base/Router|Router]] 
- [[Knowledge Base/Firewall|Firewall]] 
- [[Knowledge Base/WiFi|WiFi]] Access point
- [[Knowledge Base/DNS/index|DNS]] server
- [[Knowledge Base/DHCP|DHCP]] server

> [!NOTE] Residential Internet Customers
> In most residential environments, you will find all of these in a *single* device that is installed by the [[ISP]] (see the relevant diagram below). We will, ultimately, want to have individual devices/services for each purpose. However, we can create or add these later, as we progress towards our goals.

Other hardware that will be needed:
- [[Knowledge Base/UPS|UPS]] - Uninterrupted Power Supply
- One (or more) user stations (i.e. laptops, desktops, etc)
- One (or more) Hypervisor server (we will use [[Network/Services/Proxmox/index|Proxmox]] - for VMs, [[Knowledge Base/LXC|LXCs]], [[Knowledge Base/Docker/index|Docker]], etc) (supporting VT-X or AMD-v and hyper-threading)
- [[Knowledge Base/NAS|NAS]] with ample storage. One is good, two is better.

### Step 3 - General Design Concepts

> [!NOTE] Static IP
> Static IP is a nice to have, but not a requirement. It can certainly make it a little easier to access your home lab remotely, but we can still achieve reliable remote access using things like [[Tailscale]] - even without it.

Before we start putting any real effort into this plan for a home lab, we need to set the stage with some basic foundational assumptions.
- **Security** - at every layer, starting from the [[Knowledge Base/Router|router]] and all the way to your apps and documentation.
	- [[Knowledge Base/Firewall|Firewall]] should be default-drop-all for all outside access and intentionally modified (with versioning control) to allow specific services through. External logging to a monitoring/alerting solution such as [[Knowledge Base/Monitoring|Grafana]] is an absolute must. Internal rules can be more open.
	- Basic network design should include provision for separation between network environments. For example the [[Knowledge Base/WiFi|WiFi]] access should be entirely isolated from the infrastructure services. The infrastructure services should be accessed through a proxy and only directly available from within their own physically isolated network. A shared physical layer with multiple routed traffic is not enough.
	- Good passwords, [[Knowledge Base/MFA|MFA]], and tokens where possible.
- **Reduce your bandwidth usage** replication as much as possible (get your money's worth)
	- Caching and proxies should be used to minimize system updates impact on bandwidth.
- **One source of truth** - always try to keep a single "source of truth" rather than replicate documents in multiple locations where information schisms can occur without being noticed. Keep it as simple as possible.  Things tend to get complicated without any help.

> [!WARNING] Temporary is the most permanent thing you can do
> Avoid, at almost any cost, making "easy" and "temporary" solutions that become embedded and intractable later. This has probably brought more tears to more system administrators eyes than any other mistake you can make. Always be thinking, "*how hard will it be to replace or upgrade this later?*"  If there is a more flexible answer that still achieves the goal at the moment, but takes a bit more effort - it may be the best option. Simply taking the time to implement what you actually need the first time is a good general course of action.

### Step 4 - Consider Additional Support Services 
These are things to be created/made-available as we go, and are not immediately necessary.  That said, *do* keep these in mind.
- **Password manager**: (*this is very important!!*) Don't write down passwords in notes. Don't use "easy to remember" passwords. Don't re-use passwords to make things "easier".
- A **Version control system**. This can be externally hosted - i.e. [GitHub](https://github.com/), [GitLab]( https://gitlab.com), [BitBucket](https://bitbucket.org/), [GiTea](https://about.gitea.com/) etc. You need to be able to recover code in emergencies, roll back from bad directions in development, etc.
- **Backup service and storage**. This can be externally hosted - but it might be best if it is locally hosted at first.
- **Apt-cacher**: Linux systems use bandwith to install and update. By using a caching proxy, you use local LAN resources and substantially increase the speed of installs and updates, and also reduce the bandwidth usage on your internet facing side of things.
- **Network Storage**: All applications need to store data. It's what they do.
- **Network & Resource Monitoring**. If you dont know about it - *it can and will still hurt you!*
- **[[Knowledge Base/Docker/index|Docker]] manager**: [[Knowledge Base/Docker/index|Docker]] containers are amazing, but can also be dificult to manage after you get a few stacks of them running. Consider a tool like [[Portainer]].
- **Email**: (external - for now)
- **Website**: (MANY choices, but we will get to thatv later) Blog your journey. Create a web store for your software, art, or what ever. Join the web!
- **Documentation Collaboration hub** ([[Knowledge Base/Obsidian/CouchDB Deployment Files|CouchDB]] for LIve Sync with [[Knowledge Base/Obsidian/index|Obsidian]])
- **Internal [[Knowledge Base/DNS/index|DNS]]**: (aka split DNS) should be available to the LANs and set as default in the [[Knowledge Base/DHCP|DHCP]] settings to allow easier access to systems that will not be available to the Internet directly (i.e. the many [[Knowledge Base/DHCP|DHCP]] addressed systems, which should be in specific zones and not able to conflict with infrastructure)
## Lets Get Started

Lets assume that you are using a standard residential [[ISP]] access with the supplied "router" that is an "all in one" device. This is the typical scenario for most people. There are some drawbacks to this environment, but we can augment the basics and overcome the barriers. Your network might look something like this:
 ![[basic residential network map.svg]]
 What we are going to build, will look more like this:
 ![[basic homelab network map.svg]]
Once you understand all of the above, make a plan for what you want to build and achieve.  Write it down - even if it is just a copy of this document. Draw some diagrams and make some lists. Then, continue on to actually building [[The Stack]].

> [!CHECK] NetYeti Knowledge Check
> - Can you explain the difference between a **Primary** and **Alternate** plan for your DNS?
> - Why is documentation the first step in our "Operations Order"?
> - What "stupid question" have you asked yourself today to ensure your lab isn't just a "manageable mess"?

