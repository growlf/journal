---
tags:
  - dns
  - deployment
  - lab
  - networking
Creation date: 2025-09-11 00:43
modification date: Thursday 11th September 2025 00:43:04
Documentation: 
aliases:
---
---

Set up service records for common services and applications in your network - including printers.

A common example would be adding a service pointer for your local `apt-cacher-ng` like so:
```dns
_apt_proxy._tcp.@  IN SRV 0 0 3142 apt-cacher-ng.@
```
### Links
- [What is a DNS SRV Record?](https://www.cloudflare.com/learning/dns/dns-records/dns-srv-record/)

