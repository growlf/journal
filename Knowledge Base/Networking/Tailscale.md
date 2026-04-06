---
tags:
  - networking
  - security
  - vpn
  - mesh
title: Tailscale - The zero-config VPN
---
# Tailscale: Your Personal Mesh Network

> [!NOTE] The Instructor's Perspective
> In the Army, we had "secure communications channels." Tailscale is the easy-to-use version of that. It's built on [[Wireguard]] but handles all the difficult "NAT traversal" and "key management" for you. It's the "easy button" for home lab remote access.

## Why use it?
- **Zero Config:** No port forwarding needed (mostly).
- **Secure:** Based on [[Wireguard]], but uses your existing SSO (Google, Microsoft, GitHub) for authentication.
- **Mesh Networking:** Every node can talk to every other node directly.
- **Magic DNS:** Access your devices by name (e.g., `nas.tailnet-name.ts.net`).

## Mesh Network Reliability (The PACE Plan)
> [!TIP] Connectivity Discipline
> **P (Primary):** Tailscale on all devices (Laptop, Phone, Servers).
> **A (Alternate):** Manual [[Wireguard]] VPN tunnel for "backdoor" access.
> **C (Contingency):** Secondary VPN service or SSH access via a Jump Host.
> **E (Emergency):** Direct connection with host-based firewalls (UFW/Firewalld) active.

## Standard Operating Procedure (SOP): Joining the Tailnet
1. **Install Tailscale:** Download the client for your OS.
2. **Authenticate:** Sign in with your SSO provider.
3. **Join the Tailnet:** Your device is now connected to all your other devices.
4. **Configure Subnet Routing (Optional):** Allow Tailscale to access your entire home LAN (e.g., `192.168.1.x/24`).
5. **Verify Connection:** Use `ping` or `ssh` to test the connection.

## Check for Understanding
- Why is Tailscale often better for residential users than manual [[Wireguard]]? (Hint: Think about "Dynamic IP" addresses).
- What is "Subnet Routing," and how does it help you access non-Tailscale devices on your network?

---
*Related: [[Knowledge Base/Networking/Wireguard]], [[Knowledge Base/Networking/Router]], [[Network/The Stack]]*
