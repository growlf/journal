---
tags:
  - security
  - networking
  - firewall
---
# Zenarmor

> In the Army, we had "Layered Defense." Zenarmor is your application-layer defense for your network.

## Description
Zenarmor is an enterprise-grade, software-defined firewall that can be deployed on any network. It specializes in application-layer filtering, allowing you to block specific apps or websites (e.g., social media, ads, trackers) with ease.

It's most commonly used with [[OPNsense]] in home labs to add an extra layer of visibility and control.

## Knowledge Check
- [ ] Have you configured your policies correctly for your LAN and DMZ?
- [ ] Are you using any of the "Free Edition" features, or have you upgraded to "Home" or "Business"?

## Common Pitfalls
- **Resource Usage**: Application-layer filtering requires deep packet inspection (DPI), which can be CPU intensive.
- **Breaking Apps**: Be careful with "aggressive" filtering policies as they can break legitimate apps.
