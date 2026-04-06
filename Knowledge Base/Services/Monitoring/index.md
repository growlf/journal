---
title: Monitoring - Your Network's Early Warning System
tags:
  - monitoring
  - grafana
  - ntopng
  - observability
  - lab-ops
---
# Monitoring: Your Network's Early Warning System

> [!NOTE] The Instructor's Perspective
> In the Army, we had "sentry posts" and "reconnaissance patrols." If you don't know what's happening on your network, you're "walking point" blindfolded. Monitoring isn't just about cool graphs; it's about seeing problems before they become critical failures. Whether it's high CPU on your hypervisor or unexpected traffic on your firewall, you need to be the first to know.

## Why use it?
- **Visibility:** See exactly what your network and services are doing.
- **Alerting:** Get notified when things go wrong, not when your users complain.
- **Troubleshooting:** Historical data helps you identify root causes.
- **Capacity Planning:** Know when it's time to upgrade your "backpack" (hardware).

## Monitoring Reliability (The PACE Plan)
> [!TIP] Observability Discipline
> **P (Primary):** Centralized Monitoring Node ([[Knowledge Base/Services/Monitoring/Grafana.md|Grafana]] + [[InfluxDB]]/[[Prometheus]]).
> **A (Alternate):** Real-time network analysis with [[Knowledge Base/Services/Monitoring/NtopNG.md|NtopNG]].
> **C (Contingency):** Basic host-based monitoring (e.g., `top`, `htop`, `nload`) on critical nodes.
> **E (Emergency):** Direct log review with `journalctl` or `/var/log/`.

## SOP: The Monitoring Strategy
1. **Infrastructure Health:** Monitor CPU, RAM, and Disk space on all [[Network/Services/Proxmox/index|Proxmox]] nodes.
2. **Network Traffic:** Use [[Knowledge Base/Services/Monitoring/NtopNG.md|NtopNG]] to see who is talking to who on your [[Knowledge Base/Networking/Firewall.md|Firewall]].
3. **Service Status:** Track the uptime of core services like [[Knowledge Base/Networking/DNS/index.md|DNS]], [[Knowledge Base/Networking/DHCP.md|DHCP]], and [[Knowledge Base/Services/Vaultwarden.md|Vaultwarden]].
4. **Alerting:** Configure alerts for critical thresholds (e.g., Disk Space > 90%).

## Check for Understanding
- Why is it important to have an "Early Warning System" (Primary) instead of just checking logs (Emergency)?
- How does historical data help in the **After Action Review (AAR)** process?

---
*Related: [[Network/The Stack.md|The Stack]], [[Knowledge Base/Networking/Firewall.md|Firewall]], [[_assets/_templates/AAR.md|AAR]]*
