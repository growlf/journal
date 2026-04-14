---
Updated: 2026-04-13
tags:
  - networking
  - deployment
  - instruction
---
# Knowledge Base: PXE Boot & Netbooting

> [!NOTE] The Instructor's Perspective
> "Preboot Execution Environment" (PXE) is the magic of the "Self-Healing Lab." It allows you to boot a computer with **zero** OS on its hard drive. The computer reaches out to the network, grabs an image, and starts running. No USB sticks, no CDs—just signal.

## 1. How it works
1.  **DHCP Discovery:** The client asks the network for an IP and a "Boot Server" address.
2.  **TFTP/HTTP Handshake:** The client downloads a small bootloader (like iPXE or GRUB).
3.  **OS Loading:** The bootloader downloads the actual Linux kernel and initrd over the network.

## 2. Why use it?
- **Mass Deployment:** Install Linux on 10 nodes simultaneously.
- **Diskless Nodes:** Run specialized hardware (like your Yeti Fleet) without needing local SD cards or SSDs.
- **Recovery:** Boot into a "Rescue System" to fix a broken ZFS pool.

## 3. Deployment in the NetYeti Lab
We use **[[Internal/Networks/Yeticraft/Devices/Technitium-DNS|Technitium]]** to point PXE clients to our **iVentoy** or **Matchbox** server.

---
**Status:** Operational
**Related:** [[Knowledge Base/Networking/DNS/Technitium DNS & DHCP]], [[Network/The Stack]]
