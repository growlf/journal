---
Updated: {{date}}
Status: Operational
Importance: 
address: 
Ports: []
tags:
  - services
service_description: 
management_url: 
hosts: []
Documentation: 
---
# Service: {{title}}

> [!NOTE] The Instructor's Perspective
> {{summary_of_instructional_intent}}

## 🧭 Service Overview
- **Role:** `=this.service_description`
- **Primary Node:** `=this.hosts`
- **Signal Endpoint:** [Management UI](`=this.management_url`)
- **Network Path:** **`=this.address`**

## 🛡️ PACE Plan (Reliability)
- **P (Primary):** {{primary_access_method}}
- **A (Alternate):** {{failover_or_redundancy}}
- **C (Contingency):** {{secondary_nodes_or_vpn}}
- **E (Emergency):** {{manual_or_local_only_access}}

## 🔗 Dependencies & Signal Flow
- **Depends On:** [ ] [[Internal/Networks/BMS/Services/BMS-DNS|DNS]] | [ ] [[Internal/Networks/BMS/Services/BMS-NFS|Storage]]
- **Downstream:** {{what_breaks_if_this_fails}}

---
## 📝 Tactical Notes
- Verified during April 2026 BMS sweep.
- [ ] Document specific API tokens or config paths.
- [ ] Confirm monitoring alert thresholds.

---
**Status:** Operational
**Related:** [[Internal/Networks/BMS/index]], [[Internal/Launch Page]]
