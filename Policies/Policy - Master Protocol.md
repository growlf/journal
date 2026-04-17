---
title: "Policy: Master Protocol (Complexity Mandate)"
tags:
  - policy
  - automation
  - standards
---
# 📜 Master Protocol (Complexity Mandate)

> [!NOTE] The Instructor's Perspective
> This protocol, established in the Gemini sister-server, is the foundational law of our automation strategy. It addresses the "NetYeti Paradox"—as we scale our knowledge, manual complexity becomes our greatest enemy. This protocol forces us to build tools rather than just perform tasks.

## 1. The Complexity Law
**Complexity = Tooling.** 
Manual execution of multi-step processes is strictly forbidden if a script or skill can be built to handle it. If a requirement is found to be complex (involving more than 3 steps, multiple files, or cross-node coordination), the agent MUST build a reusable tool first.

## 2. Documentation Mandate
- **Rule:** Every session MUST conclude with a sync to the Obsidian Journal.
- **Content:** Actions, structural changes, and strategic discussions must be logged.
- **Format:** Chronological phases with `> [!failure] Synopsis` for hurdles.

## 3. Efficiency & Resource Protocol (PACE)
- **Primary:** Local Ollama Pool. Offload all possible reasoning and data processing to the local hardware (RTX 3090 Ti on Gemini, Intel Arc on Phoenix).
- **Model Selection:** Use context-appropriate models (SmolLM for snippets, Llama 3.x for strategy, Qwen-Coder for refactoring). Proactively download new models as needed.
- **Compression:** Use sub-agents to "compress" multi-file or repetitive tasks to keep the main session context window optimized.

## 4. Automation & Tooling Protocol
- **Action:** If a reusable tool doesn't exist for a complex requirement, build it first.
- **Verification:** All new tools must be verified against "Ground Truth" before being committed to the `_assets/_scripts/` library.

---
*Status: Codified & Synced*
*Related: [[Policies/Policy - Local Sovereignty Law]], [[Policies/SOP - AI Safety and Data Discipline]]*
