# AI Sysadmin Stack — Installation Guide

A complete, step-by-step reinstallation guide for the local AI sysadmin toolkit on phoenix. Follow this in order on a fresh Ubuntu install (or after a wipe).

> For day-to-day usage of everything installed here, see [[AI Sysadmin Stack - Usage Guide]].
> For the Ollama + llama.cpp + GPU setup (prerequisite for this stack), see [[2026-03-29-start]] and [[2026-03-22]].

---

## Prerequisites

This guide assumes the following are already in place. If not, do those first:

- [ ] Ollama installed and running (`systemctl status ollama`) - optimized for your specific hardware scenario
- [ ] Models pulled: `llama3.1:8b`, `qwen2.5:7b`, `qwen2.5-coder:7b`, `nemotron-3-nano:4b`, `qwen2.5-coder:1.5b-base`
- [ ] llama.cpp built with Vulkan (`~/llama.cpp/build/bin/llama-server` exists)
- [ ] Model symlinks in `~/models/` (see [[2026-03-29-start]])
- [ ] `~/bin/llama-serve` and `~/.local/bin/aider-local` scripts exist
- [ ] `pipx` installed (`/usr/bin/pipx`)
- [ ] Cargo/Rust installed (`~/.cargo/bin/cargo`)
- [ ] zsh with Oh-My-Zsh and Powerlevel10k configured

---

## Step 1: Install aichat

aichat is the primary terminal AI tool. Download the pre-built binary — building from source with cargo takes several minutes and isn't necessary.

```bash
# Get latest release URL
curl -s https://api.github.com/repos/sigoden/aichat/releases/latest \
  | python3 -c "
import sys, json
r = json.load(sys.stdin)
print(r['tag_name'])
[print(a['browser_download_url']) for a in r['assets']
 if 'x86_64-unknown-linux-musl' in a['name']]
"

# Download, extract, install (replace v0.30.0 with the version above)
cd /tmp
curl -sL https://github.com/sigoden/aichat/releases/download/v0.30.0/aichat-v0.30.0-x86_64-unknown-linux-musl.tar.gz \
  -o aichat.tar.gz
tar xzf aichat.tar.gz
cp aichat ~/.local/bin/aichat
chmod +x ~/.local/bin/aichat

# Verify
aichat --version
```

---

## Step 2: Install llm + Ollama plugin

Simon Willison's `llm` CLI with the `llm-ollama` plugin. Great for piping files/logs through AI.

```bash
pipx install llm
pipx inject llm llm-ollama

# Set default model
llm models default llama3.1:8b

# Verify
llm --version
llm models list | grep Ollama
```

---

## Step 3: Install Python Fabric and Ollama library

Two installs needed: `fab` as a CLI tool (via pipx), and a shared venv for scripts that import both `fabric` and `ollama` as libraries.

```bash
# fab CLI via pipx, with ollama library injected
pipx install fabric
pipx inject fabric ollama

# Dedicated sysadmin venv for standalone scripts
python3 -m venv ~/.local/sysadmin-env
~/.local/sysadmin-env/bin/pip install fabric ollama

# Verify
fab --version
~/.local/sysadmin-env/bin/python -c "import fabric, ollama; print('ok')"
```

> **Why two installs?** `pipx` gives you the `fab` binary in `$PATH`. The separate venv gives you an interpreter you can use as a shebang (`#!/home/netyeti/.local/sysadmin-env/bin/python3`) for scripts that import both libraries without version conflicts from the system Python.

---

## Step 4: Configure aichat

Create the config directory and files.

```bash
mkdir -p ~/.config/aichat/roles
```

### `~/.config/aichat/config.yaml`

```yaml
model: ollama:llama3.1:8b
temperature: 0.4
save_session: true
highlight: true
light_theme: false
wrap: auto
wrap_code: true
keybindings: emacs
stream: true

clients:
  # Ollama (all models, CPU with Vulkan enabled)
  - type: openai-compatible
    name: ollama
    api_base: http://localhost:11434/v1
    api_key: "ollama"
    models:
      - name: llama3.1:8b
        max_input_tokens: 32768
      - name: qwen2.5:7b
        max_input_tokens: 32768
      - name: qwen2.5-coder:7b
        max_input_tokens: 32768
      - name: nemotron-3-nano:4b
        max_input_tokens: 8192
      - name: qwen2.5-coder:1.5b-base
        max_input_tokens: 8192

  # llama-server (GPU-accelerated via Vulkan/Intel Arc)
  # Start with: llama-serve [coder|llama|qwen|nano]
  - type: openai-compatible
    name: llama-gpu
    api_base: http://localhost:8081/v1
    api_key: "local"
    models:
      - name: qwen2.5-coder-7b.gguf
        max_input_tokens: 32768
      - name: llama3.1-8b.gguf
        max_input_tokens: 32768
      - name: qwen2.5-7b.gguf
        max_input_tokens: 32768
      - name: nemotron-3-nano-4b.gguf
        max_input_tokens: 8192
```

### Role files

Create each of these in `~/.config/aichat/roles/`:

**`sysadmin.md`**
```markdown
---
name: sysadmin
model: ollama:llama3.1:8b
temperature: 0.3
---
You are an expert Linux system administrator with deep knowledge of:
- Debian/Ubuntu server administration
- systemd service management
- networking (iptables, nftables, SSH, DNS, DHCP)
- storage (LVM, ZFS, RAID, disk management)
- security hardening and auditing
- performance monitoring and tuning
- Docker and container management
- Ansible automation
- Kubernetes/Talos cluster management
- shell scripting (bash/zsh)
- log analysis and troubleshooting

When asked for commands or scripts:
- Provide working, production-safe commands
- Include brief inline comments for non-obvious flags
- Warn about destructive operations
- Prefer idempotent solutions
- Default to the most direct, reliable approach

Keep responses concise. Use code blocks for all commands and scripts.
```

**`explain.md`**
```markdown
---
name: explain
model: ollama:llama3.1:8b
temperature: 0.2
---
You explain shell commands, scripts, and system concepts clearly and concisely.

When given a command or script:
1. State what it does in one sentence
2. Break down each flag/argument/pipe stage
3. Note any side effects, risks, or gotchas
4. Suggest improvements or alternatives if relevant

Be direct. No preamble. Use code blocks for examples.
```

**`script.md`**
```markdown
---
name: script
model: ollama:qwen2.5-coder:7b
temperature: 0.2
---
You are an expert at writing bash and Python scripts for Linux system administration.

Rules:
- Write complete, runnable scripts with a proper shebang
- Include set -euo pipefail for bash scripts
- Handle errors gracefully
- Add usage/help text for scripts with arguments
- Use shellcheck-compatible bash
- For Python, use the stdlib where possible; list pip dependencies at the top as comments
- No placeholder comments — write real, working code

Output only the script in a code block. Follow with a one-line description and usage example.
```

**`devops.md`**
```markdown
---
name: devops
model: ollama:qwen2.5-coder:7b
temperature: 0.3
---
You are a DevOps engineer specialising in Ansible, Docker, Kubernetes/Talos, and Python Fabric.

When writing Ansible:
- Use fully-qualified module names (ansible.builtin.*)
- Set become: true at the task level when needed
- Use handlers for service restarts

When writing Docker Compose:
- Use version: "3.8" or above
- Set resource limits
- Use named volumes for persistent data

Output working, production-quality configurations. Use code blocks. Be concise.
```

Verify roles loaded:
```bash
aichat --list-roles
# Should show: devops, explain, script, sysadmin (plus built-in roles)
```

---

## Step 5: Configure aider for Ollama

aider's default config is at `~/.aider.conf.yml`. Create it:

```yaml
# aider configuration — local Ollama backend
# env: OLLAMA_API_BASE=http://localhost:11434

model: ollama/qwen2.5-coder:7b
auto-commits: false
dirty-commits: false
show-diffs: true
dark-mode: true
editor-model: ollama/qwen2.5-coder:7b
weak-model: ollama/qwen2.5-coder:1.5b-base
cache-prompts: true
gitignore: false
```

Verify:
```bash
# Should show no OpenRouter/API errors — just connect and wait
# Ctrl+C immediately after confirming it's loading
OLLAMA_API_BASE=http://localhost:11434 aider --version
```

---

## Step 6: Enable Vulkan in Ollama service

Ollama's pre-built binary ships CPU/CUDA backends. On Intel Arc (and any non-NVIDIA GPU), Vulkan must be explicitly enabled. Also increase the keepalive so models don't have to reload every 5 minutes.

```bash
sudo mkdir -p /etc/systemd/system/ollama.service.d

sudo tee /etc/systemd/system/ollama.service.d/intel-gpu.conf << 'EOF'
[Service]
# Enable Vulkan for Intel Arc (UMA — unified memory, vram shows 0 but GPU compute is active)
Environment="OLLAMA_VULKAN=true"
# Keep models loaded for 30 min (cold load is ~80s; avoid this after every query)
Environment="OLLAMA_KEEP_ALIVE=30m"
# Context length (0 = auto from model file)
Environment="OLLAMA_CONTEXT_LENGTH=8192"
EOF

sudo systemctl daemon-reload
sudo systemctl restart ollama
systemctl status ollama --no-pager | head -5
```

Verify Vulkan is active in logs:
```bash
journalctl -u ollama -n 5 --no-pager | grep VULKAN
# Should show: OLLAMA_VULKAN:true
```

> **Note on UMA:** The Intel Arc iGPU shares system RAM. `ollama ps` will show `size_vram: 0` — this is expected for unified memory systems. GPU compute is still active when `OLLAMA_VULKAN=true`. The confirmed GPU path (with measured benchmarks) is llama.cpp + Vulkan — see [[2026-03-29-start]].

---

## Step 7: Create the fabai script

This is the AI-assisted SSH management tool. It lives in `~/bin/` which is already on `$PATH`.

Save the following as `~/bin/fabai` and make it executable:

```bash
chmod +x ~/bin/fabai
```

The shebang must point to the sysadmin venv's Python (not system Python):

```python
#!/home/netyeti/.local/sysadmin-env/bin/python3
```

The full script content is in the existing `~/bin/fabai`. To verify it works:

```bash
fabai --help
```

The Fabric template for project fabfiles is at `~/bin/fabfile-template.py`.

---

## Step 8: Add shell integration to `~/.zshrc`

Add the following block to the end of `~/.zshrc` (before or after the LM Studio PATH lines):

```bash
# ─── Local AI / Ollama Shell Integration ──────────────────────────────────────

# Ollama endpoint (used by aider, aichat, llm, fabai)
export OLLAMA_API_BASE="http://localhost:11434"
export OLLAMA_HOST="localhost:11434"

# Default model shortcuts
export AI_MODEL_DEFAULT="ollama:llama3.1:8b"
export AI_MODEL_FAST="ollama:qwen2.5:7b"
export AI_MODEL_CODE="ollama:qwen2.5-coder:7b"
export AI_MODEL_MINI="ollama:nemotron-3-nano:4b"
export SYSADMIN_VENV="$HOME/.local/sysadmin-env"

# Core AI aliases (Ollama backend)
alias ai='aichat'
alias aic='aichat --role sysadmin'
alias aid='aichat --role devops'
alias ais='aichat --role script'
alias aix='aichat --role explain'
alias aif='aichat --role sysadmin --session'
alias aifast='aichat -m ollama:qwen2.5:7b'
alias aicode='aichat -m ollama:qwen2.5-coder:7b'

# GPU-accelerated aliases (requires: llama-serve [model] first)
alias aigpu='aichat -m llama-gpu:llama3.1-8b.gguf'
alias aigpu-code='aichat -m llama-gpu:qwen2.5-coder-7b.gguf --role script'
alias aigpu-sys='aichat -m llama-gpu:llama3.1-8b.gguf --role sysadmin'

# Start GPU server + open aichat
ai-gpu() {
  local model="${1:-coder}"
  if ! curl -s --max-time 2 http://localhost:8081/health 2>/dev/null | grep -q "ok"; then
    echo "Starting llama-serve $model (GPU)..."
    llama-serve "$model" > /tmp/llama-serve.log 2>&1 &
    echo -n "Loading"
    until curl -s --max-time 2 http://localhost:8081/health 2>/dev/null | grep -q "ok"; do
      sleep 2; echo -n "."
    done
    echo " ready!"
  else
    echo "GPU server already running."
  fi
  local -A gguf_map=( [coder]="qwen2.5-coder-7b.gguf" [llama]="llama3.1-8b.gguf" [qwen]="qwen2.5-7b.gguf" [nano]="nemotron-3-nano-4b.gguf" )
  aichat -m "llama-gpu:${gguf_map[$model]:-qwen2.5-coder-7b.gguf}" --role sysadmin
}

# llm pipe aliases
alias lm='llm -m llama3.1:8b'
alias lmfast='llm -m qwen2.5:7b'

# Shell functions
explain() {
  [[ $# -eq 0 ]] && { echo "Usage: explain <command>"; return 1; }
  echo "$*" | aichat --role explain
}

ailog() {
  local prompt="${1:-Summarise the key events, errors, and warnings. Be concise.}"
  aichat --role sysadmin "Analyse this log output: $prompt" <<< "$(cat)"
}

aigen() {
  [[ $# -eq 0 ]] && { echo "Usage: aigen <task description>"; return 1; }
  aichat --role sysadmin "Give me a single shell command (no explanation) to: $*"
}

aifix() {
  aichat --role sysadmin "I ran: $1\nIt failed with: $2\nWhat went wrong and how do I fix it?"
}

# Ctrl+K — explain command in buffer
_ai_explain_buffer() {
  local buf="$BUFFER"
  [[ -z "$buf" ]] && { zle redisplay; return; }
  zle -I
  print ""
  echo "$buf" | aichat --role explain
  BUFFER=""
  zle redisplay
}
zle -N _ai_explain_buffer
bindkey '^K' _ai_explain_buffer

# Ctrl+G — generate command from description in buffer
_ai_generate_command() {
  local desc="$BUFFER"
  [[ -z "$desc" ]] && { zle redisplay; return; }
  zle -I
  print ""
  local cmd
  cmd=$(aichat --role sysadmin \
    "Give me a single shell command only (no explanation, no markdown, just the raw command) to: $desc" \
    2>/dev/null | tr -d '`' | head -1)
  [[ -n "$cmd" ]] && BUFFER="$cmd" && CURSOR=${#BUFFER}
  zle redisplay
}
zle -N _ai_generate_command
bindkey '^G' _ai_generate_command

# llm default model
export LLM_OLLAMA_MODEL="llama3.1:8b"

# ─────────────────────────────────────────────────────────────────────────────
```

Apply it:
```bash
source ~/.zshrc
```

---

## Step 9: Verify Everything

Run through this checklist after installation:

```bash
# Tools available
which aichat llm fab fabai aider
aichat --version && llm --version && fab --version && aider --version

# aichat sees all Ollama models
aichat --list-models

# aichat roles present
aichat --list-roles | grep -E "sysadmin|devops|script|explain"

# llm default model set
llm models default

# Ollama running with Vulkan and keepalive
journalctl -u ollama -n 3 --no-pager | grep -E "VULKAN|KEEP_ALIVE"

# Test a quick response (model must be loaded — first call may be slow)
echo "what is systemd?" | llm -m qwen2.5:7b

# fabai loads
fabai --help

# sysadmin venv intact
~/.local/sysadmin-env/bin/python -c "import fabric, ollama; print('venv ok')"
```

---

## File Locations Summary

| File / Directory | Purpose |
|-----------------|---------|
| `~/.config/aichat/config.yaml` | aichat main config (models, clients) |
| `~/.config/aichat/roles/` | Role system prompts |
| `~/.aider.conf.yml` | aider defaults (model, flags) |
| `/etc/systemd/system/ollama.service.d/intel-gpu.conf` | Ollama Vulkan + keepalive settings |
| `~/bin/fabai` | AI-assisted SSH management script |
| `~/bin/fabfile-template.py` | Fabric project template with Ollama |
| `~/.local/sysadmin-env/` | Python venv with fabric + ollama |
| `~/.zshrc` | Shell aliases, functions, keybindings |

---

## Notes for Future Updates

**Updating aichat:** repeat Step 1 with the new release URL. Config and roles are unaffected.

**Updating llm:** `pipx upgrade llm && pipx inject llm llm-ollama`

**Updating fabric/ollama Python:** `~/.local/sysadmin-env/bin/pip install --upgrade fabric ollama`

**Adding new Ollama models:** pull with `ollama pull`, then add entries to `~/.config/aichat/config.yaml` under the `ollama` client's `models` list. Optionally symlink for llama-server use (see [[2026-03-29-start]]).

**If aichat can't reach Ollama:** verify `systemctl is-active ollama` and test `curl -s http://localhost:11434/api/tags`.

**If fabai fails with import errors:** the shebang must be `#!/home/netyeti/.local/sysadmin-env/bin/python3` (not `/usr/bin/python3`) to avoid system Python version conflicts.

---

*Last updated: April 2026 — phoenix (ASUS Zenbook Duo UX8406MA, Ubuntu 24.04)*
*For daily usage, see [[AI Sysadmin Stack - Usage Guide]].*
