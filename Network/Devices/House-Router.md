---
Active: true
IP: 10.0.88.1
Updated: 2026-04-07
model: MikroTik hAP ax^3
networks:
- 10.0.88.0/24 (Home WiFi)
- 10.0.42.104/24 (Uplink to Office)
os: RouterOS 7.19.4
tags:
- network
- devices
- house
- wifi
type: wireless-router
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

Primary Router for the residence, providing high-speed WiFi 6 via the hAP ax^3 hardware. It acts as a gateway for the residence while linking back to the Office infrastructure.

## Hardware Specs
- **CPU:** 4-core ARM64 @ 1.3GHz
- **RAM:** 1 GB
- **WiFi:** WiFi 6 (ax)

## Discovered Assets (DHCP Leases)
- **Workstations:** [[Network/Devices/Pheonix|Phoenix]] (10.0.88.200), [[Network/Devices/Changeling|Changeling]] (10.0.88.147), [[Network/Devices/Sterling|Sterling]] (10.0.88.136).
- **IoT:** 8x ESP Home/Sensors, 4x Wyze Bulbs, 3x Google Home Minis.
- **Appliances:** LG Smart Fridge, LG webOS TV, Solar Envoy.
- **Mobile:** Lisa's S24 Ultra.

## Tasks
- [x] Extract DHCP leases and hardware model.
- [ ] Push SSH keys for passwordless access (use Garl1yc password once).
- [ ] Document firewall/isolation rules between House and Office.
