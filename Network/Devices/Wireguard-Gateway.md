---
Active: true
IP: 10.0.42.3
Updated: 2026-04-07
model: Wireguard (LXC)
networks:
- 10.0.42.0/24
os: Linux
tags:
- network
- security
- vpn
- services
type: service-host
---
# Sanitized View
> [!NOTE] Public Version
> This is a sanitized version of the internal documentation for community and learning purposes.

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
