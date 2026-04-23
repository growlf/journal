---
name: quartz-architect
description: Expert in the Quartz/Obsidian workflow. Handles theme injection, local site building via Docker, and high-fidelity previews. Use this to manage the visual presentation of the journal and other STEAM projects.
---
# Quartz-Architect Power

## The Quartz Workflow
We use a **Custom Quartz Fork** (`csmods` branch) to power our public signal. 

## Key Skills

### 1. Theme Management
We treat themes as "drop-in" assets. 
- **Vault Location:** `_assets/<theme-name>/custom.scss`
- **Injection:** To update a theme, copy its SCSS to `~/Projects/quartz/quartz/styles/custom.scss` and rebuild the Docker image.

### 2. Local Preview Orchestration
Use the `_assets/_scripts/quartz-preview.sh` script to launch a preview.
- **Port 8080:** The default for the Journal.
- **Port 8081+:** Use for secondary sites or Cascade STEAM clones.
- **Live Preview:** Pass `true` as the 6th argument to automatically trigger `xdg-open` or `open` and launch the browser immediately after the build.

### 3. Build & Troubleshoot
If the site fails to render:
1.  Check the logs: `docker logs -f quartz-preview`.
2.  Force a rebuild: Pass `true` as the final argument to the orchestrator script.
3.  Verify the mount: Ensure the `<SITE_PATH>` correctly contains an `index.md`.

## Strategic Mandate
Always use **Local Previews** before pushing changes to the `publish` branch on GitHub. This ensures the "NetYeti" brand remains high-fidelity and "Sanitized Concepts" are formatted correctly for the public.

---
*Related: [[Projects/Project - Local Quartz Orchestration|Project: Local Quartz]], [[Knowledge Base/Development/Obsidian/index|Obsidian Dev]]*
