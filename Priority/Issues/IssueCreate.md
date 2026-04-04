---
title: Test Issue
issue_definition: test issue using meta-bind
category:
tags:
  - infrastructure_issue
  - service_issue
status: false
issue: "[[Priority/Issues/No Guide on Creating an Issue.md|No Guide on Creating an Issue]]"
issue_category: banana
---

## New Entry Form

**Title:** `INPUT[text(placeholder("Issue name")):title]`
**Completed:** `INPUT[toggle:status]`
**Tags:** 
```meta-bind
INPUT[multiSelect(
	option(infrastructure_issue, Infrastructure),
	option(customer_issue, Customer),
	option(purchase_issue, Purchasing),
	option(hardware_issue, Hardware),
	option(service_issue, Service or Software)
):tags]
```
**Priority:** 
```meta-bind
INPUT[select(
  option(immediate), 
  option(asap), 
  option(standard), 
  option(none)
):issue_category]
```
**Parent Issue:**  (if any)
```meta-bind
INPUT[suggester(
	optionQuery("Priority/Issues")
):issue]
```
**Definition:** `INPUT[textArea:issue_definition]`

Be Specific but brief. This should clearly and concisely define the singular issue or need being addressed. Provide a high-level overview of the its impact.


```meta-bind-button
id: "create_entry_button"
style: primary
label: "Create New Issue"
tooltip: "Create a new issue document in the Issues folder"
action:
  type: templaterCreateNote
  templateFile: "_assets/_templates/IssueTest.md"
  folderPath: "Priority/Issues"
  fileName: "{{title}}"
  openNote: true
```

