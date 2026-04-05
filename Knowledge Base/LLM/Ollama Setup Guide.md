---
title: SOP - Ollama Setup Guide (SYCL Edition)
tags:
  - sop
  - ai
  - llm
  - intel-arc
  - sycl
---
# SOP: Ollama & llama.cpp Setup Guide (Intel Arc SYCL Edition)

> [!NOTE] The Instructor's Perspective
> Setting up AI on non-NVIDIA hardware has traditionally been a "manageable mess." This guide cuts through the noise. We are moving away from the default Vulkan backend and embracing **SYCL** for Intel Arc GPUs. It's more efficient, faster, and keeps our VRAM footprint lean.

## Objective
To install and configure a high-performance local LLM stack using `llama.cpp` with SYCL offloading on Intel Core Ultra (Arc) hardware.

## Prerequisites
- **OS:** Ubuntu 24.04 LTS (recommended)
- **Hardware:** Intel Core Ultra (Meteor Lake) or Discrete Arc GPU
- **Drivers:** Intel Compute Runtime and Level Zero drivers installed (`intel-level-zero-gpu`)
- **Toolkit:** Intel oneAPI Base Toolkit (specifically `compiler-dpcpp-cpp` and `mkl`)

---

## Phase 1: Driver & oneAPI Verification
Before building, ensure the hardware is ready to speak "SYCL."

```bash
# Check for Level Zero GPU
sycl-ls
# Output should show: [ext_oneapi_level_zero:gpu:0] ... Intel(R) Arc(TM) Graphics

# Verify oneAPI environment variables
source /opt/intel/oneapi/setvars.sh
```

---

## Phase 2: Building llama.cpp from Source
The standard Ollama binary uses Vulkan. For peak performance, we build `llama.cpp` specifically for the Arc.

```bash
git clone https://github.com/ggerganov/llama.cpp
cd llama.cpp
mkdir build && cd build

# Configure with SYCL and Intel compilers
cmake .. -DGGML_SYCL=ON -DCMAKE_C_COMPILER=icx -DCMAKE_CXX_COMPILER=icpx

# Build (using all CPU cores)
make -j$(nproc) llama-server llama-cli
```

---

## Phase 3: Configuration & Service Deployment
We create a user-level systemd service to manage the `llama-server`.

1. **Create the model directory:** `mkdir -p ~/models`
2. **Download a model:** (e.g., Qwen 2.5 Coder 7B GGUF)
3. **Setup the service:** Create `~/.config/systemd/user/llama-serve.service`.

```ini
[Unit]
Description=Llama.cpp SYCL Server
After=network.target

[Service]
Type=simple
Environment="ZES_ENABLE_SYSMAN=1"
ExecStart=/home/netyeti/llama.cpp/build/bin/llama-server -m /home/netyeti/models/qwen2.5-coder-7b.gguf --host 0.0.0.0 --port 8081 --n-gpu-layers 100
Restart=on-failure

[Install]
WantedBy=default.target
```

4. **Enable & Start:**
```bash
systemctl --user daemon-reload
systemctl --user enable --now llama-serve.service
```

---

## Phase 4: Verification (The Benchmark)
Monitor the GPU to ensure layers are actually offloaded.

```bash
sudo intel_gpu_top
# Look for "Render/3D" activity when sending a prompt.
```

> [!CAUTION] Common Pitfall: Vulkan vs. SYCL
> While Ollama's default `OLLAMA_VULKAN=true` is easier to setup, it is significantly less efficient on Intel Arc hardware. It often causes high system memory usage and slower response times. Always prefer the **SYCL** build if you have the oneAPI toolkit available.

---

## Phase 5: Client Integration (Aider & aichat)
Configure your CLI tools to point to your new SYCL server (running on port 8081).

**aichat config snippet:**
```yaml
- type: openai-compatible
  name: llama-gpu
  api_base: http://localhost:8081/v1
  api_key: "local"
```

---

## After Action Review (AAR)
- **What worked?** SYCL provides a massive reduction in VRAM overhead (~30GB -> ~5GB).
- **What didn't?** Generic Vulkan builds are "noisy" and slow.
- **Teachable Moment:** Building from source is worth the effort when hardware-specific optimizations (like SYCL) are available.

*Related: [[Arc-GPU-Optimization-Guide]], [[Knowledge Base/LLM/index|AI Command Center]]*
