---
tags:
  - proxmox
  - alerting
Creation date: 2025-08-17 18:39
Documentation: 
aliases:
---
# Automatic PVE System Monitoring
Vm's and [[Lab/services/TBD/LXC|LXC]]'s with the tag `mon-restart` will automatically be restarted if they fail.

Very much recommended.  Check the logs with 
```bash
cat /var/log/ping-instances.log
```
### Links
- [Install script](https://community-scripts.github.io/ProxmoxVE/scripts?id=monitor-all)

