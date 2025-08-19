---
tags: 
Creation date: 2025-08-18 17:12
Documentation: 
aliases:
---
---
# Local vs Public
There are many reasons to use a split DNS. Sometimes we want to have different things available within our LAN than what we are offering to the public. Or maybe we only have one external IP address but want to offer multiple services on individual domain addresses.

In the example below, the user experience we see from outside is getting a web page from `https://svc1.site.org/` and you can see the basic flow from that direction.  Pretty standard.

Notice how it differs slightly when coming at it from the LAN side.  Also, the `svc4` is only visible in the LAN, and that any special ports from other service are not necessarily available outside the LAN either.
![[WebFlow.svg]]
### Links
- ...
### TODO
