---
title: Ollama - Containerized Arc/Meteor Lake Setup
tags:
  - llm
  - docker
  - intel
  - gpu
  - arc
---

# Ollama on Intel Arc (Meteor Lake) via Docker

Garth, this is the "NetYeti" way to fix those "retries." We're using the **Primary (P)** layer of your PACE plan—a containerized approach that bypasses the "manageable mess" of manual SYCL builds.

## The Strategy
We have transitioned to a **Unified AI Service**. This setup uses a `systemd` service to manage the `ghcr.io/ava-agentone/ollama-intel` Docker container. This gives us the reliability of a system service with the performance of an Intel Arc optimized container.

### The Working `docker-compose.yml`
```yaml
services:
  ollama-arc:
    image: ghcr.io/ava-agentone/ollama-intel:latest
    container_name: ollama-arc
    environment:
      - OLLAMA_HOST=0.0.0.0
      - OLLAMA_INTEL_GPU=true
      - OLLAMA_DEBUG=1
      - OLLAMA_KEEP_ALIVE=-1
    volumes:
      - /home/netyeti/.ollama:/root/.ollama
    devices:
      - /dev/dri/card1:/dev/dri/card1
      - /dev/dri/renderD128:/dev/dri/renderD128
    ports:
      - "11434:11434"
    restart: unless-stopped
    shm_size: '16gb'
```

> [!TIP] The "Card Mapping" Lesson (April 10, 2026)
> On some Meteor Lake systems (like the NUC 14 Pro), the iGPU compute engine is mapped to `/dev/dri/card1` instead of `card0`. If your container fails to start with a "device not found" error, run `ls -l /dev/dri` and update your mapping to match the actual hardware nodes.

## How to Manage (The New Standard)
- **Start:** `sudo systemctl start ollama`
- **Stop:** `sudo systemctl stop ollama`
- **Status:** `sudo systemctl status ollama`

> [!CAUTION] The "KeyError: ContainerConfig" Pitfall
> If you see a `KeyError: 'ContainerConfig'` when starting the service, it's likely because the system is trying to use an old version of `docker-compose` (v1). Ensure your service is calling the modern `docker compose` (v2) command.

> [!CAUTION] Common Pitfall: "Archived Image"
    The original `intelanalytics/ipex-llm-inference-cpp-xpu` image was archived on Jan 28, 2026. If you see "404 Not Found" during a pull, you must update your `docker-compose.yml` to use the `ava-agentone` image.

## Knowledge Check
- **Why are we ignoring `intel_gpu_top`?** Because it's an `i915`-focused tool. On Meteor Lake (Xe driver), it's looking for the wrong "speedometer." The engine is running fine, the tool is just "lost."
- **Why `/dev/dri/card1`?** On some Meteor Lake systems, `card0` is the display controller and `card1` (or vice-versa) is the compute engine. Passing both ensures the container finds the right hardware for SYCL acceleration.

---
*Related: [[Knowledge Base/LLM/index]], [[Knowledge Base/Virtualization/Docker/index]]*
