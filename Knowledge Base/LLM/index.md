---
title: AI & LLMs: The Intelligence Augmentation
tags:
  - machine-learning
  - llm
  - ai
  - educational-tools
---
# AI & LLMs: Intelligence Augmentation

> [!NOTE] The Instructor's Perspective
> I am an avid supporter of AI and education. We need to understand the power of this new tool that humanity has created. However, remember that every tool can also be used as a weapon in the hands of the wrong people. In our labs, we use LLMs as "force multipliers" for learning and coding, but we never follow them blindly. Maintain your "signal discipline"—verify everything.

## Why use it?
- **Synthesis:** Summarize large buckets of data and find hidden synergies.
- **Force Multiplier:** Speed up coding and configuration tasks.
- **Educational Peer:** Use it to "rubber duck" ideas and ask the "stupid questions."
- **Brainstorming:** Generate ideas for projects and "manageable messes."

> [!SUCCESS] Knowledge Gained: The SYCL Breakthrough (April 2026)
> For a long time, we relied on **Vulkan** for Intel Arc acceleration. It worked, but it was "noisy," inefficient with VRAM (often spilling into System RAM/Swap), and capped out at ~5-8 t/s.
> 
> **The Fix:** Switching to **SYCL** via Intel oneAPI (`icpx`).
> - **Efficiency:** Memory footprint for a 7B model dropped from ~30GB (System+Swap) to **~5GB dedicated VRAM**.
> - **Performance:** Significant speed increase and system stability (no more OOM kills).
> - **Implementation:** Requires building `llama.cpp` from source with `GGML_SYCL=ON`. See the [[Arc-GPU-Optimization-Guide]] for the technical details.

## AI Reliability (The PACE Plan)
> [!TIP] Information Discipline
> **P (Primary):** Local LLM instance (e.g., [[Ollama]]) for privacy and offline access.
> **A (Alternate):** Privacy-focused API services (e.g., Claude, OpenAI) with non-sensitive data.
> **C (Contingency):** Pre-generated local knowledge bases and documentation.
> **E (Emergency):** Human expertise and physical reference books (The "No-AI" fallback).

## SOP: Responsible AI Usage
1. **Never Trust, Always Verify:** Treat every AI output as a "draft" that needs human review.
2. **Protect Intel:** Never feed sensitive passwords, API keys, or private student data into an external AI.
3. **Be Specific:** Use clear, concise "Operations Orders" (prompts) to get the best results.
4. **Iterate:** Use the [[_assets/_templates/AAR|AAR]] process to refine your prompts and AI workflows.

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
