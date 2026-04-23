---
title: AI & LLMs
tags:
  - machine-learning
  - llm
  - ai
  - educational-tools
aliases:
  - "AI Command Center"
---
# AI & LLMs: Intelligence Augmentation

> [!NOTE] The Instructor's Perspective
> I am an avid supporter of AI and education. We need to understand the power of this new tool that humanity has created. However, remember that every tool can also be used as a weapon in the hands of the wrong people. In our labs, we use LLMs as "force multipliers" for learning and coding, but we never follow them blindly. Maintain your "signal discipline"—verify everything.

## The Story: How we got here
Before you dive into the technical details, read **[[Knowledge Base/LLM/The AI Homelab Story|The AI Homelab Story]]**. It's the cohesive narrative of our move from a "manageable mess" of manual builds to a high-performance, **Local-First Agentic Framework**.

## Why use it?
- **Synthesis:** Summarize large buckets of data and find hidden synergies.
- **Force Multiplier:** Speed up coding and configuration tasks with **Aider** and **Qwen 2.5 Coder**.
- **Agentic Framework:** Use **[[Knowledge Base/LLM/OpenClaw|OpenClaw]]** to give AI "hands" via local tools.
- **Educational Peer:** Use it to "rubber duck" ideas and ask the "stupid questions."

> [!SUCCESS] Knowledge Gained: The Containerized SYCL Victory (Updated April 8, 2026)
> For a long time, we were battling broken symlinks and failing services (`ollama.service`, `llama-serve.service`).
> 
> **The Breakthrough:** We've shifted entirely to a **Containerized SYCL (ava-agentone)** stack using the `ghcr.io/ava-agentone/ollama-intel` image.
> - **Tactical Correction:** The original `intelanalytics` image was archived in early 2026. Switching to the community-maintained `ava-agentone` build restored GPU acceleration and stability.
> - **Single Source of Truth:** All local AI tools now point to **Port 11434** (Ollama Docker). The legacy `llama-server` (Port 8081) and host-level systemd services have been decommissioned.
> - **Outcome:** By aligning the volume mapping and explicitly passing DRM nodes (`/dev/dri/card1` and `renderD128`), our **Primary (P)** local AI stack is finally "in the fight."

## AI Reliability (The PACE Plan)
> [!TIP] Information Discipline
> **P (Primary):** Local Ollama Docker Instance (**gemma3:12b**, **qwen2.5-coder:14b**, **deepseek-r1:14b**) with Intel Arc (SYCL) acceleration.
> **A (Alternate):** **Gemini (Cloud)** for complex synthesis and cross-vault strategy via **[[Knowledge Base/LLM/OpenClaw|OpenClaw]]**.
> **C (Contingency):** Secondary local nodes (e.g., [[Sparse Page]]) or manual `llama.cpp` builds.
> **E (Emergency):** Human expertise and physical reference books.

## SOP: AI Delegation & Usage
1. **Delegate Routine Tasks:** Use the **Primary (P)** local AI for coding assistance, summarization, and formatting.
2. **Orchestration:** **OpenClaw** acts as the Command and Control (C2) layer, linking your brains to your tools.
3. **Never Trust, Always Verify:** Treat every AI output as a "draft" that needs human review.
4. **Protect Intel:** Never feed sensitive passwords or private data into external AI.


## LLM Knowledge Tree
```dataview
TABLE join(sort(rows.file.link), " | ") as Documents
FLATTEN regexreplace(file.folder, ".*/", "") as lastPart
WHERE contains(file.folder, this.file.folder) AND file.name != this.file.name
GROUP BY lastPart as Folder
SORT lastPart
```

## Recent Changes
```dataview
TABLE 
  file.ctime AS "Created", 
  file.mtime AS "Updated"
WHERE (file.cday >= date(today) - dur(7 days) OR file.mday >= date(today) - dur(7 days))
  AND contains(file.folder, this.file.folder) AND file.name != this.file.name
SORT file.mtime DESC
LIMIT 10
```

## Check for Understanding
- Why is it important to have a **Local LLM** (Primary) instead of just relying on cloud services (Alternate)?
- How can an AI be used as a "weapon" if not handled with proper "signal discipline"?

---
*Related: [[Knowledge Base/LLM/NetYeti System Prompt|AI System Prompt]], [[Knowledge Base/Shell]], [[Knowledge Base/GIT]]*
