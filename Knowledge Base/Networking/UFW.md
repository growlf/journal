---
tags:
  - networking
  - security
  - linux
---
# UFW and Firewalld

> In the Army, we had "Simplified Standard Operating Procedures (SSOPs)." UFW and Firewalld are the SSOPs for host-based firewalls in Linux.

## Description
- **UFW (Uncomplicated Firewall)**: The standard firewall configuration tool for Ubuntu and its derivatives. It's designed to be... uncomplicated!
- **Firewalld**: The standard firewall daemon for RHEL/CentOS/Fedora systems. It's more dynamic and supports network "zones."

## Knowledge Check
- [ ] Have you enabled the service?
- [ ] Are you using zones (Firewalld) or basic rules (UFW)?

## Common Pitfalls
- **Default Policy**: Be careful when setting the default policy to "Deny." Ensure you've allowed SSH first!
- **Stateful Connections**: Ensure your firewall is tracking connection states correctly.
