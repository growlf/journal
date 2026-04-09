---
title: "Asking Stupid Questions: A Guide to AI Prompting for Students"
tags:
  - ai
  - prompting
  - prompt-engineering
  - education
---
# Asking Stupid Questions: A Guide to AI Prompting

> [!QUOTE] The NetYeti Philosophy
> "If you are too shy or afraid to ask *that* question which is deemed too obvious (aka common sense), you are leaving a hole in your knowledge. AI is the perfect place to ask the stupid questions so you can get the smart answers. Don't let a 'manageable mess' turn into a catastrophe just because you were afraid to look 'new'."

## The Instructor's Perspective
Prompting isn't about being a "wizard." It's about **context** and **intent**. It's the difference between asking "How do I fix my computer?" and "I have a Linux laptop that won't boot past the GRUB screen. Here is what I see..."

## The Framework: C-R-E-A-M
(Context, Role, Example, Action, Mindset)

### 1. Context (The "Why")
Don't just ask a question. Tell the AI what you are doing.
- **Bad:** "How do I use `ls`?"
- **Good:** "I'm a new Linux student at BTC trying to understand file permissions. I'm using the `ls -l` command in my home directory and I'm confused about the `drwxr-xr-x` string."

### 2. Role (The "Who")
Give the AI a persona. It changes the "voice" of the answer.
- **Bad:** "Tell me about networking."
- **Good:** "Act as a Senior Network Instructor (and Army Veteran). Explain the OSI model using a PACE plan for communication reliability."

### 3. Example (The "What")
Give the AI a pattern to follow.
- **Good:** "I want you to summarize this man page. Here is an example of the format I like: [Command Name, Primary Flag, Example Usage]."

### 4. Action (The "How")
Be specific about what you want.
- **Bad:** "Fix this code."
- **Good:** "Review this Bash script for common pitfalls, especially around variable quoting and error handling. Suggest a more 'NetYeti' way to handle the logic."

### 5. Mindset (The "NetYeti" Twist)
Tell the AI to challenge you.
- **Good:** "After you explain this, ask me a **Knowledge Check** question to see if I understood it. Don't be afraid to tell me if my approach is a 'stupid question' in the wrong direction!"

## The Local-First Advantage (Pillar of Learning)
Why do we prompt locally on **Ollama** before hitting the cloud?
1. **Privacy:** You can ask the *really* stupid questions without them being logged in a corporate data center.
2. **Speed:** Instant iteration. If the prompt fails, tweak it and go again. No tokens, no cost.
3. **Exploration:** You are the "Admin" of the brain. You can see the model load, watch the VRAM usage, and understand the *mechanics* of the intelligence.

---

## NetYeti Tactical Prompting: The Multi-Turn Strategy
Don't try to get the "perfect" answer in one go. That's a **Common Pitfall**. Use a multi-turn approach to build a "Knowledge Bridge."

### Turn 1: The Briefing (Set the Stage)
> "I am a student at BTC working on a Linux Home Lab. Act as a Senior Technology Instructor (The NetYeti). I want to learn about [Topic, e.g., SSH Keys]. Before we start, tell me the **Primary (P)** concept I need to understand."

### Turn 2: The Deep Dive (Ask the "Stupid" Question)
> "Okay, I understand [Topic]. Now, here is the 'stupid question': Why do I need a passphrase if the key is already 'secure'? Explain this using a **Teachable Moment** about a 'Manageable Mess'."

### Turn 3: The Practical (The AAR)
> "Write a step-by-step guide for me to generate an Ed25519 key. After each step, explain **WHY** we are doing it. At the end, give me a **Knowledge Check**."

---

## The Troubleshooting PACE Plan
When you are stuck on a technical problem, use this prompt structure:

- **Primary (P):** "Here is exactly what I am trying to do (The Mission)."
- **Alternate (A):** "Here is what I have already tried (The AAR)."
- **Contingency (C):** "Here are the errors I'm seeing (The Intelligence)."
- **Emergency (E):** "Tell me what the most common 'stupid mistake' is for this scenario."

---

## The "NetYeti" Teachable Moment
> [!TIP] Manageable Mess vs. Catastrophic Failure
> A **Manageable Mess** is when you try something, it breaks, but you know *why* it broke (or have the logs to find out). AI is great at helping you turn a mess into a lesson. **Catastrophic Failure** is when you copy-paste code you don't understand and it deletes your `/home` directory. 
> 
> **Always ask the AI: "Explain this code to me like I'm 5 before I run it."**

## Common Pitfalls
- **Blind Trust:** Never copy-paste AI code without reading it. If you don't understand it, it's not a "win," it's a "liability."
- **The Vague Voids:** Vague prompts get vague answers. If the AI is giving you junk, look at your context first.
- **Signal Loss:** If the AI is "hallucinating" (making stuff up), it's usually because you didn't give it enough guardrails.

## Knowledge Check
- Why is it better to tell the AI "who it is" (Role) before asking a question?
- How does providing an "Example" improve the output of an LLM?
- What is the difference between a "Manageable Mess" and a "Catastrophic Failure"?

---
*Related: [[Knowledge Base/LLM/index|AI Command Center]], [[Knowledge Base/LLM/The AI Homelab Story|The AI Homelab Story]], [[Knowledge Base/LLM/AI Education Project|AI Education Project]]*
