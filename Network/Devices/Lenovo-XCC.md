---
Active: true
IP: 10.0.42.9
Updated: 2026-04-07
model: Lenovo XClarity Controller (XCC)
networks:
- 10.0.42.0/24
os: IMM3-Main
tags:
- server
- management
- oob
- devices
type: server-management
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

Out-of-Band (OOB) management controller for the primary Proxmox host (Lenovo ThinkSystem ST250).

## Tasks
- [ ] Confirm web UI access credentials.
- [ ] Verify if IPMI/SNMP is enabled for monitoring.
