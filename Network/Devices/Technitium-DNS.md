---
Active: true
IP: 10.0.42.2
Updated: 2026-04-07
model: Technitium DNS (LXC)
networks:
- 10.0.42.0/24
os: Linux
tags:
- network
- dns
- core
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

The primary DNS and DHCP server for the lab. This is a critical infrastructure component.

## Tasks
- [ ] Verify primary/secondary DNS sync.
- [ ] Document DHCP scope.
