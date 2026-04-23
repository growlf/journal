# Skill: Public Signal Sanitizer (OPSEC Bridge)

## Description
Use this skill to maintain the boundary between the internal "Black Site" (`Internal/`) and the public "Teaching Zone" (`Network/`). It automates the sanitization of sensitive lab data for public instruction.

## Capabilities
- **Automated Scrubbing:** Runs the `sanitize-network.py` tool to generate "Concept Twins."
- **Leakage Audit:** Scans public files for accidental exposure of real IPs, MACs, or internal paths.
- **Visual Redaction:** Manages the export of sanitized SVGs from private Excalidraw sources.
- **Link Integrity:** Ensures public pages do not contain broken links to private internal files.

## Usage Protocol
1.  **Trigger:** Initiate after any update to `Internal/Devices/` or `Internal/Networks/`.
2.  **Scrub:** Execute the sanitization engine to refresh the `Network/` folder.
3.  **Audit:** Run recursive grep for `Internal/` or real subnet strings in public directories.
4.  **Verification:** Confirm that [[Sparse Page]] correctly embeds the public SVG.

## Tactical Mandates
- **OPSEC First:** If in doubt, omit the link or sanitize the data.
- **Standardization:** Always use documentation-only IP ranges (RFC 5737) for public concepts.
