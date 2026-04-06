---
title: Github Workflow
---

# GitHub Workflow: Standardizing Contributions

GitHub is more than a code host; it's a collaboration platform. Using a consistent workflow ensures projects stay clean and manageable.

## Why a Workflow?
- **Stability:** Avoid breaking the "main" branch.
- **Traceability:** Know who changed what, when, and why.
- **Automation:** Triggering CI/CD pipelines (like Quartz builds!).

## NetYeti's Standard Flow
1.  **Branching:** Always create a "feature" branch from `main` (`git checkout -b feature/new-stuff`).
2.  **Commits:** Write clear, concise commit messages (e.g., "Add UPS documentation to Knowledge Base").
3.  **Pull Request (PR):** Push your branch to GitHub and open a PR.
4.  **Review:** Check for linting errors and manual peer review.
5.  **Merge:** Squash and merge into `main` once tests pass.

## NetYeti's PACE for Code
- **P (Primary):** The code on your local dev machine.
- **A (Alternate):** The remote repository on GitHub/GitLab.
- **C (Contingency):** A secondary remote or mirrored repo.
- **E (Emergency):** Local offline copies (backups!).

### Knowledge Check:
- Are you using `.gitignore` to keep your secrets (like `.env`) out of GitHub?
- Do you "sign" your commits for authenticity?
