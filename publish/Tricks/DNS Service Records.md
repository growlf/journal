---
tags:
  - dns
  - deployment
  - lab
  - networking
Creation date: <% tp.file.creation_date() %>
modification date: <% tp.file.last_modified_date("dddd Do MMMM YYYY HH:mm:ss") %>
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

