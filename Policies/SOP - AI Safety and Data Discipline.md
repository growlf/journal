---
tags:
  - policy
  - sop
  - ai
  - security
---
# SOP - AI Safety and Data Discipline (The "NetYeti" Way)

> [!NOTE] The Instructor's Perspective
> We are using AI as a "force multiplier," but a force multiplier only works if you don't accidentally shoot your own foot. If we're going to use LLMs—both **Local (Primary)** and **Cloud (Alternate)**—we need to maintain strict "signal discipline."

## Purpose and Scope
This SOP defines how we handle data when interacting with AI systems. It applies to all "intelligence missions" conducted within this journal and by the Cascade STEAM community.

## 1. The Golden Rule of AI Data
**NEVER feed sensitive information into an AI that you wouldn't want to see on a billboard.**
- **Local AI (P):** While more secure, assume the data is still "warm" in memory.
- **Cloud AI (A):** Treat every prompt as public record.

## 2. Prohibited Data (The "No-Fly Zone")
The following data points must **NEVER** be shared with any Cloud AI:
- **Credentials:** API keys, passwords, SSH private keys, or tokens.
- **Personally Identifiable Information (PII):** Real names, addresses, or phone numbers of students or peers without explicit consent.
- **Internal Network Maps:** Detailed IP addresses or firewall rules for private labs.
- **Confidential Mentorship Notes:** Private student progress reports or FERPA-protected data.

## The Tactical Classification: Red-Yellow-Green
To keep it simple for the students at BTC, we use the "Traffic Light" system for data discipline.

| Level | Data Type | Permitted Strategy |
| :--- | :--- | :--- |
| **GREEN** | Public docs, man pages, generic code, general "stupid questions." | **Cloud (A) / Local (P)** |
| **YELLOW** | Internal IP schemes (sanitized), non-sensitive configs, draft documentation. | **Local (P) ONLY** |
| **RED** | Passwords, API Keys, SSH Private Keys, Student PII (FERPA), Network Maps. | **OFF-LIMITS** |

> [!TIP] The NetYeti's Teachable Moment
> "A **Manageable Mess** is when you share a generic config and the AI gives you a bad answer. A **Catastrophic Failure** is when you share your `.env` file and your lab's 'keys to the kingdom' end up in a training set for the next version of a model. **Always check your clipboard before you hit Enter.**"

## 3. Agentic Tool Safety (Aider & OpenClaw)
When using agentic tools that can "see" your filesystem, the risk of "Context Creep" increases.
- **Aider:** Use `.aiderignore` to explicitly block sensitive folders like `.ssh`, `.git`, or `.env`. Never run Aider in the root of a sensitive project without a "Safety Check."
- **OpenClaw:** Ensure the `allowlist` is enabled and restricted to your specific NetYeti ID. Use the `command-logger` to audit what the agent is reading from your vault.
- **Context Hygiene:** Only provide the AI the files it *needs* to complete the mission. Don't give it the whole "Armory" for a simple "recon mission."

## 4. Signal Discipline (Sanitizing Prompts)
Before sending a prompt to the **Alternate (A)** layer (Cloud AI), perform the following:
- **Redaction:** Replace "192.168.1.50" with `<INTERNAL_IP>`.
- **Anonymization:** Use generic roles like "User A" or "Student 1."
- **Generalization:** Instead of "I have a Cisco Catalyst 2960 with a VLAN issue," use "I have a Layer 2 switch with a VLAN issue."

## 4. Verification & Validation (AAR)
AI is a "hallucination machine." Every output must be treated as a "draft" until:
- **Code:** It is run in a sandbox or isolated LXC.
- **Knowledge:** It is cross-referenced with official documentation (RFCs, man pages).
- **Strategy:** It is reviewed for common sense and "NetYeti" philosophy.

## 5. Local LLM (Primary) Benefits
We prioritize the **Primary (P)** layer (Local Ollama) for:
- **Privacy:** Data never leaves our hardware.
- **Control:** We own the weights and the inference engine.
- **Resilience:** The "brain" works even when the internet doesn't.

## Compliance and Consequences
Failure to follow signal discipline results in a "manageable mess" becoming a "catastrophic mess."
- **Correction:** Immediate redaction of the note and a "lessons learned" entry in the journal.
- **Prevention:** Update the `.env` and `.gitignore` to ensure secrets are never even near the AI's "sight."

## Common Pitfalls (The "Manageable Mess")
- **The "Context Creep":** Providing just enough redacted info that the AI can still figure out the context (e.g., "A specific tech college in Bellingham").
- **Local AI Overconfidence:** Thinking "Local AI is 100% safe." It's safe from the *cloud*, but if your machine is compromised or if you log the prompts to a public Git repo, you've still lost signal discipline.
- **Copy-Paste Fatigue:** Accidentally pasting a `.env` file because it was still in your clipboard. **Always Look Before You Enter.**

## Knowledge Check
- What is the "Golden Rule" of AI data?
- Why do we prioritize the **Primary (P)** layer for sensitive "intelligence missions"?
- What should you do *before* sending a technical question to a **Cloud AI (A)** layer?

---
*Related: [[Knowledge Base/LLM/index|AI Command Center]], [[Policies/SOP - Secret Management in the Home Lab|Secret Management SOP]]*
