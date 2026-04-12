---
banner: "![[network_banner.png]]"
tags:
  - bms
  - network
  - makerspace
  - documentation
---
# Bellingham Makerspace (BMS) Network

The **Bellingham Makerspace (BMS)** is a community resource providing access to high-tech tools, classes, and workspace. This document focuses on the internal LAN infrastructure for personal and organizational use.

## Network Architecture
- **CIDR:** `10.10.0.0/16`
- **Gateway:** `10.10.0.1` (Routerboard/Mikrotik)
- **Primary DNS:** `10.10.0.4` (Internal DNS Server)
- **Status:** Active, multi-user environment with public access.

## Strategy (PACE Plan)
- **Primary (P):** Internal 10.10.0.0/16 LAN with fiber backhaul.
- **Alternate (A):** Guest WiFi network (isolated).
- **Contingency (C):** Local cellular hotspot for emergency comms.

## Overview
- [[Network Map|BMS Network Map]]
- [[Devices/index|BMS Devices]]
- [[Services/index|BMS Services]]

## Discovery Notes (April 10, 2026)
- **Mikrotik Infrastructure:** The backbone of the makerspace consists of multiple Routerboard devices (`10.10.0.1`, `10.10.0.2`, `10.10.0.14`).
- **Proxmox Cluster:** A multi-node cluster handles virtualization for the space:
    - `10.10.0.5` (Dell)
    - `10.10.0.7` (HP)
    - `10.10.0.8` (HPE)
    - `10.10.0.13` (ASUS)
- **IoT & Security:** High concentration of Reolink cameras, Ring doorbells, and Mercury security access controllers.
- **Member Access:** Broad DHCP range for members and public users.

---
*Related: [[Network/Networks/index]], [[Network/index]]*
