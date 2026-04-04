---
title: My test issue 1
tags: testing
issue_definition: Some ipsum lorem garbage
status: false
---
**Title:** `INPUT[text:title]`
**Status:** `INPUT[toggle(offValue(),onValue()):status]`
**Tags:** `INPUT[text:tags]`
**Definition:** `INPUT[textArea:issue_definition]`
Be Specific but brief. This should clearly and concisely define the singular issue or need being addressed. Provide a high-level overview of the its impact.

```meta-bind-button
style: primary
label: Create New Issue
tooltip: Create a new issue document in the Issues folder
actions:
  - type: templaterCreateNote
    templateFile: "_assets/_templates/Issue.md"
    folderPath: "Priority/Issues"
    fileName: "New Issue"
    openNote: true
```
