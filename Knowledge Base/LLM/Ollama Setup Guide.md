---
title: SOP - Ollama Setup Guide (Intel Arc Edition)
tags:
  - sop
  - ai
  - llm
  - intel-arc
  - sycl
  - docker
---
# SOP: Ollama Setup Guide (Intel Arc & Meteor Lake)

> [!NOTE] The Instructor's Perspective
> Setting up AI on non-NVIDIA hardware has traditionally been a "manageable mess." On the i9 Ultra (Meteor Lake), we have the "blind metrics" challenge—where standard tools can't see the newer **Xe Driver**. This guide gives you the PACE plan to win on this silicon.

## Objective
To deploy a high-performance Ollama instance with 100% Intel Arc GPU offloading.

---

## The PACE Plan for Intel Arc Deployment

### **Primary (P): Containerized SYCL (IPEX-LLM / ava-agentone)**
This is the recommended approach. It packages the oneAPI/Level Zero drivers into a stable Docker container, bypassing local dependency hell.
- **Implementation:** [[Sparse Page]]
- **Pros:** 100% GPU offload, zero-maintenance SYCL libraries, reproducible.
- **Cons:** Slightly larger disk footprint (Docker image).
- **Note (April 8, 2026):** We've transitioned to the `ava-agentone/ollama-intel` image as the official `intelanalytics` image has been archived.

### **Alternate (A): Manual SYCL Build (llama.cpp)**
Use this if you need to run "close to the metal" or if you are developing custom C++ integrations.
- **Pros:** Maximum control, no Docker overhead.
- **Cons:** High maintenance (manual toolkit updates), prone to OOM kills if not tuned perfectly.

---

## Phase 1: Driver & oneAPI Verification
Before starting any deployment, ensure the host OS recognizes the Meteor Lake hardware.

```bash
# Check for the Xe driver
lspci -nnk | grep -A 3 VGA
# Output should show: 'Kernel driver in use: xe'

# Verify device nodes exist
ls -l /dev/dri
# Output must show: card0 and renderD128
```

> [!CAUTION] The "Blind Metrics" Pitfall
> On Meteor Lake, legacy tools like `intel_gpu_top` (from `intel-gpu-tools`) may fail to show usage because they expect the `i915` driver. Do not be alarmed if the tool reports "No device found." If `/dev/dri` nodes exist, the engine is running!

---

## Phase 2: Implementation (Select your Path)

### **Path P (Docker)**
Follow the instructions in the [[Sparse Page]] page to deploy via Docker Compose. Alternatively, use the `toggle-ai.sh` script (located in `_assets/_assets/_scripts/`) for rapid deployment and status checks:

```bash
# Start the AI stack
toggle-ai.sh start

# Check status and GPU offload
toggle-ai.sh status
```

### **Path A (Manual)**
1. **Toolkit:** Install Intel oneAPI Base Toolkit.
2. **Build:**
   ```bash
   git clone https://github.com/ggerganov/llama.cpp
   cmake .. -DGGML_SYCL=ON -DCMAKE_C_COMPILER=icx -DCMAKE_CXX_COMPILER=icpx
   make -j$(nproc)
   ```

---

## Phase 3: Client Integration (The "Force Multiplier")
Regardless of which path you choose, your local tools need to connect to the Ollama endpoint.

**aichat configuration (`~/.config/aichat/config.yaml`):**
```yaml
clients:
  - type: openai-compatible
    name: ollama
    api_base: http://localhost:11434/v1
    api_key: "ollama"
```

---

## After Action Review (AAR)
- **What worked?** Containerization solved the library version conflicts and provided immediate SYCL acceleration.
- **Data Persistence:** We've moved the Ollama models and keys out of the temporary "manageable mess" of the journal directory and into standard home directory locations (`~/.ollama/models` and `~/.ssh`).
- **The Teachable Moment (April 5, 2026):** We hit a **Common Pitfall** where the `docker-compose.yml` was mounting `/root/.ollama` to a non-existent folder (`ollama_data`) instead of the host's actual data folder (`~/.ollama`). This caused "500 errors" and "mkdir" failures inside the container. 
    - **Lesson:** Always verify your **Bind Mounts**. If the host path doesn't exist, Docker will sometimes create it as an empty directory with root permissions, "clogging" your supply line. By aligning the volume mapping, we got our **Primary (P)** AI layer back on the line!

*Related: [[Sparse Page]], [[Knowledge Base/LLM/index|AI Command Center]]*
