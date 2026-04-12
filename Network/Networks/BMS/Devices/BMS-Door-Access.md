---
title: BMS-Door-Access
tags:
  - bms
  - security
  - mercury
  - access-control
---
# BMS-Door-Access (10.10.1.24)

The physical security hub for the Bellingham Makerspace. This Mercury Security controller manages the RFID badge readers and electronic strikes for the facility.

## Hardware
- **Manufacturer:** Mercury Security (MAC `00:0F:E5`)
- **Integration:** Likely tied to an upstream membership management system.

## Connectivity
- **IP:** `10.10.1.24` (Management LAN)
- **Dependencies:** Requires connectivity to the [[BMS-DNS-01]] for name resolution of the auth server.

---
*Related: [[Network/Networks/BMS/index]], [[Network/Networks/BMS/Services/index]]*
