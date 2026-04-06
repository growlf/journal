---
tags:
  - networking
  - security
  - vpn
title: WireGuard - The modern VPN
---
# WireGuard: The Modern Perimeter Sentry

> [!NOTE] The Instructor's Perspective
> In the Army, we had "secure communications channels." WireGuard is the modern, fast, and simple version of that. It's much easier to configure than OpenVPN and significantly faster. It's the "stealth mode" for your home lab.

## Why use it?
- **Speed:** Minimal overhead compared to other VPN protocols.
- **Security:** Uses state-of-the-art cryptography (Curve25519, ChaCha20, etc.).
- **Simplicity:** Very small codebase (under 4,000 lines), making it easier to audit and secure.
- **Stealth:** It's "silent" by default—it won't respond to scans unless the client has the correct key.

## VPN Reliability (The PACE Plan)
> [!TIP] Remote Access Discipline
> **P (Primary):** [[Tailscale]] (Zero-config, peer-to-peer mesh using WireGuard).
> **A (Alternate):** Self-hosted WireGuard instance on your [[Knowledge Base/Networking/Router|Router]] (pfSense/OPNsense).
> **C (Contingency):** Secondary WireGuard instance on a standalone [[Knowledge Base/Virtualization/LXC|LXC]] or [[Knowledge Base/Virtualization/Docker/index|Docker]] host.
> **E (Emergency):** SSH jump box with public-key authentication only (The "No-VPN" fallback).

## Standard Operating Procedure (SOP): Setting up a Tunnel
1. **Generate Keys:** Create your public and private key pairs.
2. **Define Peers:** Configure the "Server" (Hub) and "Client" (Spoke) keys.
3. **Configure the Interface:** Assign internal IP addresses (e.g., `10.0.0.x/24`).
4. **Firewall Rules:** Allow UDP port 51820 (or your custom port) on the WAN.
5. **Verify Handshake:** Ensure that your data is flowing securely.

## Check for Understanding
- Why is WireGuard considered "stealthier" than older VPN protocols?
- What is the main difference between a **Primary** Tailscale setup and an **Alternate** manual WireGuard setup? (Hint: Think about NAT traversal).

---
*Related: [[Knowledge Base/Networking/Tailscale]], [[Knowledge Base/Networking/Router]], [[Network/The Stack]]*
