---
tags: 
Creation date: 2025-08-19 20:57
Documentation: 
aliases:
---
---
# Description

![[Today.base]]


Process
- Communication plan - include people
	- TASK: we need a consistent list of members and stats (perms, access, etc)
- Publish - public for the group at least
- KISS Principal
- SST - Single source of truth
- Belbin Team - balanced
- Re-use knowledge and applications as much as possible (OSS/FOSS)
- Use Dev and Prod environments (at least)
- Review - post implementation review (what did we learn, is there documentation, etc)
- Clear overall goals - 
	- We want to learn
	- Enjoy our time
	- Have a stable environment
	- Share our knowledge
- establish a clear plan before beginning (proposal)
	- Purpose/reason for a change
	- Scope 
	- clear (perhaps restated) Definitions
	- Criticality
	- Priority
	- Roles
	- Affects - changes that affect other need tis process - changes that are only with a single users scope do not)
	

Establish:
Purpose
Scope
Definitions
Change: Any modification to IT services, infrastructure, applications, or configurations.
Standard Change: Low-risk, pre-approved changes (e.g., patching).
Emergency Change: Critical change needed to fix a major incident or vulnerability.
Normal Change: All other changes requiring assessment and approval.
Roles and Responsibilities
Change Initiator: Proposes and documents the change request
Change Manager: Manages the overall change process and ensures policy compliance
Change Advisory Board: Reviews and approves Normal and Major changes.
Implementers: Execute the approved changes.
Approval Workflow
Standard Changes: Pre-approved, documented in a standard change catalog.
Normal Changes: Reviewed and approved by CAB during weekly meetings.
Emergency Changes: Approved by Change Manager + IT Director (or delegated authority) outside of regular CAB.
Testing Validation
All changes must be tested in a staging environment before production deployment unless deemed unnecessary (standard/emergency changes). Testing results must be documented.
Communication Plan
Send follow-up communication after successful implementation or in case of issues
Consistent list of members (perms, access, etc.)
Post-Implementation Review
Was the change successful?
Any unanticipated issues?
Lessons learned
Update documentation if needed
Monitoring and Metrics
All IT changes will be monitored using real-time dashboards and alerting systems configured in Grafana and notify system administrators of anomalies or failures.
Compliance
Policy Review and Updates