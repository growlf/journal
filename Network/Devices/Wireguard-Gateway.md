---
Updated: 2026-04-07
Active: true
type: service-host
IP: 192.168.42.3
model: Wireguard (LXC)
os: Linux
MAC: BC:24:11:6D:28:F0
networks:
  - 192.168.42.0/24
tags:
  - network
  - security
  - vpn
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

The primary VPN gateway for remote access to the home lab.

## Tasks
- [ ] Document peer configuration policy.
- [ ] Review access logs regularly.
