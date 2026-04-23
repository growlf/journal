---
title: "Project - Local Quartz Orchestration"
tags:
  - project
  - quartz
  - web
  - orchestration
---
# Local Quartz: High-Fidelity Previews

> [!NOTE] The Instructor's Perspective
> "Train as you fight." If we are publishing our forest logs to the web via Quartz, we need a way to verify the "Signal" before it goes live. By containerizing Quartz and injecting our custom themes locally, we can see exactly what the students see, without ever leaving the host.

## 🎯 Project Goal
To establish a robust, containerized workflow for building and previewing Quartz-based sites (like this Journal and Cascade STEAM) with support for modular theme injection.

## 🏗️ The Local Quartz Engine
On this host (**Phoenix**), we maintain a custom fork of Quartz configured with our local modifications.

### Key Components:
1.  **Quartz Repo:** `~/Projects/quartz/` (Branch: `csmods`).
2.  **Custom Image:** `quartz:latest` (Managed via Docker).
3.  **The Orchestrator:** `_assets/_scripts/quartz-preview.sh`.

## 🛠️ High-Fidelity Emulation: `quartz-preview.sh`
This script provides a 1:1 local emulation of the `konstfish/quartz-build-action` CI/CD workflow used in our GitHub Actions.

### Features:
- **JIT Overrides:** Automatically syncs `.github/quartz/quartz.config.ts` and `quartz.layout.ts` from the vault to the build engine before the Docker build.
- **Style Merging:** Instead of replacing the base `custom.scss`, it *appends* theme-specific styles (like the Jungle Grotto) to the existing baseline. This ensures we keep core features like the STEAM dropdown navbar while adding new visual flourishes.
- **Asset Parity:** Syncs the `icon.png` and other static assets to match the production build.
- **Modular Previews:** Supports previewing any site path (Journal, STEAM site, etc.) on configurable ports.
- **Live Preview Initiation:** Optional flag to automatically trigger the local browser to open the newly built site.

### Usage:
```bash
# Usage: ./quartz-preview.sh <SITE_PATH> <THEME_NAME> <QUARTZ_DIR> <PORT> <REBUILD> <OPEN_BROWSER>
./_assets/_scripts/quartz-preview.sh ~/Obsidian/Journal jungle-grotto-theme ~/Projects/quartz 8080 true true
```

## 🎨 Case Study: The Jungle Grotto Theme
The Grotto theme was developed as a "drop-in" set of styles to transform the journal into a lush, jungle-inspired interface.
- **Source:** `_assets/jungle-grotto-theme/custom.scss`
- **Injection Point:** `quartz/styles/custom.scss` in the build image.

## 🧠 Knowledge Check
- Why do we use a Docker container for the preview instead of running `npx quartz` directly on the host?
- How does the `quartz-preview.sh` script handle "Theme Parity" between the vault and the web project?

---
*Related: [[Projects/Project - Yeti_Sidecar Herd Orchestration|Project: Yeti_Sidecar]], [[Knowledge Base/LLM/Hybrid Architecture - The PACE Plan|PACE Plan]], [[Knowledge Base/Development/Obsidian/index|Obsidian Dev]]*
