---
tags:
  - networking
  - wireless
title: WiFi Access Points (WAP)
---
# WiFi: The Invisible Tether

> [!NOTE] The Instructor's Perspective
> In the Army, we learned about "signal discipline." WiFi is convenient, but it's also a shared medium. If you're using it for everything, your performance will suffer. In our labs, we're using things like [[Ubiquiti UAP-AC-PRO]] or other enterprise-grade access points to ensure we have a reliable, segmented wireless network.

## Why use it?
- **Mobility:** Convenience for devices that aren't bolted down (e.g., your student laptops).
- **Segmentation:** Creating a separate "Guest" or "IoT" SSID to keep those devices away from your core lab infrastructure.
- **Reach:** Getting connectivity into those awkward corners where you can't run a cable.

## WiFi Reliability (The PACE Plan)
> [!TIP] Connectivity Discipline
> **P (Primary):** Dedicated hardware Access Points (e.g., Ubiquiti/TP-Link Omada).
> **A (Alternate):** Integrated WiFi on your main [[Knowledge Base/Router|Router]].
> **C (Contingency):** Mobile hotspot for emergency management access.
> **E (Emergency):** Ethernet cable (The ultimate "No-WiFi" fallback).

## Standard Operating Procedure (SOP) Best Practices
1. **WPA3/WPA2-AES:** Always use the strongest encryption available. Avoid WPA or WEP at all costs.
2. **SSID Separation:** Keep your "Lab" traffic separate from your "Personal" traffic.
3. **Firmware Updates:** Access points are internet-facing. Keep them updated.

## Check for Understanding
- Why should we avoid using a single SSID for both our lab and our guests?
- If the WiFi goes down, what is the fastest way to regain access to your [[Internal/Networks/Yeticraft/Services/Proxmox/index|Proxmox]] node?

---
*Related: [[Learning/Home-Lab-Series/Default-Stack-Blueprint|The Stack]], [[Knowledge Base/Firewall]], [[Ubiquiti UAP-AC-PRO]]*
