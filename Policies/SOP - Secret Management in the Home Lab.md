---
title: SOP - Secret Management in the Home Lab
tags:
  - sop
  - security
  - lab-ops
  - git-discipline
---
# SOP: Secret Management in the Home Lab

> [!NOTE] The Instructor's Perspective
> In the Army, "Information Security" (INFOSEC) was a life-or-death matter. In your home lab, it's the difference between a secure "Command Center" and an open invitation for intruders. This SOP defines our "Signal Discipline"—how we keep our secrets (API keys, SSH keys, and passwords) out of our public-facing documentation and version control.

## 1. The Core Principle: "Instruction vs. Payload"
We strictly separate the **Instruction** (how to build it) from the **Payload** (the actual secrets and large data blobs). 
- **The Vault:** Contains Markdown notes, documentation, and `docker-compose.yml` templates.
- **The System:** Contains the actual `.env` files, SSH private keys, and multi-gigabyte model blobs (LLMs).

## 2. Signal Discipline (The "Never List")
To maintain "Stealth Mode," the following items must **NEVER** be committed to Git or stored as plaintext in the vault:
1.  **Private SSH Keys:** Keep these in `~/.ssh`. Use symlinks or bind mounts if necessary, but never copy the file into the repo.
2.  **API Keys & Tokens:** Use environment variables or a secrets manager.
3.  **Plaintext Passwords:** Store these in [[Knowledge Base/Services/Vaultwarden|Vaultwarden]].
4.  **Large Binary Blobs (LLMs):** Store these in standard system paths (e.g., `~/.ollama/models`).

## 3. Implementation Tactics
### a. The `.gitignore` Shield
Ensure your `.gitignore` is correctly configured to "mask" your local environment.
```gitignore
# Masking our local signal
.env
*.key
id_ed25519*
!*.pub
```

### b. Bind Mounts for Containers
When deploying services like [[Sparse Page]], use bind mounts to point to "sterilized" host directories.
```yaml
volumes:
  - ~/.ollama:/root/.ollama  # Pointing to the host's supply point
  - ~/.ssh/id_ed25519:/root/.ssh/id_ed25519:ro # Read-only access to keys
```

### c. Secrets Management PACE Plan
> [!TIP] Operational Discipline
> **P (Primary):** [[Knowledge Base/Services/Vaultwarden|Vaultwarden]] (Self-hosted secrets armory).
> **A (Alternate):** [[Knowledge Base/Development/Ansible/Ansible Vault|Ansible Vault]] for encrypted automation secrets.
> **C (Contingency):** Environment variables stored in local, non-indexed `.env` files.
> **E (Emergency):** Physical "Emergency Kit" with master recovery keys in a fire-safe.

## 4. After Action Review (AAR)
- **Why do we do this?** To prevent "Intel Leaks" when publishing our journal via [[Knowledge Base/Development/Obsidian/GitHub-Quartz-Obsidian|Quartz]].
- **What happens if a secret is leaked?** Immediately "burn" the key (revoke it) and rotate all affected credentials. Document the breach in a [[_assets/_templates/AAR|Post-Mortem AAR]].

## Check for Understanding
- Why is it important to store LLM model files (BLOBs) outside of the Git repository?
- What is the difference between a **Primary** secrets manager and a **Contingency** `.env` file?

---
*Related: [[Knowledge Base/Networking/Security]], [[Knowledge Base/Services/Vaultwarden]], [[Learning/Home-Lab-Series/Default-Stack-Blueprint|The Stack]]*
