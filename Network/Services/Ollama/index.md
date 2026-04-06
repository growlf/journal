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
We are using the `intelanalytics/ipex-llm-inference-cpp-xpu` image. This is Intel's optimized build of `llama.cpp` and `Ollama` that speaks the **Level Zero** protocol natively to your **Xe Driver**.

### The `docker-compose.yml`
```yaml
services:
  ollama-arc:
    image: intelanalytics/ipex-llm-inference-cpp-xpu:latest
    container_name: ollama-arc
    environment:
      - DEVICE=Arc
      - OLLAMA_INTEL_GPU=true
      - ONEAPI_DEVICE_SELECTOR=level_zero:0
      - ZES_ENABLE_SYSMAN=1
      - OLLAMA_KEEP_ALIVE=30m
    volumes:
      - /home/netyeti/.ollama:/root/.ollama
      - /home/netyeti/.ssh/id_ed25519_ollama:/root/.ollama/id_ed25519:ro
      - /home/netyeti/.ssh/id_ed25519_ollama.pub:/root/.ollama/id_ed25519.pub:ro
    devices:
      - /dev/dri:/dev/dri
    ports:
      - "11434:11434"
    restart: always
    shm_size: '16gb'  # Shared memory for Intel iGPUs
```

## How to Deploy
1.  **Navigate** to the directory where you've saved the `docker-compose.yml`.
2.  **Pull and Start:**
    ```bash
    docker compose up -d
    ```
3.  **Verify the Handshake:**
    Check the container logs to see if it detects the GPU:
    ```bash
    docker logs ollama-arc | grep -E "GPU|level_zero"
    ```

> [!CAUTION] Common Pitfall: "No Device Found"
> If the container starts but doesn't see the GPU, it's almost always a permission issue with `/dev/dri`. Ensure your user is in the `render` group on the host:
> `sudo usermod -aG render $USER`
> (Requires a new shell/session to apply!)

## Knowledge Check
- **Why are we ignoring `intel_gpu_top`?** Because it's an `i915`-focused tool. On Meteor Lake (Xe driver), it's looking for the wrong "speedometer." The engine is running fine, the tool is just "lost."
- **Why 16GB `shm_size`?** Meteor Lake iGPUs use system RAM as VRAM. By giving the container 16GB of shared memory, we're ensuring it has enough "breathing room" for larger models (like Qwen 2.5 Coder 7B).

---
*Related: [[Knowledge Base/LLM/index]], [[Knowledge Base/Virtualization/Docker/index]]*
