---
name: yeti-orchestrator
description: Specialized skill for the NetYeti Lab. Automates auditing of Docker Swarm, monitoring of MikroTik RouterOS, and updating Obsidian documentation. Use when the user requests a status report, system audit, or documentation sync.
---
# Yeti-Orchestrator
## Workflows
### 1. Daily Status Scribe
When requested to update the journal or provide a status report:
1. Parse the \`recent_actions\` and \`task_state\` from the current session context.
2. Append a new \"Phase\" or \"Mission Update\" to \`~/Obsidian/journal/Dailies/YYYY-MM-DD.md\`.
3. Ensure all failures are wrapped in \`> [!failure] Synopsis\` callouts.
### 2. Cluster & Network Auditor
When requested to perform an audit:
1. Run \`docker node ls\` and \`docker service ls\` via the Proxmox host.
2. Run \`/system/resource/print\` and \`/interface/monitor-traffic\` on the MikroTik gateway.
3. Consolidate findings into a \"Health Check\" summary.
## Tool Integration
- **Router:** Use the \`_gateway\` SSH alias.
- **Host:** Use the \`10.0.1.13\` (Frank) SSH alias.
- **Vault:** Use the \`~/Obsidian/journal/\` directory.
## Priorities
- **User-Alpha:** Always ensure the owner's access is unaffected by any background tasks.
