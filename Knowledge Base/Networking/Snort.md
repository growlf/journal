---
tags:
  - security
  - networking
  - ids
  - ips
---
# Snort and Suricata

> In the Army, we had "Intrusion Detection Sentries." Snort and Suricata are your digital sentries for the network.

## Description
- **Snort**: The original, open-source network intrusion detection system (IDS) and intrusion prevention system (IPS). It's incredibly powerful but can be complex to tune.
- **Suricata**: A modern, high-performance IDS/IPS/NSM (Network Security Monitoring) engine. It's multi-threaded and offers some performance advantages over Snort in high-speed environments.

Both can be run on [[pfSense]] or [[OPNsense]] to monitor and block malicious traffic.

## Knowledge Check
- [ ] Are you in "Legacy Mode" or "Inline IPS Mode"?
- [ ] Have you tuned your rules to minimize false positives?

## Common Pitfalls
- **High CPU Usage**: IDS/IPS engines are very resource-intensive. Ensure your firewall has enough CPU and RAM.
- **Breaking Connectivity**: Poorly tuned rules can block legitimate traffic. Always start in "Detection Only" mode.
