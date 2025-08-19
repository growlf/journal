---
tags: 
Creation date: 2025-08-18 17:12
Documentation: 
aliases:
---
---
# Local vs Public
There are many reasons to use a split DNS. Sometimes we want to have different things available within our LAN than what we are offering to the public. Or maybe we only have one external IP address but want to offer multiple services on individual domain addresses.

In the example below, the user experience we see, from outside, is getting a web page from `https://svc1.site.org/` and you can see the basic flow from that direction.  Pretty standard stuff.
![[WebFlow.svg]]
Notice how it differs slightly when coming at it from the LAN side.  Since DHCP will handout the internal DNS automatically and all statically assigned systems will have it as well, they will all request the address internally and get a `CNAME` record that further translates to three individual addresses.

Those address are the three nodes in the [[Docker]] Swarm that are all running a special kind of network called an `overlay` network. Overly networks are very much like a `vlan` in that you need to offer port access intentionally, otherwise it is like a firewall - denying everything else. The overlay network has one more surprise though - it will route, load balance, and more. In this example it is routing the traffic on port 80 and 442 to the proxy container on `node2`. The proxy container just happens to be on that node at this moment. I might move later, and if it does, it will still have the traffic re-routed to it on the other node - automatically.

The Proxy container has a hash table of FQDN names to addresses with ports defined, and even SSL certificates available to attach and upgrade a request from `http` to `https`. It can use static numeric IP's as targets, and it can also use any containers/service name that are attached to the same network as a host address - i.e. `svc1` is the name of the container and we simply proxy the request to that 'host' and then return the result back down stream.

Also, the service named `svc4` is only visible within the LAN, and that any special ports from other services are not necessarily available outside the LAN either. So, unless you are in the LAN (or VPNed in), you will not see port `2022` since `swarm.site.org` is not offered from the public DNS, noe does the firewall have a hole to allow access from outside.
### Links
- ...
### TODO
