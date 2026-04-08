---
Updated: 2026-04-07
Active: true
type: switch-router
IP: 10.0.1.1
model: Core Router (Concept)
os: RouterOS
networks:
  - 10.0.1.0/24 (Office Subnet)
  - X.X.X.X/29 (Static Public Block)
tags:
  - network
  - devices
  - core
---
# Description
**Concept Page:** Primary Core Router for the network. This node handles the perimeter firewall, NAT for the static public block, and routing between the local subnets.

## Architectural Role
- **Gateway:** Entry point from the ISP Fiber modem.
- **Segmentation:** Separates the Office production network from the Residence network.
- **Hardening:** Uses RAW table rules to drop invalid/bogon traffic early in the packet flow.

## Public Tasks
- [ ] Implement VLAN segmentation for IoT devices.
- [ ] Audit firewall rules for the DMZ.
