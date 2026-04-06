---
title: "Homepage: Your Dashboard for All the Things"
tags:
  - self-hosted
  - dashboard
  - lab-infrastructure
  - docker
management_url: "http://<homepage-ip>:3000"
---
# Homepage: Your Dashboard for All the Things

> [!NOTE] The Instructor's Perspective
> In the Army, we had a "SITREP" (Situation Report). Homepage is your Situational Report for your entire lab. Instead of remembering 50 different IP addresses and ports, you have one central dashboard to see the status and link to every service. It's "The One Ring" for your "manageable mess."

## Why a Dashboard?
- **Centralization:** One place to access all your services.
- **Monitoring:** Live status for your [[Network/Services/Proxmox/index|Proxmox]] nodes, Docker containers, and [[Knowledge Base/Storage/NAS|NAS]].
- **Customization:** Tailor the dashboard to your needs with easy-to-edit YAML configuration.
- **Performance:** Lightweight and fast, perfect for running as a container.

## Lab Dashboard Reliability (The PACE Plan)
> [!TIP] Information Discipline
> **P (Primary):** Self-hosted Homepage instance (Docker container).
> **A (Alternate):** Simple HTML landing page with hardcoded links.
> **C (Contingency):** A bookmarked list of critical service URLs in your browser or [[Obsidian]].
> **E (Emergency):** Direct IP access (bypass the dashboard entirely).

## Standard Operating Procedure (SOP): Setting Up the Dashboard
1. **Deploy:** Use Docker to spin up a Homepage instance.
2. **Configure Services:** Add your services to `services.yaml` with their URLs and icons.
3. **Add Widgets:** Integrate widgets for [[Network/Services/Proxmox/index|Proxmox]], Docker, and your [[Knowledge Base/Networking/Router|Router]] to see live stats.
4. **Organize:** Use groups and bookmarks to categorize your services (e.g., "Infrastructure," "Media," "Development").
5. **Verify:** Access the dashboard and ensure all links are working.

## Check for Understanding
- Why is it helpful to see live stats (widgets) on your dashboard? (Hint: Think about "knowing your terrain").
- How does a dashboard help a student or peer navigate your home lab?

---
*Related: [[Network/The Stack]], [[Knowledge Base/Virtualization/Docker/index]], [[Knowledge Base/Networking/Router]]*
