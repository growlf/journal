---
tags: 
Creation date: 2025-08-18 17:12
Documentation: 
aliases:
---
---
# Local vs Public
There are many reasons to use a split DNS, Sometimes we want to have different things available within our LAN than what we are offering to the public. Or maybe we only have one external IP address but want to offer multiple service on individual addresses.

In this example, the user experience we want from outside is to get a web page from `https://svc1.site.org/` and you can see the basic flow from that direction.

Notice how it differs slightly when comming at it from the LAN side.  Aso, the `svc4` is only visible in the LAN
![[WebFlow.svg]]
### Links
- ...
### TODO
