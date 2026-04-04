# Arc GPU Optimization Guide: Intel SYCL + Local LLM

This guide tracks the optimized local LLM setup for the Intel Core Ultra (Arc Graphics) using SYCL offloading. Reference the [[2026-04-03-Sycl-Discovery|Discovery Log]] for context.

## Components
- **Back-end:** `llama.cpp` built with `GGML_SYCL=ON` and `icpx`.
- **Drivers:** `libze-intel-gpu` (Level Zero) + Intel oneAPI 2025.3.
- **Service:** `llama-serve.service` (User-level systemd).

## Daily Usage Commands

### Switching Workflows
Use the custom `toggle-ai.sh` script to manage memory and services:

```bash
# Start OpenClaw for agentic work
toggle-ai.sh openclaw

# Switch to terminal-only AI (Butterfish / Pi)
toggle-ai.sh shell

# See what's currently active
toggle-ai.sh status

# Shut it all down
toggle-ai.sh stop
```

### High-Performance Aider
Launch Aider with the Arc-optimized backend (bypasses default Ollama):
```bash
aider-local coder   # Launches Qwen 2.5 Coder 7B
aider-local llama   # Launches Llama 3.1 8B
```

## Troubleshooting
- **Memory Stats:** If the logs show warnings about `ext_intel_free_memory`, ensure `export ZES_ENABLE_SYSMAN=1` is set.
- **Service Logs:** `journalctl --user -u llama-serve.service -f`
- **Device Detection:** Run `sycl-ls` to verify the Level Zero GPU is recognized.

## Maintenance
If `llama.cpp` needs to be updated:
1. `cd ~/llama.cpp/build`
2. `source /opt/intel/oneapi/setvars.sh`
3. `cmake .. -DGGML_SYCL=ON -DCMAKE_C_COMPILER=icx -DCMAKE_CXX_COMPILER=icpx`
4. `make -j$(nproc) llama-server llama-cli`
