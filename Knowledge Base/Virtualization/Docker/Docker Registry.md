---
title: Docker Registry - Local Image Cache
tags:
  - docker
  - self-hosted
  - lab-infrastructure
  - networking
management_url: "http://<registry-ip>:5000"
---
# Docker Registry: Local Image Cache

> [!NOTE] The Instructor's Perspective
> In the Army, we had "supply points." A Docker Registry is your supply point for container images. Instead of downloading the same `nginx` or `python` image from Docker Hub every time, you cache it locally. It's faster for your lab and it reduces the load on the public infrastructure.

## Why a Local Registry?
- **Speed:** Pulling images from your local LAN is near-instant compared to downloading from the internet.
- **Bandwidth Discipline:** Reduces your external bandwidth usage, especially when you're deploying multiple stacks.
- **Security:** You can store your own private images securely without making them public.
- **Caching (Pull-Through):** Acts as a transparent proxy for Docker Hub, automatically caching requested images.

## Image Supply Reliability (The PACE Plan)
> [!TIP] Operational Discipline
> **P (Primary):** Local Docker Registry (Docker container with a Registry-UI).
> **A (Alternate):** Direct pull from public registries (Docker Hub, GitHub Container Registry, etc.).
> **C (Contingency):** `docker save` and `docker load` to move images between nodes manually via [[Knowledge Base/Storage/NAS|NAS]].
> **E (Emergency):** Rebuild the images from source (Dockerfile) on each node.

## Standard Operating Procedure (SOP): Setting Up the Supply Point
1. **Deploy:** Use Docker to spin up a Registry container.
2. **Configure Pull-Through Cache:** Set up the registry to proxy Docker Hub.
3. **Add Registry-UI:** Deploy a web-based UI (like `joxit/docker-registry-ui`) to browse your local images.
4. **Configure Clients:** Update your Docker daemon configuration (`daemon.json`) to use your local registry as a mirror.
5. **Verify:** Pull an image and check the registry logs (or UI) to ensure it was cached.

## Check for Understanding
- Why is it helpful to have a Registry-UI? (Hint: Think about "visibility").
- How does a "Pull-Through Cache" save bandwidth for your entire lab?

---
*Related: [[The Stack 1]], [[Knowledge Base/Virtualization/Docker/index]], [[Knowledge Base/Apt Cacher NG]]*
