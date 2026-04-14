---
Updated: 2026-04-13
tags:
  - networking
  - deployment
  - instruction
---
# Knowledge Base: PXE Boot & Netbooting

> [!NOTE] The Instructor's Perspective
> "Preboot Execution Environment" (PXE) is the magic of the "Self-Healing Lab." It allows you to boot a computer with **zero** OS on its hard drive. The computer reaches out to the network, grabs an image, and starts running. No USB sticks, no CDs—just signal. It is the "Command and Control" for rapid scaling.

## 1. How it works
1.  **DHCP Discovery:** The client asks the network for an IP and a "Boot Server" address (Options 66 and 67).
2.  **TFTP/HTTP Handshake:** The client downloads a small bootloader (like iPXE or GRUB).
3.  **OS Loading:** The bootloader downloads the actual Linux kernel and initrd over the network.

## 2. Why use it?
- **Mass Deployment:** Install Linux on 10 nodes simultaneously without leaving your chair.
- **Diskless Nodes:** Run specialized hardware (like your Yeti Fleet) without needing local SD cards or SSDs.
- **Recovery:** Boot into a "Rescue System" (like GParted or Clonezilla) to fix a broken ZFS pool.

## 3. Deployment in the NetYeti Lab
We use **[[Internal/Networks/Yeticraft/Devices/Technitium-DNS|Technitium]]** to point PXE clients to our **iVentoy** or **Matchbox** server. 

## 🛡️ Reliability (The iPXE Advantage)
Traditional PXE uses TFTP (which is slow and unreliable). We prefer **iPXE**, which supports **HTTP/HTTPS** boot. This means you can pull your OS image from a web server at much higher speeds.

## ⚠️ Common Pitfalls
- **The "Two Captains" Problem:** Having two DHCP servers on the same network trying to provide PXE options will cause "Radio Silence" for your clients.
- **TFTP Timeout:** If your TFTP server is too slow, the client will give up. This is usually caused by firewall blocks on Port 69 (TFTP) or Port 4011 (ProxyDHCP).
- **Architecture Mismatch:** Attempting to boot an **x86_64** image on an **ARM64** device (like a Raspberry Pi) will result in a boot loop.

## 📝 Knowledge Check
> [!question] Check for Understanding
> 1. What are the two main DHCP options required for PXE to function? (Answer: 66/Next Server and 67/Bootfile Name).
> 2. Why is HTTP boot faster than TFTP?

---
**Status:** Operational
**Related:** [[Knowledge Base/Networking/DNS/Technitium DNS & DHCP]], [[Learning/Home-Lab-Series/Default-Stack-Blueprint|The Stack]]
