---
title: SOP - Forest Fire Suppression
tags:
  - sop
  - troubleshooting
  - lab-ops
  - forest-law
---
# SOP: Forest Fire Suppression (Service Recovery)

> [!NOTE] The Instructor's Perspective
> When a tree falls in the forest, we don't panic. We isolate the hazard and Pass the Torch. Follow this SOP to identify the root cause of a service failure and get the signal back online.

## 1. Initial Assessment (The Recon Phase)
- **Identify the Fallen Service:** Which service is down? (e.g., `cluster-llm`)
- **Check for Signal:** Can you reach the service's IP address? Use the **[[.gemini/agents/network-recon-expert|Network Recon Expert]]** for a targeted port check.
- **Verify the Host:** Are other services on the same host also down? Task the **[[.gemini/agents/hypervisor-ops-officer|Hypervisor Ops Officer]]** to check the node status.

## 2. Troubleshooting (The Investigation Phase)
1. **Check the Logs:** Use `journalctl -u service-name` or check `/var/log/` for error messages.
2. **Verify Resource Usage:** Check for high CPU, RAM, or Disk space usage.
3. **Restart the Service:** Use `systemctl restart service-name` to see if it comes back online.
4. **Check for Recent Changes:** Consult the **Recent Activity** on your [[Sparse Page]].

## 3. Resolution (The Recovery Phase)
1. **Apply the Fix:** Once you've identified the root cause, apply the necessary fix.
2. **Verify the Fix:** Task your AI Minions to verify the service is responding.
3. **Document the Victory:** Update any relevant [[Knowledge Base]] items.
4. **Conduct an AAR:** Use the [[_assets/_templates/AAR|AAR template]] to document the failure and how it was suppressed.

## 4. Prevention (The Mission-Ready Phase)
- Update your **PACE Plan** if the failure was due to a lack of redundancy.
- Consider adding additional monitoring or alerting via [[Sparse Page]].

---
**Status:** Operational
**Related Tasks:** 
- [ ] Conduct AAR
- [x] Update documentation
- [ ] Share with community
