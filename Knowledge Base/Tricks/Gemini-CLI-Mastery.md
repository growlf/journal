---
tags:
  - ai
  - gemini-cli
  - tutorial
  - tricks
Creation date: 2026-04-15 14:45
---
# 🪄 Gemini CLI Mastery: Pro-Tips for the Yeti's Council

The Gemini CLI is more than just a chat interface; it's the **Command & Control (C2)** hub for the entire home lab. Here are some advanced "tricks" found over the years to make the tool more efficient and reliable.

## 🤝 1. The Warden's Handshake
Always start your session with a "Handshake." In this vault, we use `_assets/_scripts/warden-handshake.sh`.
- **Why:** It synchronizes the backlog across all daily notes and presenting a unified "Tactical Briefing." 
- **Benefit:** Ensures the AI assistant (and the NetYeti) are working from the same "Forest Intelligence."

## 🤖 2. Master the Art of Delegation
Your context window is a precious resource. Don't let the main AI do everything.
- **Sub-Agents:** Use the `generalist`, `chronicler`, `pathfinder`, etc. 
- **The Secret:** Delegation "compresses" the sub-agent's entire work into a single summary in your main session history. This keeps the main loop fast and tokens low.

## 📝 3. The `GEMINI.md` Protocol
If a project needs specific rules (like the "Zero-Bake Law" or "Local Sovereignty Law"), put them in a `GEMINI.md` file at the root of the project.
- **Why:** The CLI automatically ingests this file as system instructions for that directory.
- **Trick:** You can "teach" the AI new skills or SOPs just by adding them to this file—no plugin development required.

## ✂️ 4. Surgical Precision with `replace`
Avoid using `write_file` for existing documentation. 
- **Why:** `write_file` overwrites the whole thing, which is risky and token-heavy.
- **The Trick:** Use `replace` with exact `old_string` matches. It's faster, preserves existing formatting, and is much harder for the AI to mess up.

## 🔒 5. The Zero-Bake Mandate (Security)
NEVER hardcode keys or passwords. 
- **The Trick:** Use the `lock-smith` sub-agent or `bw get item` directly. This ensures secrets are only in memory during the task and never committed to the vault's history.

---
**Status:** Documented (2026-04-15)
**Related:** [[Knowledge Base/LLM/More Powers for Gemini]], [[System/GEMINI.md]]
