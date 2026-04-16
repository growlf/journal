---
Active: true
Cores: 2
IP: 10.0.42.178
RAM: 2
RAM (GB): '2'
Storage: 16
Updated: 2026-04-07
model: Home Assistant (LXC 110)
networks:
- 10.0.42.0/24
os: debian
owner: NetYeti
services:
- Home Assistant
tags:
- automation
- smart-home
- devices
type: service-host
---
# Sanitized View
> [!NOTE] Public Version
> This is a sanitized version of the internal documentation for community and learning purposes.

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
- Cores: **`=this.Cores`**
- RAM (GB): **`=this.RAM`**
- Storage (TB): **`=this.Storage`**
- networks: **`=this.networks`**
- services: **`=this.services`**
- tags: **`=this.tags`**
- owner: **`=this.owner`**

The "Digital Brain" of the residence. This LXC manages all home automation and IoT integration.
