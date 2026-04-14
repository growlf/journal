---
tags:
  - concept
  - ai
  - ollama
---
# Ollama: Local AI Engine (Concept)

> [!NOTE] The Instructor's Perspective
> Ollama is the "Engine" of our local AI strategy. It allows us to run powerful LLMs on our own hardware, ensuring privacy and zero cost-per-token.

## Implementation Concept
In the Default Stack, Ollama is deployed as a containerized service, often with GPU acceleration (e.g., Intel Arc) passed through from the hypervisor.

### Strategic Role
- **Privacy:** Keeps sensitive queries on-premise.
- **Efficiency:** Uses local compute resources before falling back to cloud providers.
- **Instructional:** Provides a platform for students to learn about model weights, quantization, and context windows.

---
*Related: [[Learning/Home-Lab-Series/Default-Stack-Blueprint|The Stack]], [[Knowledge Base/LLM/Ollama Setup Guide]]*
