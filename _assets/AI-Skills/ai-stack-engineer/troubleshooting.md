# AI Stack Purge Log - April 5-8, 2026

## Items Purged/Decommissioned
- **Services:** 
  - `ollama.service` (Host-level): disabled/stopped.
  - `llama-serve.service` (User-level): decommissioned (April 8, 2026).
  - `ollama-warm.service` (User-level): decommissioned (April 8, 2026).
- **Binaries (Ghost Check):**
  - `/usr/local/bin/ollama`
  - `/usr/local/lib/ollama` (Library)
  - `~/.local/bin/aichat`
  - `~/bin/llama-serve`
  - `~/bin/fabai`
  - `~/bin/fabfile-template.py`
- **Configurations:**
  - `~/.config/aichat/` (Removed)
  - `~/models/` (Removed - contained broken symlinks to `/usr/share/ollama/...`)
- **Docker:**
  - `open-webui` (Stopped/Removed)
  - All unused Docker volumes pruned.

## Next Step
Maintain the **Primary (P)** stack via **Port 11434 (Ollama Docker)** and `toggle-ai.sh`.
