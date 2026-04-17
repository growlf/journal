---
tags:
  - cluster
  - ai
  - ollama
---
# YetiPack Cluster Configuration

> [!NOTE] The Instructor's Perspective
> This is the "Ground Truth" for our distributed AI swarm. Each node is a soldier in the gestalt, contributing its compute to the collective brain.

## Swarm Nodes

| Node Name | IP Address | Role | Hardware |
| :--- | :--- | :--- | :--- |
| **Phoenix** | 127.0.0.1 | Primary Control | Intel i7 iGPU (Arc) |
| **Gemini** | 10.10.0.201 | VRAM Heavy | RTX 3090 Ti |
| **Nuk1** | 10.10.1.252 | Edge Compute | Intel NUC |
| **Lab-1** | 10.10.1.75 | Lab Node | Workstation |
| **Lab-2** | 10.10.1.139 | Lab Node | Workstation |
| **Lab-3** | 10.10.1.30 | Lab Node | Workstation |
| **Lab-4** | 10.10.1.238 | Lab Node | Workstation |
| **Sterling** | 192.168.88.136 | Home LAN | Windows Workstation |

---
*Related: [[Network/Services/Ollama|Ollama Service]], [[Internal/AAR - BMS Ollama Swarm]]*
