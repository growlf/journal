---
name: sidecar-orchestrator
description: Leverages the distributed "Ollama Herd" and the "Yeti_Sidecar" for local-first AI tasks. Use this to offload compute-heavy processing (summarization, auditing, parallel inference) to the lab infrastructure instead of consuming cloud tokens.
---
# Sidecar-Orchestrator Power

## Tactical Strategy: The Sidecar Bridge
The **Yeti_Sidecar** (Port 11435) provides a bridge between our containerized AI and the host hardware. It allows us to execute commands, read host-level logs, and monitor resources across the **BMS** and **Home** networks.

## Workflows

### 1. Herd Task Offloading (Parallel Inference)
When dealing with a list of prompts or large documents:
1.  Format the tasks as a JSON array in a temporary file.
2.  Use the `parallel_ollama.py` script to dispatch tasks across the herd.
    ```bash
    python3 _assets/_scripts/parallel_ollama.py tasks.json
    ```
3.  Monitor the results in `Parallel_Offloading_Reports.md`.

### 2. Distributed System Auditing
When an audit is required on a specific node (e.g., `lab1`):
1.  Call the Sidecar's `/execute` endpoint via `curl` or `ansible`.
    ```bash
    curl -X POST http://<NODE_IP>:11435/execute -H "Content-Type: application/json" -d '{"command": "uptime && df -h"}'
    ```
2.  Parse the results and update the appropriate `Network/Devices/` file in the vault.

### 3. Log Extraction & Analysis
To analyze logs from a remote host without full SSH overhead:
1.  Request the file via the Sidecar's `/read` endpoint.
    ```bash
    curl "http://<NODE_IP>:11435/read?path=/var/log/syslog"
    ```
2.  Pass the content to the local **Primary (P)** model (Ollama) for summarization.

## Tooling Parity
- **Ollama API:** Port 11434 (Standard Inference)
- **Sidecar API:** Port 11435 (Host Management)
- **Inventory:** `/ansible/inventory/hosts.ini` (The Source of Truth)

## Mandate: Local First
ALWAYS check the status of the **Ollama Herd** via `ansible-playbook -i ansible/inventory/hosts.ini _assets/_scripts/playbook-check-herd.yml` before deciding to use Cloud AI (Alternate) for bulk tasks. If the herd is ACTIVE, use it.

---
*Related: [[Projects/Project - Yeti_Sidecar Herd Orchestration|Project: Yeti_Sidecar]], [[Knowledge Base/LLM/Hybrid Architecture - The PACE Plan|PACE Plan]]*
