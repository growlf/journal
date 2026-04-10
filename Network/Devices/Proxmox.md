---
Active: true
Cores: 16
IP: 10.0.42.10
RAM: 32
Storage: 0.45
Updated: 2026-04-07
model: Lenovo ThinkSystem ST250
networks:
- 10.0.42.0/24
os: Proxmox VE 8.4.17
services:
- Proxmox VE
- ZFS
tags:
- hypervisor
- server
- devices
type: server
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
- Cores: **`=this.Cores`**
- RAM (GB): **`=this.RAM`**
- Storage (TB): **`=this.Storage`**
- networks: **`=this.networks`**
- services: **`=this.services`**
- tags: **`=this.tags`**

The primary hypervisor for the home lab. This "Command Post" runs our critical LXCs and VMs on a Lenovo ThinkSystem ST250.

## Hardware Specs
- **CPU:** 16 Cores
- **RAM:** 32 GB DDR4
- **Storage:** 450 GB ZFS Pool (`zfs10`)

## Running Services (LXCs)
- **Monitoring:** Grafana (100), Prometheus (109)
- **Core:** Home Assistant (110), Technitium DNS (108), Nginx Proxy Manager (105)
- **Infrastructure:** LLDAP (118), Apt-Cacher-NG (103), Wireguard (102)
- **Tally:** 15 Running, 10 Stopped.

## Tasks
- [ ] Check why `netbox` (126) is stopped.
- [ ] Investigate `mail` (116) VM status.
- [ ] Monitor ZFS pool usage (current: 67%).
