---
tags:
  - AAR
  - lab-notes
  - recon
date: 2026-04-07
title: AAR - Network Discovery (Concept)
---
# After Action Review: Network Discovery (Concept)

> [!INFO] Instructional Context
> This AAR documents the methodology used to map a dual-network lab environment. Specific identifiers (IPs/MACs) have been sanitized for public documentation.

## 1. Objectives
- Establish access to the **Hypervisor** and list virtual workloads.
- Perform host discovery on both the **Office Core** and **Residence** subnets.
- Audit the **Edge Router** for physical links and firewall rules.
- Consolidate all findings into a centralized device directory.

## 2. Methodology
- **Hypervisor Recon:** Used the `pct list` and `qm list` commands to identify internal signals that don't respond to external pings.
- **Edge Recon:** Exported the router configuration to map physical ports to device roles (e.g., Ether3 to Hypervisor).
- **Subnet Mapping:** Used `nmap -sn` for host discovery across the 10.0.1.0/24 and 10.0.2.0/24 ranges.
- **Visual Command:** Generated an Excalidraw-based map to show logical subnets and physical Ethernet uplinks.

## 3. Findings
- **Segmentation:** Confirmed physical separation between office infrastructure and residence WiFi.
- **Signal Discovery:** Identified a previously undocumented hardware controller (OOB management) using deep service scanning (`nmap -A`).
- **Archive Management:** Decommissioned three "Ghost Devices" that were no longer found on the wire.

## 4. Sustains & Improves
- **Sustain:** Using the hypervisor as a "Forward Observation Post" is highly effective for mapping internal containers.
- **Improve:** The visual map needs a "Public Versioning" workflow to ensure security during Quartz publication.

---
**Status:** Complete (Sanitized)
**Related:** [[Network/Network Map]], [[Policies/SOP - Performing a Network Audit and Asset Discovery]]
