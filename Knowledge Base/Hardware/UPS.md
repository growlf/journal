---
title: UPS - Uninterruptible Power Supply
---

# The NetYeti's Guide to Not Losing Data: UPS

In the home lab, power is your most critical dependency. A UPS (Uninterruptible Power Supply) isn't just about keeping the lights on; it's about a "Graceful Shutdown." 

## Why You Need One
- **Data Integrity:** Sudden power loss during ZFS writes or database transactions is the fastest way to a "manageable mess."
- **Hardware Longevity:** Brownouts and surges kill power supplies and motherboards.
- **Service Continuity:** Keep your router and core services up during short blips.

## PACE Plan for Power
- **P (Primary):** Utility Power (Grid).
- **A (Alternate):** UPS Battery Backup.
- **C (Contingency):** Automatic Shutdown Script (triggered at 20% battery).
- **E (Emergency):** Manual intervention / Generator.

## Software Stack
To manage your UPS, you'll typically use:
1.  **NUT (Network UPS Tools):** The industry standard for managing multiple devices from one UPS.
2.  **APCUPSD:** Specifically for APC brand units, very reliable and simple to configure.

### Knowledge Check:
- Is your UPS battery tested annually?
- Do your servers actually shut down when the signal is sent? (Test it!)

> [!TIP]
> Always over-provision your UPS by at least 20% of your total lab draw to account for battery degradation over time.
