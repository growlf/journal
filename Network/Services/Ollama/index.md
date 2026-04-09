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
We have transitioned to the `ghcr.io/ava-agentone/ollama-intel` image. This community-maintained build replaces the archived `intelanalytics` image and provides superior support for **Meteor Lake** and **Arrow Lake** iGPUs via **Level Zero** and **SYCL**.

### The `docker-compose.yml`
```yaml
services:
  ollama-arc:
    image: ghcr.io/ava-agentone/ollama-intel:latest
    container_name: ollama-arc
    environment:
      - OLLAMA_INTEL_GPU=true
      - OLLAMA_DEBUG=1
      - OLLAMA_KEEP_ALIVE=-1  # Keep models loaded for instant response
    volumes:
      - ./ollama_data:/root/.ollama
      - /home/netyeti/.ssh/id_ed25519_ollama:/root/.ollama/id_ed25519:ro
      - /home/netyeti/.ssh/id_ed25519_ollama.pub:/root/.ollama/id_ed25519.pub:ro
    devices:
      - /dev/dri/card1:/dev/dri/card1
      - /dev/dri/renderD128:/dev/dri/renderD128
    ports:
      - "11434:11434"
    restart: unless-stopped
    shm_size: '16gb'  # Shared memory for Intel iGPUs
    mem_limit: 32g
```

## How to Deploy
1.  **Navigate** to `Network/Services/Ollama/`.
2.  **Pull and Start:**
    ```bash
    docker compose up -d
    ```
3.  **Verify the Handshake:**
    Check the container logs to see if it detects the GPU:
    ```bash
    docker logs ollama-arc | grep -E "GPU|level_zero|SYCL0"
    ```

> [!CAUTION] Common Pitfall: "Archived Image"
    The original `intelanalytics/ipex-llm-inference-cpp-xpu` image was archived on Jan 28, 2026. If you see "404 Not Found" during a pull, you must update your `docker-compose.yml` to use the `ava-agentone` image.

## Knowledge Check
- **Why are we ignoring `intel_gpu_top`?** Because it's an `i915`-focused tool. On Meteor Lake (Xe driver), it's looking for the wrong "speedometer." The engine is running fine, the tool is just "lost."
- **Why `/dev/dri/card1`?** On some Meteor Lake systems, `card0` is the display controller and `card1` (or vice-versa) is the compute engine. Passing both ensures the container finds the right hardware for SYCL acceleration.

---
*Related: [[Knowledge Base/LLM/index]], [[Knowledge Base/Virtualization/Docker/index]]*
