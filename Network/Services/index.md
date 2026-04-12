---
title: Network Services
tags:
  - index
---
# Network Services

> In the Army, we call these "Essential Services." If they go down, the mission is in jeopardy.

This is the index of services running in the home lab.

## Service Catalog
- [[Network/Services/CouchDB/index.md|CouchDB]]: Database for Obsidian LiveSync.
- [[Knowledge Base/Services/Monitoring/Grafana.md|Grafana]]: Visualization and analytics platform.
- [[Network/Services/NetBox.md|NetBox]]: IP Address Management (IPAM) and DCIM.
- [[Network/Services/Ollama/index.md|Ollama]]: Local-First AI with Intel Arc acceleration.
- [[Network/Services/Open-WebUI/index.md|Open WebUI]]: Multi-model frontend for Ollama and OpenAI.
- [[Network/Services/NFS.md|NFS]]: Network File System for shared storage.
- [[Knowledge Base/Services/Monitoring/NtopNG.md|NtopNG]]: High-speed web-based traffic analysis.
- [[Knowledge Base/Storage/Openmediavault.md|Openmediavault]]: Next-generation network attached storage.
- [[Knowledge Base/Virtualization/Docker/Portainer.md|Portainer]]: GUI for managing Docker and Swarm.
- [[Network/Services/Proxmox/index.md|Proxmox]]: Virtualization platform management.
- [[Network/Services/Proxmox/Proxmox Backup Server.md|Proxmox Backup Server]]: Backup solution for VMs and containers.
- [[Network/Services/Backup/Ventoy Backup Script|Ventoy Backup Script]]: Portable rsync-based snapshot tool.
- [[Network/Services/Proxmox/Proxmox Community Scripts.md|Proxmox Community Scripts]]: Automation scripts for Proxmox.
- [[Network/Services/ReoLink.md|ReoLink]]: Security camera integration.

## Knowledge Check
- [ ] Are all services being monitored?
- [ ] Do we have a PACE plan for each critical service?

## Common Pitfalls
- **Single Point of Failure**: Ensure critical services are not all running on the same physical host without a backup plan.
- **Port Conflicts**: Keep an eye on your port assignments in [[Network/The Stack.md|The Stack]].
