---
Updated: 2026-04-07
Active: true
type: switch-router
IP: 192.168.42.1
model: MikroTik CRS326-24G-2S+
os: RouterOS 7.19.4
MAC: 2C:C8:1B:96:0B:0E
networks:
  - 192.168.42.0/24
  - 50.35.236.72/29 (Public Static)
tags:
  - network
  - devices
  - core
  - mikrotik
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

Primary Cloud Router Switch (CRS) for the network. This 24-port Gigabit switch with 2 SFP+ ports acts as the core edge device.

## Port Mapping
- **Ether1:** Gateway (ISP)
- **Ether4-6:** Nexus Cluster (nexus0, nexus1, nexus2)
- **Ether11:** Synology NAS
- **Ether20:** Ubiquiti AP/Switch
- **Ether23:** House Trunk
- **Ether24:** Office WiFi

## Tasks
- [x] Identify hardware model (CRS326-24G-2S+).
- [ ] Document SFP+ usage plans.
- [ ] Verify firewall rules for the public `/29` block.
