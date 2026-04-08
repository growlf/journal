---
Updated: 2026-04-07
Active: true
type: wireless-router
IP: 10.0.2.1
model: House Router (Concept)
os: RouterOS
networks:
  - 10.0.2.0/24 (Residence Subnet)
  - 10.0.1.x (Uplink to Office)
tags:
  - network
  - devices
  - house
  - wifi
---
# Description
**Concept Page:** Secondary router providing WiFi 6 for the residence. It acts as a downstream gateway from the Office core.

## Architectural Role
- **WiFi Gateway:** Manages the residence DHCP pool and mobile device access.
- **Uplink:** Connects via physical Ethernet to the Core Office router.
- **Isolation:** Provides a buffer between home IoT devices and critical office infrastructure.
