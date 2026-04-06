---
title: Docker
tags:
  - docker
  - orchestration
  - deployment
---
# Docker: The Portable App Container

> [!NOTE] The Instructor's Perspective
> In our labs, we want to be able to move our applications around easily. If an LXC is a "backpack" for a service, then Docker is the standardized "shipping container." It ensures that your application runs the same way, whether it's on your laptop or a production server. It's a key part of our [[Network/The Stack|Stack]].

## Why use it?
- **Portability:** Run the same container anywhere.
- **Isolation:** Each container has its own environment and dependencies.
- **Ecosystem:** Huge library of pre-built images on [Docker Hub](https://hub.docker.com/).
- **Scalability:** Easy to scale services using Docker Swarm or Compose.

## Container Reliability (The PACE Plan)
> [!TIP] Deployment Discipline
> **P (Primary):** Dedicated Docker Swarm Cluster (running on multiple Proxmox nodes).
> **A (Alternate):** Standalone Docker Compose on a single LXC or VM.
> **C (Contingency):** Fresh deployment using an [[Knowledge Base/Ansible/index|Ansible]] playbook and latest backups.
> **E (Emergency):** Run the application as a standard process on any available Linux host.

## Standard Operating Procedure (SOP) Best Practices
1. **Use Compose:** Always use Docker Compose for managing multi-container applications.
2. **Tag Your Images:** Don't just use `latest`. Use specific version tags for consistency.
3. **External Storage:** Store your persistent data on a [[Knowledge Base/NAS|NAS]] or ZFS pool.
4. **Monitoring:** Use [[Knowledge Base/Monitoring|Grafana]] or Portainer to keep an eye on your containers.

## Docker Knowledge Tree
```dataview
TABLE join(sort(rows.file.link), " | ") as Documents
FLATTEN regexreplace(file.folder, ".*/", "") as lastPart
WHERE contains(file.folder, this.file.folder) AND file.name != this.file.name
GROUP BY lastPart as Folder
SORT lastPart
```

## Recent Activity
```dataview
TABLE 
  file.ctime AS "Created", 
  file.mtime AS "Updated"
WHERE (file.cday >= date(today) - dur(7 days) OR file.mday >= date(today) - dur(7 days))
  AND contains(file.folder, this.file.folder) AND file.name != this.file.name
SORT file.mtime DESC
LIMIT 10
```

## Check for Understanding
- What is the main difference between a **Docker Swarm** (Primary) and a **Standalone Compose** (Alternate)?
- Why is it important to tag your Docker images with specific versions?

---
*Related: [[Knowledge Base/LXC]], [[Network/Services/Proxmox/index|Proxmox]], [[Knowledge Base/Apt Cacher NG]]*
