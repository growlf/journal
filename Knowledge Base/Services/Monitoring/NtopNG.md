---
Ports: 3000 (standard), often configured on 80/443
tags:
  - networking
  - monitoring
service description: High-speed web-based traffic analysis and flow collection.
Documentation: https://www.ntop.org/products/traffic-analysis/ntopng/
---
# NtopNG

> In the Army, we had "Signals Intelligence (SIGINT)." NtopNG is your SIGINT for the network.

## Description
ntopng is the next-generation version of the original ntop, a network traffic probe that monitors network usage. It's an incredible tool for seeing exactly who is talking to who and how much bandwidth they are consuming.

In our lab, it's our **A (Alternate)** monitoring layer, perfect for deep dives into network traffic.

## Knowledge Check
- [ ] Is it listening on the correct interface (e.g., your LAN or a mirror port)?
- [ ] Have you configured alerts for suspicious traffic patterns?

## Common Pitfalls
- **Resource Intensive**: High-speed traffic analysis can be CPU and RAM intensive. Ensure your hardware can handle the throughput.
- **Privacy**: Be mindful of what data you are capturing and who has access to the dashboard.
