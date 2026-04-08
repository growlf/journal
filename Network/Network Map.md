---
Updated: 2026-04-07
tags:
  - network
  - map
  - quartz
  - lab-ops
---
# Network Map 2026

> [!TIP] The Instructor's Perspective
> In a "Manageable Mess," your visual maps are your primary navigation. We use an **Auto-Updating SVG** export for the static site (Quartz). This ensures that every time the source drawing is saved, the published map is automatically refreshed with zero extra steps.

## Current Topology
![[NetworkMap.svg]]

---

## 🛠️ Maintenance & Updates
If the "Ground Truth" changes, follow these steps:
1.  **Open the Source:** [[_assets/NetworkMap.excalidraw|Edit Network Map Source]].
2.  **Update the Drawing:** Add/Move devices as needed.
3.  **Automatic Sync:** The plugin is configured to automatically export an updated **`_assets/NetworkMap.svg`** on save.
4.  **Publish:** Quartz will automatically pick up the new SVG on the next build.

---
**Status:** Operational (Auto-Updating SVG)
**Related:** [[Network/The Stack]], [[Network/Home Lab 101]]
