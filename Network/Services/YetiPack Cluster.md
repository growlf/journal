---
tags:
  - cluster
  - ai
  - ollama
---
# YetiPack Cluster: Distributed Brain
> **Last Sync:** [[2026-04-12]]
> **Total Capacity:** 6 Optimized Nodes (including Local Hub).

> [!NOTE] The Instructor's Perspective
> This is the "Ground Truth" for our distributed AI swarm. Each node is a soldier in the gestalt, contributing its compute to the collective brain.

## Swarm Nodes

| Node Name | IP Address | Role | Hardware |
| :--- | :--- | :--- | :--- |
| **Phoenix** | 127.0.0.1 | Primary Control | Intel i7 iGPU (Arc) |
| **Gemini** | 10.0.1.201 | VRAM Heavy | RTX 3090 Ti |
| **Nuk1** | 10.0.1.252 | Edge Compute | Intel NUC |
| **Lab-1** | 10.0.1.75 | Lab Node | Workstation |
| **Lab-2** | 10.0.1.139 | Lab Node | Workstation |
| **Lab-3** | 10.0.1.30 | Lab Node | Workstation |
| **Lab-4** | 10.0.1.238 | Lab Node | Workstation |
| **Yeti-500** | 10.0.1.194 | Swarm Node | LXC (PVE) |
| **Yeti-501** | 10.0.1.195 | Swarm Node | LXC (PVE) |
| **Yeti-502** | 10.0.1.196 | Swarm Node | LXC (PVE) |
| **Sterling** | 192.168.0.136 | Home LAN | Windows Workstation |

## Mission Status
- [x] Parallel Provisioning Logic
- [x] LAN Model Replication
- [x] Firewall/Snap Hardening
- [x] Action-Tier (Sidecar) Deployment

## Monitoring (Operation Argus)
- **Grafana:** http://10.0.1.194:3000 (Dashboard)
- **Prometheus:** http://10.0.1.194:9090 (Metrics)
- **Node Exporter:** Active on all Swarm nodes (Port 9100).

---
*Related: [[Sparse Page]], [[Sparse Page]]*

