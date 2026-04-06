---
tags:
  - dns
  - networking
  - security
---
# Unbound

> In the Army, we had "Secure Information Channels." Unbound is your secure, recursive DNS channel.

## Description
Unbound is a validating, recursive, caching DNS resolver. It's designed to be fast, secure, and lean. In our lab, it's often used on our firewalls ([[pfSense]]/[[OPNsense]]) to provide local DNS resolution with DNSSEC support.

## Knowledge Check
- [ ] Have you enabled DNSSEC validation?
- [ ] Are you using any upstream resolvers (e.g., Cloudflare, Google, Quad9)?

## Common Pitfalls
- **Cache Poisoning**: Ensure you have basic protections against cache poisoning.
- **Upstream Latency**: If your upstream resolvers are slow, your entire network will feel sluggish.
---
*Related: [[Knowledge Base/Networking/DNS/index.md|DNS]], [[Knowledge Base/Networking/Firewall.md|Firewall]]*
