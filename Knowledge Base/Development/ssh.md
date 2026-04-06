---
tags:
  - remote
  - linux
  - security
  - networking
title: SSH
---
# SSH: The Secure Lifeline

> [!NOTE] The Instructor's Perspective
> In the Army, we had "secure lines of communication." In the Linux world, SSH (Secure Shell) is that line. If you are still using passwords to log into your servers, you are "walking point" without a weapon. Use keys. Every. Single. Time.

## Why use it?
- **Secure Remote Management:** Encrypted access to your command line.
- **Automation:** The foundation for tools like [[Ansible]].
- **File Transfer:** Using `scp` or `sftp` to move data securely.
- **Tunneling:** Securely "wrapping" other traffic (like VNC or web) through an SSH connection.

## Remote Access Reliability (The PACE Plan)
> [!TIP] Access Discipline
> **P (Primary):** SSH Keys via LAN (Internal network).
> **A (Alternate):** SSH Keys via [[Wireguard]] or [[Tailscale]] VPN.
> **C (Contingency):** Proxmox Web Console (No-SSH fallback).
> **E (Emergency):** Physical KVM (Keyboard, Video, Mouse) at the server rack.

## SOP: Managing SSH Keys
1. **Generate:** `ssh-keygen -t ed25519 -C "your_email@example.com"` (Ed25519 is faster and more secure than RSA).
2. **Distribute:** Use `ssh-copy-id user@hostname` to move your public key to the server.
3. **Lock Down:** Edit `/etc/ssh/sshd_config` to set `PasswordAuthentication no`.
4. **The GitHub Trick:** You can pull your public keys from GitHub to a new server using:
   `curl https://github.com/your-username.keys >> ~/.ssh/authorized_keys`

## Check for Understanding
- Why is an Ed25519 key preferred over an RSA key in a modern environment?
- What happens to your **Alternate** plan if your [[Wireguard]] service fails?

---
*Related: [[Network/The Stack]], [[Knowledge Base/Shell]], [[Ansible]]*


