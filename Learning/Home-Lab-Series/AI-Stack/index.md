---
title: Learning/Home-Lab-Series/AI-Stack
---
# AI-Stack

A self-hosted AI stack optimised for **Intel Arc iGPU** on Linux, built around Ollama + Open WebUI with automated model routing, system diagnostics tools, and a systemd-managed Docker Compose stack.

Built and documented through real-world homelab experience on Intel Arc hardware.

---

## What's included

| Component | Purpose |
|-----------|---------|
| **Ollama (ava-agentone/ollama-intel)** | LLM inference with Intel Arc iGPU acceleration via OneAPI/SYCL |
| **Open WebUI** | Chat interface with tool calling, pipelines, and terminal access |
| **Pipelines** | Server-side plugin system for model routing and workflow automation |
| **Open Terminal** | Browser-based terminal inside Open WebUI (with sudo support) |
| **Smart Model Router** | Auto-routes queries to the best model based on content |
| **System Diagnostics** | Tool for querying Ollama health, models, and VRAM across multiple machines |

---

## Hardware requirements

| Component | Minimum | Recommended |
|-----------|---------|-------------|
| CPU | Intel Core Ultra (Meteor Lake) | Intel Core Ultra 9 185H |
| RAM | 16 GB | 32 GB |
| GPU | Intel Arc iGPU | Intel Arc iGPU (any Meteor/Arrow Lake) |
| Storage | 50 GB free | 100 GB+ free (models are large) |
| OS | Ubuntu 22.04 | Ubuntu 24.04 |

> **Note:** This stack uses `ghcr.io/ava-agentone/ollama-intel` which replaced the archived `intelanalytics/ipex-llm-inference-cpp-xpu` image (archived January 28, 2026).

---

## Quick start

The source code for this stack is maintained in the **[[growlf/ai-stack]](https://github.com/growlf/ai-stack)** repository. This repository contains the production-ready Docker Compose files, systemd unit definitions, and automation scripts used to deploy the NetYeti AI Lab.

```bash
# 1. Clone the repo
git clone https://github.com/growlf/ai-stack.git
cd ai-stack

# 2. Configure
cp .env.example .env
nano .env   # set your username, paths, and API keys

# 3. Install
chmod +x install.sh scripts/check-arc-gpu.sh
./install.sh

# 4. Open
# http://localhost:3000
```

Then follow **[docs/post-install.md](docs/post-install.md)** for the Open WebUI configuration steps.

---

## Project structure

```
phoenix-ai-stack/
├── install.sh                  # Main installer
├── docker-compose.yml          # Full stack definition
├── .env.example                # All configurable values
├── systemd/
│   └── ai-stack.service        # Systemd unit (auto-start on boot)
├── scripts/
│   └── check-arc-gpu.sh        # GPU pre-flight (detects card0/card1 drift)
├── pipelines/
│   └── smart_model_router.py   # Auto-routes queries to best model
├── tools/
│   └── system_diagnostics.py   # Multi-instance Ollama health + model queries
└── docs/
    ├── post-install.md          # Open WebUI configuration checklist
    ├── model-guide.md           # Model recommendations and routing table
    └── troubleshooting.md       # Common issues and fixes
```

---

## Model stack

| Model | Use case |
|-------|----------|
| `qwen2.5:14b` | Tool calling, diagnostics, sysadmin (default) |
| `qwen2.5-coder:14b` | Scripts, configs, code |
| `deepseek-r1:14b` | Complex reasoning, root cause analysis |
| `gemma3:12b` | Log analysis, summaries, documentation |
| `nomic-embed-text` | Embeddings / RAG |

See **[docs/model-guide.md](docs/model-guide.md)** for details.

---

## Known Intel Arc quirks

- The DRI card node (`/dev/dri/card0` vs `card1`) can drift between reboots on Meteor Lake. The `check-arc-gpu.sh` pre-flight script detects and corrects this automatically.
- Intel iGPU uses shared system RAM — `runner.vram="0 B"` in Ollama logs is expected and normal.
- Use `OLLAMA_KEEP_ALIVE=-1` to keep models resident in memory between requests.
- `renderD128` is the compute node and is stable; only the `cardN` display node drifts.

---

## Multi-machine setup

The System Diagnostics tool supports querying multiple Ollama instances across your LAN. Edit `OLLAMA_INSTANCES` in `tools/system_diagnostics.py`:

```python
OLLAMA_INSTANCES = {
    "local":   "http://ollama-arc:11434",   # this machine
    "remote1": "http://10.0.0.X:11434",     # remote machine on your LAN
}
```

---

## Updating the stack

```bash
cd /path/to/phoenix-ai-stack

# Pull latest images
docker compose pull

# Restart with new images
sudo systemctl restart ai-stack.service
```

---
## Critique
### Strengths of the Configuration
- **Intel Arc Optimization:** You are using the `ava-agentone/ollama-intel` image, which is the current recommended path following the archiving of the official Intel IPEX image.
- **GPU Drift Protection:** The inclusion of `check-arc-gpu.sh` in the `systemd` unit's `ExecStartPre` is a proactive way to handle the known issue where Arc iGPU card nodes (e.g., `card0` vs `card1`) can change after a reboot.
- **Intelligent Routing:** Your `Smart Model Router` pipeline efficiently matches specific tasks to the best-suited 14b models (e.g., `qwen2.5-coder` for scripts, `deepseek-r1` for reasoning) .
### Areas for Improvement and Potential Issues
- **Open Terminal Permissions:** Your `open-terminal` service has `TERMINAL_SUDO_ENABLED=true`. While powerful, ensure the `STACK_USER` defined in your `.env` has a strong password, as this service provides root-level access through the WebUI.
- **Volume Consistency:** The `open-webui` volume is marked as `external: true` in the compose file. This means the stack will fail to start if you haven't manually run `docker volume create open-webui` first. Your `install.sh` handles this, but manual `docker compose up` calls might fail.
- **Resource Constraints:** You have set `shm_size: '16gb'` and `mem_limit: 32g` for Ollama. This is excellent for 14b models, but keep in mind that since the iGPU shares system RAM, you may experience "paging out" if you try to load more than one large model at a time.
- **Remote System Connectivity:** To diagnose a remote system, you'll need to manually update the `OLLAMA_INSTANCES` dictionary in `tools/system_diagnostics.py`. There is currently no way to do this via environment variables alone.
### Quick Diagnostic Checklist
1. **Connectivity:** If Open WebUI can't see Ollama, verify they are both on the `ai-net` bridge network.
2. **GPU Utilization:** If inference is slow, run `docker logs ollama-arc 2>&1 | grep -i "oneapi"` to ensure the Intel GPU is actually being engaged.
3. **Pipelines:** If your custom routing isn't working, you may need to clear the Python bytecode cache by running `docker exec pipelines rm -rf /app/pipelines/__pycache__`.
---
## Related projects

- [ava-agentone/ollama-intel](https://github.com/Ava-AgentOne/ollama-intel) — Intel Arc optimised Ollama image
- [open-webui/open-webui](https://github.com/open-webui/open-webui) — Web interface
- [open-webui/pipelines](https://github.com/open-webui/pipelines) — Pipeline plugin system

---

## Licence

MIT — use freely, contributions welcome.

Built with ☕ and stubbornness.
## Contents:
%% DATAVIEW_PUBLISHER: start
```dataview
TABLE join(sort(rows.file.link), " | ") as Documents
FLATTEN regexreplace(file.folder, ".*/", "") as lastPart
WHERE contains(file.folder, this.file.folder)
GROUP BY lastPart as Folder
SORT lastPart
```
%%

| Folder | Documents |
| --- | --- |

%% DATAVIEW_PUBLISHER: end %%

## Recent Changes / Additions
%% DATAVIEW_PUBLISHER: start
```dataview
TABLE 
  file.ctime AS "Created", 
  file.mtime AS "Updated"
WHERE file.cday >= date(today) - dur(7 days)
  OR file.mday >= date(today) - dur(7 days)
WHERE contains(file.folder, this.file.folder)
SORT file.mtime DESC
LIMIT 20
```
%%

| File | Created | Updated |
| --- | --- |
| [[_assets/_templates/Recent Activity|Recent Activity]] | 12:26 AM - April 16, 2026 | 12:26 AM - April 16, 2026 |
| [[_assets/_templates/Folder|Folder]] | 12:26 AM - April 16, 2026 | 12:26 AM - April 16, 2026 |
| [[_assets/_templates/Project|Project]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/AAR|AAR]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/Post-Implementation Review|Post-Implementation Review]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/dailynote|dailynote]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/Discovery Time|Discovery Time]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/Network|Network]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/Service|Service]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/Person|Person]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/Daily|Daily]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/Issue|Issue]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/index|index]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/Project Proposal|Project Proposal]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/Base|Base]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/Daily2|Daily2]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/Policy|Policy]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/Device|Device]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/LearningModule|LearningModule]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/_templates/IssueTest|IssueTest]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |

%% DATAVIEW_PUBLISHER: end %%
