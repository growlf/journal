# 🛠️ Automated Lab Manual: Ansible

Welcome to the **NetYeti Ansible Repository**. This folder contains the automation logic used to manage the "Ideal" version of our lab. It serves as a teachable resource for scaling infrastructure, performing network discovery, and maintaining the **Ollama Herd**.

## 🚀 Primary Playbooks

These playbooks are the "Tactical Tools" of the forest:

*   **[[playbook-network-recon.yml]]**: Automated Asset Discovery. Scans subnets to identify live hosts.
*   **[[playbook-check-herd.yml]]**: Signal Status Reporter. Queries the Ollama API across all nodes to verify engine health.
*   **[[playbook-swarm-expansion.yml]]**: The Scaling Engine. Orchestrates the rollout of the `ollama` role to new nodes.
*   **[[playbook-dispatch-task.yml]]**: Ad-hoc task execution across the cluster.

## 🏗️ Infrastructure & Config

*   **`/inventory`**: Contains [[hosts.ini]], the map of our "Ideal" network nodes.
*   **`/roles`**: Reusable automation modules (e.g., the [[ollama]] deployment role).
*   **`/group_vars`**: Global variables and path overrides for the herd.
*   **`/infrastructure`**: Advanced synchronization and maintenance playbooks used for node-to-node replication.

---
> [!info] Teachable Moment: Infrastructure as Code (IaC)
> We don't just "do" tasks; we "build tools." By using Ansible, we ensure that our environment is reproducible, documented, and capable of self-healing. This is the **Primary (P)** concept of modern DevOps.
