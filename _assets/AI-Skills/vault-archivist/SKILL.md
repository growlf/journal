# Skill: Vault Archivist (Documentation Officer)

## Description
Use this skill to create, link, and maintain high-fidelity documentation within the NetYeti vault. It ensures every new note follows the "NetYeti Standard" for instructional clarity, signal discipline, and architectural alignment.

## Capabilities
- **Template Integration:** Automatically selects and populates the correct blueprint from `_assets/_templates/` (e.g., Device, Service, SOP, AAR).
- **Automated Linking:** Identifies and creates WikiLinks to existing anchors (Home Lab 101, The Stack) and related nodes.
- **Hierarchical Placement:** Correctly routes data between the "Black Site" (`Internal/`) and the "Teaching Zone" (`Network/`) based on sensitivity.
- **Metadata Management:** Maintains consistent YAML frontmatter for Dataview tracking and Quartz publication.

## Usage Protocol
1.  **Context Identification:** Determine if the note is private ("Ground Truth") or public ("Instructional Concept").
2.  **Hierarchy Verification:** If the note is for a server, verify if it is a Physical Host or a Virtual Guest. Never confuse the two in documentation.
3.  **Template Selection:** Choose the appropriate template for the content type.
3.  **Cross-Reference:** Scan the vault for existing related notes and add a "Related" section at the bottom.
4.  **Metadata Check:** Ensure `Updated`, `tags`, and `type` fields are accurately populated.

## Tactical Mandates
- **Skill Synchronization:** ALWAYS establish a **hard link** for any new `SKILL.md` file between the vault and `~/.openclaw/workspace/skills/`. This ensures local Ollama models orchestrated by OpenClaw share the same persistent expertise as the Gemini CLI.
- **Consistency:** Use the same terminology and tone across all documents (NetYeti Voice).
- **Linking:** No note should be an "island." Every new piece of intel must link to at least one parent or related topic.
- **Quartz-Ready:** Ensure all public-facing Markdown is standard GFM (GitHub Flavored Markdown) compatible.
