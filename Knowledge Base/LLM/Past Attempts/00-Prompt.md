ROLE: Expert Ubuntu systems administrator and LLM performance engineer.

SYSTEM: Intel Core Ultra 9 185H, Intel Arc GPU, Ubuntu 24.04, 32GB RAM.

RULES:
- Read before acting. Check before changing.
- Verify assumptions with commands before drawing conclusions.
- Explain what you find before proposing fixes.
- Ask for confirmation before making changes that affect running services.

---

PHASE 1 — AUDIT (read-only, no changes yet)

1. Check for duplicate/conflicting Ollama instances:
   - systemctl status ollama (system service)
   - systemctl --user status ollama (user service)
   - which ollama && ollama --version
   - ps aux | grep -E "ollama|llama"
   Report: Are there multiple running instances? Which one is the "real" one?

2. Check GPU utilization:
   - intel_gpu_top or xpu-smi (if available)
   - Confirm whether Ollama and ~/llama.cpp are actually hitting the Arc GPU
   - Check /proc or environment for SYCL/Level Zero vs ROCm/OpenCL vs CPU fallback

3. Review installed AI shell tools (Butterfish, Aider, etc.):
   - Locate configs and check which backend/model each uses
   - Note whether they call Ollama via API, invoke llama.cpp directly, or use cloud APIs
   - Check ~/.local/bin/aider-local for its current configuration

4. Check for SYCL build status:
   - Is ~/llama.cpp built with GGML_SYCL=ON?
   - Is intel-basekit installed? (source /opt/intel/oneapi/setvars.sh && icpx --version)
   - What token/s rate does the current build achieve? (run a quick benchmark)

5. Read the Obsidian journal at ~/Obsidian/personalnotes/Projects/Ollama\ Quest
   - Summarize what has already been tried and any known issues

---

PHASE 2 — REPORT

Produce a concise summary with three sections:
  A) What is actually broken or misconfigured
  B) What is working but suboptimal
  C) Recommended fix sequence (ordered by impact)

---

PHASE 3 — FIX (only after I approve Phase 2 report)

Execute approved fixes in this order:
  1. Consolidate to a single system-level Ollama service (remove any user-level duplicates)
  2. If SYCL build is missing or broken: install intel-basekit, rebuild llama.cpp with GGML_SYCL=ON, verify token rate improves to ~15-30 t/s on 8B model
  3. Configure Ollama to use the SYCL-built llama.cpp backend if possible, or set it up to hand off correctly
  4. Fix or reconfigure Butterfish/Aider/other tools to point to the correct backend
  5. Set up the workflow:
       - OpenWebUI (or "OpenClaw" — clarify name) as the primary chat interface, with a clean start/stop script
       - AI-assisted shell fallback (Aider or Butterfish) that works when OpenWebUI is down
       - VS Code / terminal LLM integration (Continue.dev or similar) with local-first + Gemini/Claude offload

---

PHASE 4 — JOURNAL UPDATE

Append a dated entry to ~/Obsidian/personalnotes/Projects/Ollama\ Quest/YYYY-MM-DD-session.md covering:
  - What was audited
  - What was changed and why
  - Current performance benchmarks
  - Known remaining issues