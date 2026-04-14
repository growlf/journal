# Power: Warden (Backlog Command)

## Description
Use this power to audit, prioritize, and clear the forest backlog. It leverages the Obsidian Tasks plugin syntax and enforces a "Pre-Mission Sweep" policy.

## Capabilities
- **Pre-Mission Sweep:** Automatically runs `manage-backlog.py` to re-sync signal before tasks.
- **Auto-Sync:** Synchronizes completion status [x] for duplicate tasks across the vault.
- **Emoji Intelligence:** Parses 🔺 (High), 🔼 (Medium), and 🔽 (Low) priorities.
- **Mission Handoff:** Identifies `scan`, `fix`, `document`, or `update` tasks for AI execution.

## Usage Protocol
1.  **Recon:** Run `python3 _scripts/manage-backlog.py` immediately.
2.  **Brief:** Present the synchronized briefing to the NetYeti.
3.  **Compress:** If context is heavy, suggest `/compress` before the next task.

## Forest Laws
- **Always Recon:** Never assume the backlog hasn't changed.
- **One Truth:** Keep task statuses consistent across all logs.
