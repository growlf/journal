---
Updated: 2026-04-12
tags:
  - learning
  - series
  - instruction
  - obsidian
  - documentation
module_id: 5
phase: Memory & Visibility
---
# Module 5: The Tactical Notebook (Documentation)

> [!NOTE] The Instructor's Perspective
> A lab without documentation is just an expensive heater. In this module, we build your **Tactical Notebook** using Obsidian. But we aren't just writing notes—we're creating an automated, linked "Source of Truth" that publishes itself to the web.

## 🎯 Learning Objectives
By the end of this module, you will:
- [ ] Set up an **Obsidian Vault** with the "NetYeti Folder Structure."
- [ ] Use **Dataview** to create live, automated dashboards.
- [ ] Sync your internal "Black Site" data while publishing "Sanitized Concepts" via Quartz.

---

## 🧭 Tactical Overview
We use **Obsidian** because it uses plain Markdown files. This means your documentation is future-proof and can be read by your AI agents. We use **Quartz** to turn those notes into a fast, searchable website for your students or peers to follow.

---

## 🛠️ Step-by-Step Implementation
### 1. The Folder Hierarchy
Organize your vault into `Internal/` (private logs) and `Network/` (public concepts). Use your `.gitignore` to ensure the private stuff never leaves your machine.

### 2. Automation with Dataview
Don't manually list your servers. Use a Dataview query:
`TABLE IP, status FROM "Network/Devices"`
This ensures your index page is always accurate to the files in your vault.

### 3. The Quartz Sync
Connect your vault to a GitHub repository. Use the `Bake and Commit` workflow to update your data and push it to the web. Your lab is now a living educational resource.

---

## ⚠️ Common Pitfalls & "Stupid Questions"
- **Pitfall:** Leaking real IPs or passwords in your public folder.
- **Fix:** Always check your `[[Internal/]]` links before you push. Use "Concept Twins" for sensitive hardware.
- **"Stupid Question":** "Do I have to document *everything*?"
- **Answer:** No. Document the "Why" and the "How." The "What" should be handled by your automation scripts.

---

> [!CHECK] Knowledge Check
> - Why do we use a two-tiered folder structure (Internal vs Network)?
> - How does **Dataview** reduce "Documentation Friction"?
> - What is the role of **Quartz** in our educational mission?

---
**Course Wrap-up:** [[Learning/Home-Lab-Series/index|Back to Syllabus]]
**Status:** Operational
**Related:** [[Knowledge Base/Development/Obsidian/index]], [[Learning/Home-Lab-Series/index|Home Lab 101]]
