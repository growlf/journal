---
Updated: 2026-04-12
tags:
  - learning
  - series
  - instruction
  - hardware
module_id: 1
phase: Foundations
---
# Module 1: The Physical Pillars (Hardware)

> [!NOTE] The Instructor's Perspective
> You don't need a server rack to start, but you do need "Smart Silicon." In 2026, we prioritize efficiency and AI-readiness. We aren't just looking for "fast" CPUs; we're looking for hardware that can accelerate our local LLMs without melting our power bill.

## 🎯 Learning Objectives
By the end of this module, you will:
- [ ] Understand why "Meteor Lake" and "Intel Arc" are the 2026 baseline.
- [ ] Identify the critical specs for an automation-ready host.
- [ ] Prepare your BIOS/UEFI for the Proxmox mission.

---

## 🧭 Tactical Overview
The physical foundation of the Self-Healing Lab consists of three primary roles:
- **The Edge:** Handles perimeter defense and subnet segmentation.
- **The Engine:** Where "all the things" virtual (Proxmox) live. This is our focus for this module.
- **The Bridge:** Provides residential WiFi and IoT isolation.

We use the **Lenovo ThinkSystem ST250** (or similar Meteor Lake hardware) as our primary **Engine** because it offers a massive core count and integrated Intel Arc graphics.

---

## 🛠️ Step-by-Step Implementation
### 1. Identify the Compute Node
Look for a system with at least 16 cores and 32GB of RAM. The "Sweet Spot" for 2026 is the Intel Meteor Lake architecture due to its built-in NPU and Arc iGPU.

### 2. Verify Storage Speed
Mechanical drives are for archives. Your boot drive and container storage **must** be NVMe or enterprise SSDs. We will use ZFS for the "Self-Healing" bit, so ensure you have matched pairs if you want redundancy.

### 3. BIOS Lockdown
Disable "Secure Boot" (it interferes with Proxmox kernels) and enable **VT-x / AMD-V** and **IOMMU**. This is non-negotiable for passing through that GPU to our AI containers later.

---

## ⚠️ Common Pitfalls & "Stupid Questions"
- **Pitfall:** Using a consumer "All-in-One" with locked BIOS.
- **Fix:** Check for "Virtualization Support" in the manual before you buy.
- **"Stupid Question":** "Can I just use my old gaming laptop?"
- **Answer:** Yes! In fact, the Yeti uses an Asus Zenbook Duo as a portable command station. If it has a modern iGPU, it's a perfect starter node.

---

> [!CHECK] Knowledge Check
> - Why is IOMMU important for our AI stack?
> - What is the minimum RAM recommendation for a multi-LXC lab?
> - Why are we prioritizing Intel Arc over older dedicated GPUs?

---
**Next Module:** [[Learning/Home-Lab-Series/Modules/02-Proxmox|The Ground Truth (Proxmox)]]
**Status:** Operational
**Related:** [[Learning/Home-Lab-Series/index]], [[Network/Devices/Hypervisor]]
