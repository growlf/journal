# April 3, 2026 - The SYCL Breakthrough: Taming the Arc for Local LLMs

Finally cracked the code on my Intel Arc performance issues! For weeks, I've been wrestling with "Out of Memory" errors and sluggish 5-8 t/s generation speeds. I thought 32GB of RAM was enough, but my local stack was acting like a memory black hole.

## The "Aha!" Moment
I realized that while Ollama is great, its default Vulkan/OpenCL implementation on Intel Arc was being incredibly "noisy" in the logs and inefficient with VRAM. It was spilling over into System RAM and Swap, causing the whole OS to chug.

The solution? **SYCL.** 

I decided to stop relying on generic builds and went deep into the Intel oneAPI rabbit hole. By installing the `intel-oneapi-compiler-dpcpp-cpp` and the `MKL/dnnl` libraries, I was able to rebuild `llama.cpp` from source specifically for the Arc's architecture.

## The Results are Insane
- **Memory Footprint:** My Qwen 2.5 Coder 7B model dropped from a bloated 30GB (System + Swap) down to just **~5GB of dedicated VRAM**.
- **Speed:** I'm no longer hitting that 5.8 t/s ceiling. By offloading 100% of the layers to the GPU via SYCL, the responsiveness in VS Code and Aider is night and day.
- **Stability:** No more OOM kills. The system feels "snappy" even when a model is loaded.

## The New Setup
I've retired the standard Ollama service for now. In its place, I've built a custom management layer:
1.  **SYCL-Powered llama-server:** A dedicated systemd service that handles the heavy lifting.
2.  **Toggle Script:** I can now flip between "OpenClaw Mode" for agentic work and "Shell Mode" for quick CLI assistance without manual PID hunting.

I've documented the full technical setup and how to use these new triggers in the [[Arc-GPU-Optimization-Guide]].

Onward to more coding, less waiting! 🚀
