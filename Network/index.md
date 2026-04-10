---
banner: "![[network_banner.png]]"
tags:
  - networks
  - infrastructure
  - devices
  - hardware
  - services
publish: false
content-start: 281
---
This document folder is intended as a foundational baseline for our network implementation of [[Network/Devices/index.base.md|devices]], [[Network/Services/index.base.md|services]], and [[Network/Networks/index|networks]] at Bellingham Makerspace - where multiple users, [[Network/People/index.base.md|volunteers]], and public have access to/from the internet is expected to exist for business-like purposes.  We already have a static IP for external access from the internet.

This basic design is also applicable for [[Home Lab 101|HomeLab]] scenarios and for personal and community learning purposes.  A strong bias towards Opensource software is expressed where possible to allow inexpensive and professional implementation for personal and non-profit usage.  All of this is implemented with interns via the [[Mentor-based Internship]] program from Cascade STEAM.
## Overview
Use [[Network/Devices/index.base.md|Devices]], [[Network/Services/index.base.md|Services]], and [[Network/Networks/index]] to easily access and update information.

> [!NOTE] Document EVERYTHING!!
We will use [[Knowledge Base/Development/Obsidian/index|Obsidian]] for this.  You might want to do so as well.  It is a very easy to use note taking application and can be extended to the universe and **beyond!** (We will also cover this application and it's capabilities in more depth in other documents and sessions)
### General Design Concepts
- Firewall should be default-drop-all for all outside access and intentionally modified (with versioning control) to allow specific services through. External logging to a monitoring/alerting solution such as Grafana is an absolute must. Internal rules can be more open.
- Basic network design should include provision for separation between network environments. For example the WiFi access should be entirely isolated from the infrastructure services. The infrastructure services should be accessed through a proxy and only directly available from within their own physically isolated network. A shared physical layer with multiple routed traffic is not enough.
- Caching should be used to minimize system updates impact on bandwidth.
- Internal DNS (split DNS) should be available to the LANs and set as default in the DHCP settings to allow easier access to systems that will not be available to the Internet directly (i.e. the many DHCP addressed systems, which should be in specific zones and not able to conflict with infrastructure)
