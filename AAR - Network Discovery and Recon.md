---
tags:
  - AAR
  - post-mortem
  - lab-notes
date: 2026-04-07
title: AAR - Network Discovery and Recon
---
# After Action Review: Network Discovery and Recon

> [!INFO] What is an After Action Review (AAR)?
> In the Army, an AAR is a professional discussion of an event, focused on performance standards, that allows participants to discover for themselves what happened, why it happened, and how to sustain strengths and improve on weaknesses. It's a powerful tool for learning.

## 1. What was supposed to happen?
- Establish access to the **Proxmox Hypervisor** at `192.168.42.10`.
- List and identify all active **LXCs** and **VMs**.
- Perform an `nmap` discovery scan to find all alive hosts on the local network.
- Establish an SSH bridge to the **MikroTik Routerboard** at `192.168.42.1`.
- Document all findings in the **Network/Devices/** folder.

## 2. What actually happened?
- **Proxmox Access:** Successfully established via SSH (root). Manager version 8.4.17 confirmed.
- **LXC Discovery:** 15 running, 10 stopped containers identified. Full IP mapping completed for core services.
- **Network Scan:** `nmap` discovery and deep scans identified 22 alive hosts, including previously "Unknown Assets."
- **Asset Identification:**
    - **192.168.42.9** -> Lenovo XClarity Controller (OOB management for the Proxmox host).
    - **192.168.42.11** -> LXC 104 (Homepage Dashboard).
    - **192.168.42.12** -> LXC 118 (LLDAP Auth).
    - **192.168.42.8** -> LXC 103 (Apt-Cacher-NG).
- **MikroTik Access:** Established an SSH bridge as `netyeti`. Router is a **CRS326-24G-2S+** running **RouterOS 7.19.4**.

## 3. Why was there a difference?
- **Initial Confusion:** `192.168.42.9` was initially thought to be a laptop (Compal Information) due to the MAC address, but deep scanning and XCC certificates correctly identified it as the Lenovo OOB management.
- **Missing Node:** `dn2` was found to be missing from the nmap scan despite having a record in the journal.

## 4. Sustains & Improves
- **Sustains:**
    - **Proxmox-based Recon:** Using the hypervisor as a discovery node is a highly effective way to map the network.
    - **LXC Configuration:** Most LXCs are correctly tagged with names that match their roles.
- **Improves:**
    - **Device Records:** Several core services (DNS, Wireguard, Homepage) were undocumented in the `Devices/` folder.
    - **OOB Awareness:** The Lenovo XCC should be a top-level device entry in the journal for hardware management.
    - **Monitoring:** `dn2` needs a signal check; it may have suffered a silent failure.

## 5. Knowledge Transfer (The NetYeti Way)
- **Deep Scanning (nmap -A):** Essential for identifying mysterious MAC addresses that may be OOB controllers or OEM-branded appliances.
- **Hypervisor as a "Command Post":** Always use the Proxmox CLI to verify internal LXC IP configurations when nmap results are ambiguous.
- **MikroTik WinBox Port (8291):** Identifying this port is a fast-track to confirming the presence of a RouterOS device.

---
**Status:** Complete
**Related Tasks:** 
- [x] Update documentation for all identified devices.
- [ ] Investigate `dn2` status on Proxmox (LXC ID 122).
- [ ] Check for old ZFS snapshots (130GB) on `zfs10`.
