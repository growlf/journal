---
Updated: 2026-04-12
tags:
  - learning
  - series
  - instruction
  - proxmox
module_id: 2
phase: The Hypervisor
---
# Module 2: The Ground Truth (Proxmox VE)

> [!NOTE] The Instructor's Perspective
> Proxmox is the "Execution Plane" of our lab. It turns one physical machine into a hundred virtual possibilities. But remember the NetYeti rule: **Install once, automate forever.** We use "Golden Images" so we never have to click through an OS installer ever again.

## 🎯 Learning Objectives
By the end of this module, you will:
- [ ] Install Proxmox VE 8.x/9.x with a ZFS local-zfs pool.
- [ ] Establish "Signal Discipline" via the Command Line Interface (CLI).
- [ ] Create your first "Golden Image" template using Cloud-Init.

---

## 🧭 Tactical Overview
We use Proxmox because it's open-source, enterprise-grade, and has a powerful API. We don't just "install VMs"—we define them. By using **ZFS**, we get instant snapshots and protection against data corruption.

---

## 🛠️ Step-by-Step Implementation
### 1. The Installation Handshake
Burn the ISO to a USB and boot. Choose **ZFS (RAID0 or RAID1)** for your target disk. Set a static IP—DHCP is for guests, not for the "Command Post."

### 2. Post-Install Hardening
Connect to the web UI (`https://[IP]:8006`). Immediately run the "Post-Install" scripts to disable the "No Subscription" nag and enable the community repositories.

### 3. The Core Service "Operations Order"
Once Proxmox is online, we deploy our critical infrastructure in this specific sequence:
1.  **Technitium:** The "Traffic Hub" for DNS and DHCP.
2.  **WireGuard:** Secure "Stealth Mode" remote access.
3.  **Apt-Cacher NG:** Bandwidth discipline for all updates.
4.  **Homepage:** The central dashboard for the lab.

### 4. The Golden Image Workflow
Don't upload ISOs for every VM. Download a **Cloud-Init** image (Ubuntu/Debian). 

---

## ⚠️ Common Pitfalls & "Stupid Questions"
- **Pitfall:** Forgetting the `qemu-guest-agent`.
- **Fix:** Always install the agent in your template so Proxmox can see the IP address.
- **"Stupid Question":** "Why ZFS? Isn't it a RAM hog?"
- **Answer:** Yes, it likes RAM, but it gives you "Bit-Rot" protection and instant backups. In a Self-Healing lab, ZFS is your primary defense.

---

> [!CHECK] Knowledge Check
> - What is the difference between an LXC and a VM?
> - Why do we use Cloud-Init instead of manual installers?
> - What port does the Proxmox Web UI listen on?

---
**Next Module:** [[Learning/Home-Lab-Series/Modules/03-GitOps|The Blueprint (GitOps)]]
**Status:** Operational
**Related:** [[Internal/Networks/Yeticraft/Services/Proxmox]], [[Policies/SOP - Deploying a New LXC]]
