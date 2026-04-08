---
Updated: 2026-04-07
Active: true
type: service-host
IP: 192.168.42.2
model: Technitium DNS (LXC)
os: Linux
MAC: BC:24:11:1E:B0:28
networks:
  - 192.168.42.0/24
tags:
  - network
  - dns
  - core
  - services
---
# Description
- Last Updated: **`=this.Updated`**
- Active: **`=this.Active`**
- Type:  `=this.type`
- IP: **`=this.IP`**
- model: **`=this.model`**
- os: **`=this.os`**
- networks: **`=this.networks`**
- tags: **`=this.tags`**

The primary DNS and DHCP server for the lab. This is a critical infrastructure component.

## Tasks
- [ ] Verify primary/secondary DNS sync.
- [ ] Document DHCP scope.
