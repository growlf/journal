---
title: "SOP: Handling a Service Failure"
tags:
  - sop
  - troubleshooting
  - lab-ops
---
# SOP: Handling a Service Failure

> [!NOTE] The Instructor's Perspective
> In the Army, we called it "fault isolation." When a service fails, don't panic. Follow this SOP to identify the root cause and get it back online. Don't forget to conduct an [[AAR]] after you've fixed the issue!

## 1. Initial Assessment (The Recon Phase)
- **Identify the Failed Service:** Which service is down? (e.g., `web-server-01`)
- **Check for Connectivity:** Can you reach the service's IP address?
- **Verify Other Services:** Are other services on the same host also down?

## 2. Troubleshooting (The Investigation Phase)
1. **Check the Logs:** Use `journalctl -u service-name` or check `/var/log/` for error messages.
2. **Verify Resource Usage:** Check for high CPU, RAM, or Disk space usage.
3. **Check Network Settings:** Ensure that the service's network settings are correct.
4. **Restart the Service:** Use `systemctl restart service-name` to see if it comes back online.
5. **Check for Recent Changes:** Did you or anyone else make changes to the service's configuration recently?

## 3. Resolution (The Recovery Phase)
1. **Apply the Fix:** Once you've identified the root cause, apply the necessary fix.
2. **Verify the Fix:** Ensure that the service is running and accessible.
3. **Document the Fix:** Update any relevant [[Knowledge Base]] items.
4. **Conduct an AAR:** Use the [[_assets/_templates/AAR|AAR template]] to document the failure and how it was resolved.

## 4. Prevention (The Mission-Ready Phase)
- Update your **PACE Plan** if the failure was due to a lack of redundancy.
- Consider adding additional monitoring or alerting for the service.
- Share your findings with the community in a blog post or [[Discord]] message.

---
**Status:** (Complete / In-Progress)
**Related Tasks:** 
- [ ] Conduct AAR
- [ ] Update documentation
- [ ] Share with community
