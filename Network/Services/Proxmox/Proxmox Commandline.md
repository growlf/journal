---
tags:
  - proxmox
Creation date: 2025-08-15 13:41
Documentation:
aliases:
---
# Automation via Scripts
The [[Network/Services/Proxmox/index]] command line is a powerful thing. Everything done in the GUI, can be done in the command line - and thus also through automation with something like [[Knowledge Base/Ansible/index]].

## Rough Notes
The following are a collection of quick commands and script that I use and will eventually document better. But, for now, this is a place to keep and not forget them.  Sure, `git` would work too, but this just feels more appropriate because I can comment and document them a bit better inline here in Obsidian.

### Create a Network (simple)
```bash
pvesh create /cluster/sdn/vnets --vnet myvnet --zone myzone
pvesh create /cluster/sdn/vnets/myvnet/subnets --subnet 192.168.1.0/24 --type subnet --gateway 192.168.1.1
```

### Create an LXC Container
- [ ] Add container commandline code🔽 

### Links
- [HowTo vlan](https://www.virtualizationhowto.com/2025/01/proxmox-network-configuration-for-beginners-including-vlans/)
### TODO
