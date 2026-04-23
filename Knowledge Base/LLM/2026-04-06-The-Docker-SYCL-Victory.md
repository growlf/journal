# April 6, 2026 - The Docker SYCL Victory: Taming the i9 Ultra

I have finally achieved the "Gold Standard" for my local AI stack. After the manual SYCL breakthroughs on April 3rd, I realized that maintaining the source builds and the manual oneAPI environment was a "manageable mess" that was quickly becoming unmanageable.

## The Final Solution: Containerized SYCL (IPEX-LLM)
We have transitioned the **Primary (P)** layer of the PACE plan from a manual source build to a high-performance Docker container.

### Why this is the "Victory":
1.  **Isolation:** All the finicky Intel Level Zero and oneAPI libraries are packaged into a single, stable image (`intelanalytics/ipex-llm-inference-cpp-xpu`).
2.  **100% GPU Offload:** Verified. My Qwen 2.5 Coder 7B model now runs with every single layer offloaded to the Intel Arc iGPU.
3.  **No More "Blind Metrics":** While `intel_gpu_top` is still "blind" to the new Xe driver's activity, the Docker container's logs and the instant response times confirm the hardware is being used.
4.  **Stability:** Memory footprint is a rock-solid ~5GB VRAM (UMA), leaving the rest of my 32GB RAM free for VS Code and other tools. No more OOM kills.

### Technical Reasoning (The AAR):
- **Xe Driver vs. i915:** Meteor Lake (MTL) uses the `xe` kernel driver. Traditional Intel tools expect `i915` and report "No device found," which led to initial confusion.
- **Unified Memory (UMA):** By setting the Docker `shm_size` to 16GB, we've given the Arc iGPU the room it needs to breathe.
- **Port Discipline:** I've disabled the host-level `ollama` service to free up Port 11434 for the optimized Docker container.

## The Updated Stack
- **Endpoint:** `http://localhost:11434`
- **Docker Compose:** Located in `Internal/Networks/Yeticraft/Services/Ollama/docker-compose.yml`.
- **Primary Model:** `qwen2.5:7b` (High performance, perfect for coding).

## Knowledge Check & Future SOP:
- **Updating:** Just `docker pull` the image. No more `make -j$(nproc)`!
- **Monitoring:** Trust the container logs (`docker logs ollama-arc`) over host-level tools until `intel-gpu-tools` catches up with the Xe driver.

Onward to more coding, less waiting! 🚀

---
*Related: [[Sparse Page]], [[Knowledge Base/LLM/Ollama Setup Guide|Ollama Setup Guide]]*
