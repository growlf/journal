---
title: "Project - Yeti_Sidecar Herd Orchestration"
tags:
  - project
  - ai
  - automation
  - sidecar
  - herd
---
# Yeti_Sidecar: Distributed Herd Orchestration

> [!NOTE] The Instructor's Perspective
> "Farming" isn't just for the forest. In our lab, we farm compute. When one node (Phoenix) gets overwhelmed, we offload the heavy lifting to the "Herd." The **Yeti_Sidecar** is our tactical bridge that makes this possible, allowing us to treat a dozen separate machines as one giant, distributed brain.

## 🎯 Project Goal
To document and standardize the deployment of the **Yeti_Sidecar** solution, enabling seamless task offloading and parallel processing across the **Ollama Herd**.

## 🏗️ Architecture Overview
The system relies on three primary components:
1.  **The Herd:** A collection of compute nodes (NUCs, Workstations, LXCs) running Ollama.
2.  **The Sidecar (Port 11435):** A FastAPI-based Docker container on each node that provides host-level command execution and file access.
3.  **The Orchestrator (Phoenix):** The central node that dispatches jobs using `parallel_ollama.py` or Ansible playbooks.

### The PACE Plan for Compute
- **Primary (P):** Local execution on Phoenix.
- **Alternate (A):** Offloading to **Gemini** (RTX 3090 Ti) for high-VRAM tasks.
- **Contingency (C):** Parallel dispatch to the entire **Ollama Herd**.
- **Emergency (E):** Manual task distribution via SSH.

## 🛠️ Setup & Deployment Tutorial

### 1. The Sidecar Script (`yeti_sidecar.py`)
The sidecar is a lightweight Python API that bridges the container gap. Key features:
- **`/execute`**: Run shell commands on the host.
- **`/read` / `/write`**: Access the host filesystem via a `/host` mount.
- **`/proxy`**: Forward requests to other local services (like Ollama on 11434).

### 2. Deploying to the Herd
Use the `deploy_yeti_sidecar.sh` script to push the sidecar to a new node.

```bash
# Usage: ./deploy_yeti_sidecar.sh <IP> <USER> <SSH_KEY> <SUDO_PASS>
./deploy_yeti_sidecar.sh 10.0.1.252 netyeti ~/.ssh/id_rsa "my_secret_pass"
```

**What the script does:**
1.  Kills any existing `yeti-sidecar` container.
2.  SCPs the `yeti_sidecar.py` script to `/tmp/`.
3.  Launches a `python:3.11-slim` container with:
    - `-v /:/host`: Maps the host root to the container's `/host`.
    - `--privileged`: Allows necessary system-level interactions.
    - `-p 11435:11435`: Exposes the Sidecar API.

### 3. Maintaining the Herd with Ansible
The "Ollama Herd" is managed via Ansible in `/ansible/inventory/hosts.ini`. 

**Check Herd Status:**
```bash
ansible-playbook -i ansible/inventory/hosts.ini ansible/playbook-check-herd.yml
```

**Dispatch a Task:**
```bash
ansible-playbook -i ansible/inventory/hosts.ini ansible/playbook-dispatch-task.yml -e "target_node=lab1 task_prompt='Audit the logs'"
```

## 🚀 Farming Jobs in Parallel
For high-volume LLM tasks, use the `parallel_ollama.py` script. It reads the node list from `Network/Services/YetiPack Cluster.md` and distributes a JSON list of tasks across all available workers.

### Example Workflow:
1.  Create `tasks.json` with a list of prompts.
2.  Run the orchestrator: `python3 parallel_ollama.py tasks.json`
3.  Review the consolidated report in `Parallel_Offloading_Reports.md`.

## 🧠 Knowledge Check
- Why do we mount the host root (`/`) to `/host` in the Sidecar?
- How does the `Parallel_Offloading_Reports.md` help with "Orchestrator Review"?

---
*Related: [[Sparse Page]], [[Knowledge Base/LLM/Hybrid Architecture - The PACE Plan|PACE Plan]], [[ansible/index|Ansible Automation]]*
