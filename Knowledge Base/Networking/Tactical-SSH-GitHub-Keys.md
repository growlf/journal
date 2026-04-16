---
Updated: 2026-04-13
tags:
  - networking
  - ssh
  - automation
  - council
  - github
module_id: TACT-NET-001
phase: Provisioning
---
# Tactical SSH: The GitHub Public Key Trick

> [!NOTE] The Instructor's Perspective
> When provisioning the Council (your fleet of LLM nodes and service hosts), manual copy-pasting of SSH public keys is a "noise" generator. We want high signal and rapid deployment. Leveraging GitHub as a public key distribution point is the most efficient way to maintain "Signal Parity" across the entire forest.

## 🎯 Learning Objectives
By the end of this module, you will:
- Understand how GitHub hosts public keys in plain text.
- Execute the tactical command to provision a new node.
- Recognize why this method is superior to insecure file transfers.

---

## 🧭 Tactical Overview
GitHub exposes the public keys of any user at a standard URL: `https://github.com/[username].keys`. This is a public, read-only endpoint. Because these are *public* keys, there is zero risk in them being exposed—they are designed to be shared. By curling this endpoint directly into your `authorized_keys` file, you can grant yourself access to a new machine in seconds.

---

## 🛠️ Step-by-Step Implementation

### 1. Identify the Target User
Ensure you know the exact GitHub username for the keys you want to pull. 

### 2. The Tactical Command
Run the following on the target node (e.g., a new LXC or a Phoenix node):

```bash
mkdir -p ~/.ssh && chmod 700 ~/.ssh
curl https://github.com/[username].keys >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
```

### 3. Verify Access
From your workstation, attempt to SSH into the node:
```bash
ssh user@node-ip
```

---

## ⚠️ Common Pitfalls & "Stupid Questions"
- **Pitfall:** Using `>` instead of `>>`. 
- **Fix:** `>>` appends to the file. `>` overwrites it, which might lock out other keys (like your emergency backup key).
- **"Stupid Question":** Is it safe that my public key is on the internet?
- **Answer:** Yes. A public key is like a padlock you leave open for others to use; the private key is the only thing that needs to be guarded.

---

> [!CHECK] Knowledge Check
> - **Why is this safer than sending keys over email?** Email is often unencrypted and stores copies of the data on multiple servers. While sending a *public* key via email isn't a direct security breach, it creates "clutter" and manual steps where errors occur. The GitHub method pulls directly from a cryptographically signed source (GitHub) to your target.
> - **Why must you verify the username?** If you typo the username (e.g., `netyeti` vs `netyetii`), you might accidentally grant access to a complete stranger. Always `curl` the URL in your browser first to see if the keys look like yours.

---
**Status:** Operational
**Related:** [[Knowledge Base/ssh|SSH Core]], [[Knowledge Base/Networking/index|Networking Index]], [[Internal/Networks/Yeticraft/Devices/index|Device Registry]]
