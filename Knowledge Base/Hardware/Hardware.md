---
tags:
  - glossary
  - hardware
  - lab-ops
Creation date: Monday April 4th 2022 11:18:30
aliases:
  - server
  - storage
  - router
  - switch
  - ethernet
---
# Hardware: The Physical Foundation

> [!NOTE] The Instructor's Perspective
> In the Army, we had "preventative maintenance." Your hardware is the "steel" of your lab. If it's not reliable, your services will fail. Don't be afraid to start with "garage sale" systems, but always be thinking about your next upgrade.

## Servers (The Hypervisors)
Typical server hardware that I use are Dell R630's with 128GB RAM and 40 cores. However, for a modern "quiet" lab, I highly recommend:
- **Intel NUCs or Micro-PCs:** Low power, quiet, and surprisingly powerful.
- **Modern Hardware:** I'm currently using an **Intel Ultra 9 (Meteor Lake)** with **Intel Arc** graphics for local LLM acceleration.
- **The "Manageable Mess":** Old laptops and desktops are perfectly fine for learning, as long as they support VT-x/AMD-v.

## Storage (The NAS)
I tend to use what-ever 2U option with 16 or more drives that I can get on Amazon Renewed for cheap. But for most, a dedicated 4-bay or 8-bay NAS (or even a custom build with ZFS) is the "heart" of your data ecosystem.

## Networking (Routers, Switches, and APs)
I use gigabit Mikrotik hardware or similar due to them being very affordable yet also extremely capable. For APs, [[Ubiquiti UAP-AC-PRO|Ubiquiti]] is a solid choice.

## Hardware Reliability (The PACE Plan)
> [!TIP] Operational Discipline
> **P (Primary):** Dedicated, rack-mounted servers or high-performance NUCs.
> **A (Alternate):** Single-node "Mini-PC" or high-end desktop for testing.
> **C (Contingency):** Old laptops or "recycled" hardware for temporary services.
> **E (Emergency):** Direct host-based applications running on a fresh Linux install on any available machine.

## Cabling
I generally use [Cat5E](https://www.google.com/search?q=what+is+a+cat5e+cable) for most of my lab, with [DAC](https://www.google.com/search?q=what+is+a+DAC+cable) cables for high-speed local interconnects. Fiber is best for building-to-building runs.

### Toys
Things that just make life interesting and/or are just too cool not to play with. Checkout my [[Gizmos]].

## Check for Understanding
- Why are Intel NUCs or Micro-PCs becoming more popular for home labs than old enterprise servers? (Hint: Think about noise and power).
- What hardware feature is required for modern virtualization? (Hint: Check Step 2 of [[Home Lab 101]]).

---
*Related: [[Knowledge Base/Networking/Router]], [[Knowledge Base/Storage/NAS]], [[Network/The Stack]]*

