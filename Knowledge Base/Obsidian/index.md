---
title: Obsidian: The Knowledge Forge
tags:
  - documentation
  - obsidian
  - pkm
---
# Obsidian: The Knowledge Forge

> [!NOTE] The Instructor's Perspective
> In the Army, we had a "Battle Book"—a single source of truth for every mission. In your lab, [[Obsidian]] is that battle book. It’s not just for taking notes; it’s for forging connections between what you know and what you’re learning. It’s the foundational tool that keeps our [[Network/The Stack|Stack]] from becoming a "manageable mess."

## Why use it?
- **Ownership:** Your data is stored in plain-text Markdown files on your own hardware.
- **Connection:** Link your thoughts, projects, and people together to see the "big picture."
- **Extensibility:** A huge ecosystem of plugins (like Dataview and Excalidraw) and services.
- **Publishing:** Easily share your journey with the world using [[GitHub-Quartz-Obsidian]].

## Documentation Reliability (The PACE Plan)
> [!TIP] Information Discipline
> **P (Primary):** Local [[Obsidian]] Vault synced across devices using [[CouchDB|Self-Hosted Sync]].
> **A (Alternate):** GitHub Repository (Private or Public) for version control and backup.
> **C (Contingency):** Automated local file-system backups to your [[Knowledge Base/NAS|NAS]].
> **E (Emergency):** Exported PDF or printed SOPs for critical recovery (The "Offline Battle Book").

## Standard Operating Procedure (SOP) Best Practices
1. **Link Aggressively:** If you mention a service, person, or policy, link to it.
2. **Use Templates:** Save time and stay consistent by using the [[_assets/_templates/index|templates folder]].
3. **Daily Notes:** Use the `daily` folder to capture "ramblings" and "stupid questions" as they happen.
4. **Tag for Discovery:** Use tags (e.g., `#networking`, `#security`) to find related info fast.

## Obsidian Knowledge Tree
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
- Why is "Ownership" considered a primary benefit of using [[Obsidian]] over cloud-based tools?
- How does the **Alternate** plan (GitHub) help you collaborate with other students or peers?

---
*Related: [[Knowledge Base/Mark Down]], [[GitHub-Quartz-Obsidian]], [[Network/Home Lab 101]]*
