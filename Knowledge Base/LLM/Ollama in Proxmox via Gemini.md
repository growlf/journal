# Gemini CLI — Install on Proxmox LXC (Ubuntu 24.04)

**Tags:** #linux #proxmox #lxc #gemini #cli #nodejs #tutorial **Date:** 2026-04-12 **Status:** ✅ Verified

---

## Overview

This guide covers installing Google's [Gemini CLI](https://github.com/google-gemini/gemini-cli) on an Ubuntu 24.04 LXC container running on a Proxmox host. Gemini CLI is a Node.js-based tool that connects to Google's Gemini cloud API — it does **not** use any local GPU, so the host's GPU is irrelevant for this setup.

> [!warning] Two LXC-specific gotchas before you start
> 
> 1. **Don't run as root.** Gemini CLI's Google OAuth auth flow is broken when running as root (known upstream issue). Proxmox LXC templates often drop you into a root shell — create a regular user first.
> 2. **The host GPU doesn't matter.** Gemini CLI is cloud-backed. No CUDA/driver passthrough needed.

---

## Prerequisites

- Ubuntu 24.04 LXC container (privileged or unprivileged)
- Internet access from the LXC
- A regular Google account (free tier works)
- A browser on any machine to complete OAuth

---

## Step 0 — Create a Non-Root User

If you're dropped into a root shell in your LXC, create a regular user first:

```bash
adduser yeti          # replace with your preferred username
usermod -aG sudo yeti
su - yeti             # switch to that user now
```

All subsequent steps run as this non-root user.

---

## Step 1 — Check Your Node.js Version

```bash
node --version
```

Ubuntu 24.04 ships **Node.js 18** in its default repos. Gemini CLI requires **Node.js 20 or higher**. If you're on 18 or below, proceed to Step 2. If already on 20+, skip to Step 3.

---

## Step 2 — Install Node.js 22 via NodeSource

The NodeSource APT method is cleanest for a server LXC — no NVM complexity, and it auto-updates via `apt`:

```bash
sudo apt update && sudo apt install -y ca-certificates curl gnupg

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key \
  | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

NODE_MAJOR=22
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] \
  https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" \
  | sudo tee /etc/apt/sources.list.d/nodesource.list

sudo apt update && sudo apt install -y nodejs
```

Verify:

```bash
node --version   # should show v22.x
npm --version
```

---

## Step 3 — Configure npm to Install Globals Without sudo

Setting a user-level npm prefix avoids permission issues and keeps your global packages out of system-owned paths:

```bash
mkdir -p ~/.local/bin
npm config set prefix '~/.local'
export PATH="$HOME/.local/bin:$PATH"
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

Verify the prefix is set correctly:

```bash
npm config get prefix   # should return /home/<youruser>/.local
```

---

## Step 4 — Install Gemini CLI

```bash
npm install -g @google/gemini-cli
```

### Create the config directory

The `~/.gemini` directory doesn't exist yet and Gemini CLI won't create it automatically on first run — it will throw an `ENOENT` rename error if it's missing. Create it now:

```bash
mkdir -p ~/.gemini
```

Verify the install:

```bash
gemini --version
```

Expected output: a version number like `0.37.1` with no errors.

If you see `command not found`, your PATH hasn't refreshed — run `source ~/.bashrc` or open a new shell.

> [!note] Deprecation warnings are harmless You may see `npm WARN deprecated node-domexception` or similar during install. These are informational only and won't affect functionality.

---

## Step 5 — Authenticate

```bash
gemini
```

On first launch you'll be prompted to sign in with Google. The CLI generates a URL in the terminal — copy it and open it in any browser (including your local machine if the LXC is headless). Complete the OAuth flow and the terminal session will authenticate automatically.

> [!tip] Headless LXC auth Since your LXC has no GUI, just copy the auth URL from the terminal output and paste it into a browser on your workstation. Auth completes back in the terminal session once you approve.

---

## Step 6 — Usage

Best practice is to `cd` into a project directory before launching, so Gemini has relevant file context:

```bash
cd ~/your-project
gemini
```

Useful slash commands inside the CLI:

|Command|Purpose|
|---|---|
|`/help`|List all available commands|
|`/compress`|Reduce context size (useful for large projects / free tier limits)|
|`/model`|Switch model|
|`/settings`|View/change settings|

---

## Updating

```bash
npm install -g @google/gemini-cli@latest
```

---

## Troubleshooting

|Symptom|Fix|
|---|---|
|`command not found` after install|`source ~/.bashrc` — check `echo $PATH` includes `~/.local/bin`|
|`EACCES permission denied` during install|Confirm `npm config get prefix` returns `~/.local`, not `/usr`|
|`ENOENT rename projects.json` error|`mkdir -p ~/.gemini`|
|Auth broken / OAuth fails|Don't run as root — switch to a non-root user|
|`GOOGLE_CLOUD_PROJECT` org subscription error|Unset that env var: `unset GOOGLE_CLOUD_PROJECT` and remove from `~/.bashrc`|
|Deprecation warnings during install|Safe to ignore — cosmetic only|

---

## Related Notes

- [[Ollama Quest]] — local LLM stack on the same host
- [[Proxmox LXC Setup]]
- [[AI Tools Overview]]

---

_Tested on: Ubuntu 24.04 LXC, Proxmox 8.x, Gemini CLI v0.37.1, Node.js v22.x_