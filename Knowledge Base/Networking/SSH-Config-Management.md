---
title: "SSH Config Management"
tags:
  - networking
  - ssh
  - administration
  - infrastructure
  - sovereignty
  - linux
creation date: 2026-04-13 10:00
Documentation: https://linux.die.net/man/5/ssh_config
aliases:
  - SSH Config
---
# 🔑 SSH Config Management

> [!NOTE] The Instructor's Perspective
> Managing a complex lab across multiple sites (Yeticraft, BMS, and the Cloud) without a well-tuned `~/.ssh/config` is like trying to navigate a forest without a map or a compass. You might find your way, but you'll waste a lot of signal doing it. This file is your tactical steering mechanism—it turns cryptic IP addresses into human-readable handles and automates the heavy lifting of identity management and proxy-jumping.

## The Critical Nature of the Config
In our "Manageable Mess," the SSH config is **Critical Infrastructure**. Without it:
- **Automation Fails:** Tools like Ansible or the Yeti's own Powers lose their ability to target nodes by name.
- **Mental Load Increases:** You're forced to remember IPs, ports, and which key belongs where.
- **Tactical Reach-Back is Brittle:** Connecting to remote nodes in the BMS cluster becomes a multi-step manual process instead of a single command.

## Manual Signal Discipline
"Manual Signal Discipline" is the art of keeping your config organized so it remains a tool, not a burden.
1. **Consistent Naming:** Use a standard pattern like `host.domain` or `service-env`.
2. **Logical Grouping:** Keep related blocks together (e.g., all BMS nodes, all Proxmox hosts).
3. **Explicit Identities:** Always define `IdentityFile` to avoid "Too many authentication failures" and ensure the right key is used for the right gate.
4. **Cleanliness:** Use whitespace and comments to explain *why* a specific tunnel or `ProxyJump` exists.

## Tactical Reach-Back with Wildcards
Wildcards (e.g., `Host *.bms`) are the secret to rapid expansion. They allow you to define a "Standard Operating Procedure" for an entire subnet or domain.

```ssh
# Example: Tactical reach-back to the BMS cluster
Host *.bms
    User netyeti
    IdentityFile ~/.ssh/id_ed25519_bms
    ProxyJump gateway.bms
    ForwardAgent yes
```
With this in place, any new node added to the BMS network is immediately reachable by its hostname without needing a unique entry in your config.

## Sovereign Backups & Protection
Per the [[Policies/Policy - Local Sovereignty Law|Local Sovereignty Law]], your `~/.ssh/config` is a **Protected Asset**. 

> [!WARNING] Data Sovereignty
> Never let an automated "cleanup" script or a generic "dotfile manager" wipe out your manual tactical overrides. 

- **The Vault Copy:** Keep a sovereign copy of your config (sanitized of actual private keys) in the Obsidian vault under `Internal/` or a dedicated config backup node.
- **Reconciliation:** Any manual change made to the live `~/.ssh/config` must be reflected in the vault. This ensures that if a node is wiped, your map of the forest can be restored instantly.

## Enforcement
We use the `enforce-sovereignty.sh` Power to audit and restore these manual signals across the Council's nodes, ensuring that "Tactical Reach-Back" is always available.

---
### Links
- **Policy:** [[Policies/Policy - Local Sovereignty Law]]
- **Parent:** [[Knowledge Base/ssh]]
- **Related:** [[Policies/SOP - Secret Management in the Home Lab]], [[Knowledge Base/Networking/Tactical-SSH-GitHub-Keys]]
- **Script:** [[_assets/_scripts/enforce-sovereignty.sh]]
