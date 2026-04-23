---
Updated: 2026-04-07
tags:
  - sop
  - policy
  - network
  - recon
---
# SOP - Performing a Network Audit and Asset Discovery

> [!NOTE] The Instructor's Perspective
> In the Army, we call this "Mapping the Terrain." You can't secure what you can't see. This SOP defines how to perform a multi-layer reconnaissance of the Home Lab using Proxmox, MikroTik, and Nmap. This is a "Force Multiplier" for identifying "Ghost Devices" and ensuring "Signal Discipline."

## 1. Prerequisites
- SSH Access to the **Proxmox Hypervisor** (192.168.2.10).
- SSH Access to the **Office Router** (192.168.2.1) and **House Router** (192.168.0.1).
- `nmap` installed on the workstation or a discovery node.

## 2. Phase 1: Edge Recon (MikroTik)
Start at the "Front Line." Identify what the router sees on its ports and ARP table.
1. **Interfaces:** Run `/interface print` to see physical link status.
2. **ARP Table:** Run `/ip arp print` to see active IP-to-MAC mappings.
3. **Neighbor Discovery:** Run `/ip neighbor print` to find LLDP/MNDP-capable hardware (Ubiquiti, other MikroTiks).
4. **Firewall Audit:** Run `/ip firewall export` to verify port-forwarding and NAT rules.

## 3. Phase 2: Hypervisor Recon (Proxmox)
Check the "Command Post" for virtualized assets.
1. **LXC/VM List:** Run `pct list` and `qm list`.
2. **IP Mapping:** For internal containers, run:
   `for id in $(pct list | awk '{print $1}' | grep '^[0-9]'); do pct config $id | grep ip=; done`
3. **ZFS Health:** Check for old snapshots taking up space with `zfs list -t snapshot`.

## 4. Phase 3: Active Scanning (Nmap)
Perform a "Signal Sweep" to find anything not reporting to the hypervisor or router.
1. **Host Discovery:** `nmap -sn 192.168.2.0/24` (and other subnets).
2. **Deep Service Scan:** `nmap -A [target_ip]` for unidentified MAC addresses.
   - *Look for:* XCC/IPMI controllers, IoT sensors, and mobile devices.

## 5. Phase 4: Documentation (The NetYeti Way)
- **Archive Offline Devices:** Move any devices not found during the scan to `Internal/Networks/Yeticraft/Devices/Archive/`.
- **Update Active Devices:** Ensure all discovered IPs and services are reflected in the `Internal/Devices/` folder.
- **Sanitize for Public Consumption:** Run the sanitization script to update the public `Network/Devices/` folder:
  `python3 _assets/_scripts/sanitize-network.py`
  - *Note:* This ensures real MACs and internal IPs are scrubbed before publishing.
- **Update the Map:** Verify the physical and logical links in the **[[Sparse Page]]**.

---

## Knowledge Check: Signal Review
- **Why do we use the Hypervisor as a discovery node?** (Answer: It has the "Ground Truth" for internal container IPs that may not respond to external pings).
- **What is the significance of the "bad_ipv4" list in the MikroTik firewall?** (Answer: It drops bogon and non-routable traffic at the RAW table layer, saving CPU cycles).
- **How do you identify a Lenovo XClarity Controller?** (Answer: Look for "IMM3-Main" in the web headers or the "Compal Information" MAC vendor).

---
**Status:** Operational
**Related:** [[Policies/SOP - Secret Management in the Home Lab]], [[Learning/Home-Lab-Series/Default-Stack-Blueprint|The Stack]]
