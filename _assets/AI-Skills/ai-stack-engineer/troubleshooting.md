# AI Stack Purge Log - April 5, 2026

## Items Purged during Phase 3 "Scorched Earth"
- **Services:** `ollama.service` (disabled/stopped), `llama-serve.service` (disabled/stopped).
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
Proceed to **Phase 4: Clean Slate & Intel Arc Validation**.
