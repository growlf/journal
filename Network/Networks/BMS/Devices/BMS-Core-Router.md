---
title: BMS-Core-Router
tags:
  - bms
  - mikrotik
  - router
  - core
---
# BMS-Core-Router (10.10.0.1)

The main gateway for the Bellingham Makerspace. This device handles Fiber termination, firewalling, and routing between the various makerspace VLANs.

## Specifications
- **Model:** Mikrotik CCR1009-7G-1C-1S+
- **Architecture:** TILE
- **RAM:** 2GB
- **SFP+:** 10Gbps Fiber Uplink

## Configuration (High-Level)
- **Eth1 (WAN):** Fiber Uplink (Static IP)
- **Eth2 (LAN):** 10.10.0.1/16
- **Firewall:** Default-drop configuration with specific exceptions for Door Access and Remote Management.

## Critical Notes
- **Admin Access:** Only accessible via the management VLAN or specific serial console.
- **Backup Plan:** Configuration is automatically backed up weekly to the [[Network/Networks/BMS/Services/index|BMS Backup Server]].

---
*Related: [[Network/Networks/BMS/index]], [[Knowledge Base/Networking/Mikrotik]]*
