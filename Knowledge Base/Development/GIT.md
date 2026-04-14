---
tags:
  - version-control
  - git
  - devops
title: Git
---
# Git: The Time Machine for Code

> [!NOTE] The Instructor's Perspective
> In the Army, we had "mission logs" and "situation reports." If you didn't document what happened, it didn't happen. In your home lab, Git is your mission log. It's a "time machine" for your code and configuration. If you make a mistake, you can just "roll back" to a previous state. It's efficient, repeatable, and keeps your lab from becoming an "unmanageable mess."

## Why use it?
- **Version Control:** Track every change you make to your code and configuration.
- **Collaboration:** Share your work with others and merge their changes back in.
- **Rollback:** Easily revert to a previous state if something goes wrong.
- **Documentation:** Your commit messages *are* your documentation.

## Code Reliability (The PACE Plan)
> [!TIP] Operational Discipline
> **P (Primary):** Centralized Git Repository (e.g., GitHub, GitLab, or Gitea).
> **A (Alternate):** Local Git repository on your primary workstation (e.g., Laptop).
> **C (Contingency):** Manual backups of your code and configuration (e.g., `tar.gz` or `zip`).
> **E (Emergency):** Re-writing your code from scratch (The ultimate "No-Git" fallback).

## Standard Operating Procedure (SOP) Best Practices
1. **Commit Often:** Make small, frequent commits with clear, concise messages.
2. **Branching:** Use branches for new features or bug fixes to avoid breaking the main codebase.
3. **Pull Requests:** Use pull requests to review and merge changes from others.
4. **Secrets Management:** Never commit secrets (like passwords or API keys) to your repository! Use [[Ansible Vault.md|Ansible Vault]] or [[Knowledge Base/Tools/Vaultwarden|Vaultwarden]].

## Check for Understanding
- Why is it important to have a **Centralized Git Repository** (Primary) instead of just relying on your local repository (Alternate)?
- How does the "Rollback" plan (Contingency) help if you make a mistake in your code?

---
*Related: [[Learning/Home-Lab-Series/Default-Stack-Blueprint|The Stack]], [[Knowledge Base/Ansible/index|Ansible]], [[Knowledge Base/Vaultwarden]]*