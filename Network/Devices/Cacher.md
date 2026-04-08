---
Updated: 2026-04-07
Active: true
type: service-host
IP: 192.168.42.8
model: Apt-Cacher-NG (LXC 103)
os: Debian
MAC: BC:24:11:36:31:5F
networks:
  - 192.168.42.0/24
tags:
  - service
  - cacher
  - devices
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

LXC hosting the Apt-Cacher-NG service to speed up updates for other Linux nodes.

## Tasks
- [ ] Check disk space for the cache directory.
