---
tags:
  - documentation
  - linux
  - networking
  - glossary
Creation date: Monday April 4th 2022 11:18:30
Documentation:
---
## Definition
So many people ask [Why do I need DNS](https://www.google.com/search?q=why+do+I+need+DNS%3F&oq=why+do+I+need+DNS%3F&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIICAEQABgWGB4yCAgCEAAYFhgeMggIAxAAGBYYHjIICAQQABgWGB4yCAgFEAAYFhgeMggIBhAAGBYYHjIICAcQABgWGB4yCAgIEAAYFhgeMggICRAAGBYYHtIBCDQxMTRqMGo3qAIAsAIA&sourceid=chrome&ie=UTF-8)? It ties your network together, it announces services, facilitates PXEBoot, and soooo much more. ***You need it***. I recommend a split DNS between the internet and your home-lab. In particular, rather than using the built-in DNS of my typical router, I use an [[Tools/LXC|LXC]] running [[Technitium]]. I use this option overthe less-capable [PiHole](https://pi-hole.net/) because of [[DHCP]] integration and many other features (such as DNS failover) - both support [DNS Blackhole](https://en.wikipedia.org/wiki/DNS_sinkhole) lists.