# AI Sysadmin Stack — Usage Guide

The full local AI toolkit for system administration: terminal AI, shell integration, log analysis, script generation, and remote SSH management — all backed by local Ollama models.

> For installation instructions (fresh machine or reinstall), see [[2026-04-01-AI-Sysadmin-Stack-Installation]].
> For the GPU/llama.cpp setup and backstory, see [[2026-03-22]] and [[2026-03-29-start]].

---

## What's in This Stack

| Tool | Binary | Purpose |
|------|--------|---------|
| **aichat** | `aichat` | Primary terminal AI — roles, sessions, pipes |
| **llm** | `llm` | Unix-pipe AI, great for log/file analysis |
| **aider** | `aider` | Code editing with AI (now Ollama-backed) |
| **Python Fabric** | `fab` | SSH automation for remote hosts |
| **fabai** | `fabai` | AI-planned remote management via SSH |

All of these run against local Ollama models by default. No tokens sent anywhere.

---

## Models and When to Use Each

| Model | Best for | Speed (CPU) |
|-------|----------|-------------|
| `llama3.1:8b` | General sysadmin Q&A, reasoning, troubleshooting | ~2 t/s |
| `qwen2.5:7b` | General purpose, concise answers, quick queries | ~2 t/s |
| `qwen2.5-coder:7b` | Shell scripts, Python, Ansible, Dockerfiles | ~2 t/s |
| `nemotron-3-nano:4b` | Fastest option, good for simple tasks | ~3 t/s |
| `qwen2.5-coder:1.5b-base` | Autocomplete, one-liners, ultra-fast | ~6 t/s |

> **Note on speed:** Ollama has `OLLAMA_VULKAN=true` set in the systemd service as of April 2026. Whether this actually offloads to the Arc iGPU depends on Ollama's version. If responses feel slow, use `ai-gpu` (below) which uses llama.cpp + Vulkan directly and is confirmed GPU-accelerated (28.8 t/s generation vs 2 t/s CPU). See [[2026-03-29-start]] for measured benchmarks.

---

## Shell Aliases Quick Reference

All of these are in `~/.zshrc`. Run `source ~/.zshrc` or open a new terminal after any changes.

```bash
# aichat — the main tool
ai          # plain aichat, no role
aic         # sysadmin role (llama3.1:8b)
aid         # devops role — Ansible, Docker, K8s (qwen2.5-coder:7b)
ais         # script writing role (qwen2.5-coder:7b)
aix         # explain a command/concept (llama3.1:8b)
aif         # sysadmin role with persistent session (for multi-turn)
aifast      # no role, qwen2.5:7b (smaller/faster)
aicode      # no role, qwen2.5-coder:7b

# GPU-accelerated (requires llama-serve running — see below)
aigpu           # llama3.1:8b via GPU
aigpu-code      # qwen2.5-coder:7b via GPU, script role
aigpu-sys       # llama3.1:8b via GPU, sysadmin role
ai-gpu [model]  # start GPU server + open aichat in one command

# llm — pipe-friendly
lm          # llm with llama3.1:8b (default)
lmfast      # llm with qwen2.5:7b
```

---

## Shell Functions

### `explain` — understand any command

```bash
explain "find . -name '*.log' -mtime +7 -delete"
explain ls -lah /etc
explain "awk '{print $1}' access.log | sort | uniq -c | sort -rn"
```

### `ailog` — analyse log output

```bash
# Pipe logs directly
journalctl -xe | ailog
tail -n 500 /var/log/nginx/error.log | ailog

# With a specific question
journalctl -u postgresql --since "1 hour ago" | ailog "focus on connection errors"
cat /var/log/syslog | ailog "any signs of disk failure?"
```

### `aigen` — generate a command from a description

```bash
aigen "find all files modified in the last 24 hours larger than 100MB"
aigen "show all listening TCP ports with the process name"
aigen "rotate logs in /var/log/myapp older than 30 days"
```

### `aifix` — diagnose a failed command

```bash
aifix "sudo systemctl restart nginx" "Job failed. See journalctl -xe for details."
aifix "ansible-playbook site.yml" "ERROR: The task 'Install packages' failed with: No package nginx found"
```

---

## Keyboard Shortcuts (Shell)

| Key | Action |
|-----|--------|
| `Ctrl+K` | Explain the command currently typed in the shell buffer |
| `Ctrl+G` | Replace typed description with a generated command |

**Example of Ctrl+G:**
Type `show which processes are using the most memory` and press `Ctrl+G`. The buffer is replaced with `ps aux --sort=-%mem | head -20` (or similar). Review it, then press Enter to run.

---

## aichat — Interactive Mode

aichat drops into a REPL when called without piped input:

```bash
aic                     # sysadmin role REPL
aic --session debug-1   # named session (saved, resumable)
```

Inside aichat:
```
# Change model mid-session
.model ollama:qwen2.5-coder:7b

# List available models
.models

# List roles
.roles

# Switch role
.role script

# Clear context
.clear

# Exit
.exit
```

### Roles

| Role | Use it for |
|------|-----------|
| `sysadmin` | Linux administration, services, networking, storage |
| `devops` | Ansible, Docker, docker-compose, Kubernetes, Talos |
| `script` | Writing bash or Python scripts (outputs clean code blocks) |
| `explain` | Understanding commands, man pages, log entries |

Role files are in `~/.config/aichat/roles/` — edit them to tune behaviour.

---

## GPU-Accelerated Path

For faster responses (confirmed ~3× speedup on the Arc iGPU), use the llama.cpp Vulkan server directly.

```bash
# Start the GPU server and open aichat (one command)
ai-gpu          # default: qwen2.5-coder:7b
ai-gpu llama    # llama3.1:8b
ai-gpu qwen     # qwen2.5:7b
ai-gpu nano     # nemotron-3-nano:4b (fastest)

# Or start the server separately and use GPU-backed aliases
llama-serve coder
aigpu-sys       # now talking to GPU backend
```

The GPU server runs at `http://localhost:8081`. aichat accesses it as the `llama-gpu` client. Models are listed as `llama-gpu:qwen2.5-coder-7b.gguf` etc.

> **Note:** Only one model can be loaded in llama-server at a time. If you switch models, stop and restart with a different argument. Ollama (port 11434) is unaffected.

---

## llm — Pipe Mode

Simon Willison's `llm` tool is ideal for chaining into shell pipelines.

```bash
# Summarise anything
cat /etc/nginx/nginx.conf | lm "explain this config and flag any security issues"
df -h | lm "is anything close to full?"
ps aux | lm "what's consuming the most resources and is anything unusual?"

# Analyse a file
lm "what does this do?" < ~/bin/llama-serve

# With a specific model
echo "write a cron expression for every weekday at 3am" | llm -m qwen2.5-coder:7b

# Check available models
llm models list | grep Ollama
```

---

## aider — Code Editing

aider is now configured to use `qwen2.5-coder:7b` via Ollama by default (`~/.aider.conf.yml`).

```bash
# Standard usage — Ollama backend, no cloud needed
aider src/app.py

# Using the GPU server (faster)
aider-local               # GPU server, coder model
aider-local llama         # GPU server, llama3.1:8b

# Override model directly
aider --model ollama/llama3.1:8b
```

Config lives at `~/.aider.conf.yml`. Key settings:
- Default model: `ollama/qwen2.5-coder:7b`
- Editor model: same
- Weak model (commit messages): `ollama/qwen2.5-coder:1.5b-base`
- Auto-commits: off (review diffs manually)

---

## fabai — AI-Assisted Remote Management

`fabai` generates shell commands for a task using Ollama, shows them to you, then optionally executes them over SSH via Fabric.

### Basic usage

```bash
# Ask AI what to run on a remote host, then decide
fabai --host web01 "check disk usage and identify the top 5 largest directories"
fabai --host db01 --user ubuntu "is postgresql running and healthy"
fabai --host bastion "show failed SSH login attempts in the last hour"

# With a smaller/faster model
fabai --host web01 --model qwen2.5:7b "check memory usage"
```

### Dry-run mode (generate and run locally)

```bash
fabai --dry-run "show all listening ports with process names"
fabai --dry-run "find log files larger than 500MB"
```

### Interactive mode

```bash
fabai --interactive --host web01
fabai --interactive --host web01 --user ubuntu
# No host = runs locally
fabai --interactive
```

Prompts you for tasks in a loop. Type `quit` to exit.

### Destructive operations

If fabai detects that a command is destructive (deletes files, restarts services, etc.), it warns you and requires explicit `y` confirmation before executing.

---

## Python Fabric — Direct SSH Automation

For structured, repeatable automation, write a `fabfile.py`. A template is at `~/bin/fabfile-template.py`.

```bash
# Copy the template to a project
cp ~/bin/fabfile-template.py ~/myproject/fabfile.py

# Run a task
source ~/.local/sysadmin-env/bin/activate   # activate the sysadmin venv
fab --host web01 disk-report
fab --host db01 log-check --lines=500
fab --host web01 sys-info
fab --host web01 service-health --service=nginx

# Multiple hosts
fab --host web01 --host web02 disk-report
```

The template's tasks each collect data from the remote host and send it to Ollama for analysis. The `ai-task` task takes a natural language description:

```bash
fab --host web01 ai-task --describe="show failed logins in the last hour"
```

### Using the sysadmin venv in scripts

For standalone Python scripts that use both Fabric and the Ollama library:

```python
#!/home/netyeti/.local/sysadmin-env/bin/python3
from fabric import Connection
import ollama
```

Or activate first: `source ~/.local/sysadmin-env/bin/activate`

---

## Keeping Models Warm

Ollama is configured with a 30-minute keepalive (`OLLAMA_KEEP_ALIVE=30m`). The first call after a cold start takes ~80 seconds to load the model into memory. After that, responses are immediate until the keepalive expires.

To pre-warm a model (e.g., in the morning or before a session):

```bash
echo "ready" | llm -m llama3.1:8b > /dev/null
```

To check what's currently loaded:

```bash
curl -s http://localhost:11434/api/ps | python3 -m json.tool
```

---

## Adding a New Model

```bash
# 1. Pull via Ollama
ollama pull <name>:<tag>

# 2. Add it to aichat config
#    Edit ~/.config/aichat/config.yaml — add under the ollama client's models list

# 3. Optionally symlink for llama-server
#    Get the blob hash from the manifest (see ~/bin/llama-serve or [[Ollama and My System]])
#    ln -sf /usr/share/ollama/.ollama/models/blobs/sha256-<hash> ~/models/<name>.gguf
#    Add it to the MODELS array in ~/.local/bin/llama-serve
```

---

## Quick Diagnostics

```bash
# Is Ollama running?
systemctl status ollama --no-pager | head -5

# What's loaded?
curl -s http://localhost:11434/api/ps | python3 -m json.tool

# Is llama-server (GPU) running?
curl -s http://localhost:8081/health

# aichat models visible?
aichat --list-models

# llm default model?
llm models default

# Test everything quickly
echo "ping" | lm
echo "ping" | aichat -m ollama:qwen2.5:7b
```

---

*Last updated: April 2026 — phoenix (ASUS Zenbook Duo UX8406MA, Ubuntu 24.04)*
*For reinstallation steps, see [[2026-04-01-AI-Sysadmin-Stack-Installation]].*
