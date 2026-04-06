---
title: AI & LLMs
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

> [!SUCCESS] Knowledge Gained: The Containerized SYCL Victory (April 5, 2026)
> For a long time, we were battling broken symlinks and failing services (`ollama.service`, `llama-serve.service`).
> 
> **The Breakthrough:** We've shifted entirely to a **Containerized SYCL (IPEX-LLM)** stack using the `intelanalytics/ipex-llm-inference-cpp-xpu` image.
> - **Tactical Correction:** Found a **Common Pitfall** where the container was trying to mount its supply from a non-existent host folder (`ollama_data` vs. `~/.ollama`). 
> - **Outcome:** By aligning the volume mapping in `docker-compose.yml`, our **Primary (P)** local AI—**qwen2.5:7b**—is finally "in the fight."
> - **Performance:** 100% GPU offload on the Intel Arc (Meteor Lake) iGPU. No more OOM kills or "blind" metrics from `intel_gpu_top`.

## AI Reliability (The PACE Plan)
> [!TIP] Information Discipline
> **P (Primary):** Local Ollama Docker Instance (**qwen2.5:7b**) with Intel Arc (SYCL) acceleration.
> **A (Alternate):** **Gemini (Cloud)** for complex synthesis and cross-vault strategy.
> **C (Contingency):** Manual `llama.cpp` SYCL builds or secondary local nodes.
> **E (Emergency):** Human expertise and physical reference books.

## SOP: AI Delegation & Usage
1. **Delegate Routine Tasks:** I am now leveraging the **Primary (P)** local AI for routine tasks like summarization, initial formatting, and simple code reviews.
2. **Orchestration:** The "Manager" (Gemini Cloud) coordinates the mission, but the "Troops" (Local Ollama) handle the tactical execution.
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
