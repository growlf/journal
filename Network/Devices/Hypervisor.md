---
Updated: 2026-04-07
Active: true
type: hypervisor
IP: 10.0.1.10
model: Primary Hypervisor (Concept)
os: Proxmox VE
Cores: 16
RAM: 32
Storage: 0.5 TB ZFS
networks:
  - 10.0.1.0/24
tags:
  - hypervisor
  - server
  - devices
---
# Description
**Concept Page:** The primary virtualization host for the lab. This node runs critical infrastructure services as LXC containers and VMs.

## Architectural Role
- **Compute:** 16 Cores for running Docker nodes and local LLMs.
- **Storage:** ZFS-backed pool for container disk performance and snapshotting.
- **Orchestration:** Managed via the OpenClaw C2 layer for automated deployments.

## Running Workloads (Concept)
- **Monitoring Stack:** Grafana / Prometheus
- **Core Services:** DNS, VPN, Reverse Proxy
- **Lab Apps:** CouchDB, LLDAP, Home Assistant
