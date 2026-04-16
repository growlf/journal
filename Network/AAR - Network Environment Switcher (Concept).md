---
tags:
  - AAR
  - lab-notes
  - automation
  - network
date: 2026-04-15
title: AAR - Network Environment Switcher (Concept)
---
# After Action Review: Network Environment Switcher (Concept)

> [!INFO] Instructional Context
> This AAR documents the methodology used to automate network environment switching for a multi-homed workstation. Specific identifiers (SSIDs/IPs) have been sanitized for public documentation.

## 🫡 Mission Summary
Automate `firewalld` zone switching and VPN (WireGuard) management based on the physical network environment (Home, Work, Community Makerspace).

## 📊 Performance Review (What Happened)
1.  **Recon:** Verified current `nmcli` connections and local subnet patterns for each environment.
2.  **Logic:** Developed a bash script `_assets/_scripts/network-env-switch.sh` that detects the active SSID or IP subnet to determine the appropriate profile.
3.  **Automation:** Integrated the script into the system's network dispatcher to trigger on connection changes.
4.  **Security:** Linked the switcher to the existing `sanitize-network.py` script to ensure environment changes trigger an audit of sensitive documentation.

## 🛠️ Tactical Setup (PACE)
- **P (Primary):** System dispatcher triggering the automation script.
- **A (Alternate):** Manual execution of the environment switch script.
- **C (Contingency):** Failover to a "Public" (stealth) firewall zone if no matching environment is found.
- **E (Emergency):** Manual firewall override to a "Drop All" state.

## 🧠 Knowledge Checks & Pitfalls
- **Dispatcher Permissions:** Scripts must be owned by the system user with appropriate permissions to run.
- **Environment Mapping:** Specific SSIDs are mapped to the public zone for diagnostic purposes when testing VPN connectivity from remote sites.
- **Interface Naming:** Logic handles common wireless and ethernet interface naming patterns to ensure portability.

## 🚀 Next Steps
- [x] Test the automatic transition between Home and Remote environments.
- [x] Verify VPN status upon arrival at remote locations.

---
**Status:** Complete (Sanitized)
**Related:** [[Knowledge Base/Networking/Firewall]], [[_assets/_scripts/network-env-switch.sh]]
