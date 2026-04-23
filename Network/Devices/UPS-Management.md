---

Active: true
IP: 10.0.2.159
Updated: 2026-04-07
model: Alpha Technologies Device
networks:
- 10.0.2.0/24
os: Proprietary
tags:
- power
- ups
- devices
type: power
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

Power management device from Alpha Technologies. Likely a UPS or PDU.

## Tasks
- [ ] Confirm device model.
- [ ] Integrate with Monitoring (Prometheus/Grafana).
