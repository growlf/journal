---
tags:
  - hardware
  - wifi
  - ubiquiti
title: Ubiquiti UAP-AC-PRO
---
# Ubiquiti UAP-AC-PRO: The Wireless Workhorse

> [!NOTE] The Instructor's Perspective
> In the Army, we had "radio systems." A Ubiquiti UAP-AC-PRO is your high-performance radio system for the home lab. It's reliable, supports 802.11ac, and integrates perfectly with the UniFi Controller. It's the "gold standard" for home lab WiFi.

## Why use it?
- **Enterprise-Grade:** Built for reliability and high-density environments.
- **Dual-Band:** Supports both 2.4GHz and 5GHz frequencies.
- **PoE (Power over Ethernet):** Only one cable needed for both power and data.
- **VLAN Support:** Essential for segmenting your network (e.g., Guest vs. Lab).

## Wireless Reliability (The PACE Plan)
> [!TIP] Connectivity Discipline
> **P (Primary):** Ubiquiti UAP-AC-PRO (Managed via UniFi Controller).
> **A (Alternate):** Secondary AP or a mesh node.
> **C (Contingency):** Integrated WiFi on your [[Knowledge Base/Networking/Router|Router]].
> **E (Emergency):** Ethernet cable.

## Standard Operating Procedure (SOP) Best Practices
1. **Controller Management:** Use a UniFi Controller (LXC or Docker) to manage your AP settings.
2. **Channel Planning:** Don't just leave it on "Auto." Manually select non-overlapping channels (1, 6, 11 for 2.4GHz).
3. **SSID Segmentation:** Use VLANs to create a "Lab" SSID that is entirely isolated from your "Home" traffic.

## Check for Understanding
- Why is PoE (Power over Ethernet) so helpful for AP placement?
- How does the UniFi Controller help you manage multiple access points?

---
*Related: [[Knowledge Base/Networking/WiFi]], [[Knowledge Base/Hardware/Hardware]], [[The Stack 1]]*
