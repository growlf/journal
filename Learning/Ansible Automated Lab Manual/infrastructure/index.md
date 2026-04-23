# 🏗️ Lab Infrastructure Logic

This directory contains the "Under-the-Hood" automation used to maintain the NetYeti Lab's consistency and logic parity across different nodes.

## 📡 Synchronization & Merging

*   **[[replicate-to-gemini.yml]]**: Demonstrates high-fidelity file synchronization using `rsync` logic. It handles the complex task of moving the Obsidian Vault and Gemini configurations between primary and secondary nodes while preserving local overrides.
*   **[[merge-gemini-configs.yml]]**: Automated configuration patching. Shows how to use `sed` within Ansible to surgically update local paths after a replication event.
*   **[[patch-gemini-config.yml]]**: Specialized logic for updating project-specific JSON and Markdown files to ensure they point to the correct local environment.
*   **[[finalize-gemini-merge.yml]]**: The "Post-Op" script that ensures permissions and asset links are consistent after a major deployment.

---
> [!tip] Check for Understanding
> Why use Ansible for simple file moves? Because Ansible provides **idempotency**. It won't overwrite things if they already match the "Ideal" state, saving bandwidth and reducing the risk of data drift.
