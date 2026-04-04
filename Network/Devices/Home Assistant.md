---
Active: true
services:
type: LXC
IP: 10.10.49
model: Home Assistant
os: debian
RAM (GB): "2"
Cores: 2
tags:
  - devices
Updated:
RAM: 2
Storage: 16
networks:
owner:
---
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
## Tasks
- [ ] Complete the information fields for this device
