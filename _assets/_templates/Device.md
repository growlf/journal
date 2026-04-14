---
Updated: {{date}}
Active: true
type: 
assignment: dhcp
IP: 
MAC: 
vendor: 
model: 
os: 
Cores: 
RAM: 
Storage: 
ports: []
networks:
  - 
vmid: 
host_node: 
ssh_alias: 
mgmt_url: 
tags:
  - devices
---
# Device: {{title}}

> [!NOTE] The Instructor's Perspective
> {{summary_of_functional_role}}

## 📟 Hardware & OS
- **Manufacturer:** `=this.vendor`
- **Model:** **`=this.model`**
- **OS/Firmware:** **`=this.os`**
- **Compute:** `=this.Cores` Cores | `=this.RAM` GB RAM
- **Storage:** `=this.Storage`

## 📡 Network Signal
- **Primary IP:** **`=this.IP`**
- **MAC Address:** `=this.MAC`
- **Management URL:** [Dashboard](`=this.mgmt_url`)
- **SSH Alias:** `ssh `=this.ssh_alias`
- **Open Ports:** `=this.ports`

## 🏰 Cluster Context
- **Proxmox ID:** `=this.vmid`
- **Host Node:** [[`=this.host_node`]]
- **Backups:** [ ] Configured?

---
## 📝 Tactical Notes
- Identified during automated recon.
- [ ] Verify functional role and update `type`.
- [ ] Confirm monitoring signal in Grafana.

---
**Status:** Operational
**Related:** [[Internal/Networks/BMS/index]], [[Internal/Launch Page]]
