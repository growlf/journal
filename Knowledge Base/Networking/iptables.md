---
tags:
  - networking
  - security
  - linux
---
# iptables / nftables

> In the Army, we had "Checkpoint Procedures." `iptables` and its successor `nftables` are the foundational checkpoint procedures for Linux.

## Description
- **iptables**: The traditional Linux firewall interface that manages rules for network packets.
- **nftables**: The modern replacement for `iptables` that offers a more efficient and flexible syntax.

## Knowledge Check
- [ ] Have you flushed your existing rules before starting a new configuration?
- [ ] Are your rules being persisted across reboots?

## Common Pitfalls
- **Order of Operations**: Rules are processed in order. If you have a "Drop All" rule at the top, nothing will get through.
- **Locking Yourself Out**: ALWAYS have a way back in (e.g., local console) before you apply new firewall rules remotely.
