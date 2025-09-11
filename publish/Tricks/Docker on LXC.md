---
tags: 
Creation date: 2025-09-11 00:43
modification date: Thursday 11th September 2025 00:43:04
Documentation: https://pve.proxmox.com/wiki/Storage#chapter_storage
aliases:
---
---

### Notes (to be cleaned up and made useful later):
Create three Docker LXCs with the [script](https://community-scripts.github.io/ProxmoxVE/scripts?id=docker). 
- Enable [Portainer](https://www.portainer.io/) on the first one and the agent on the others (it is an option in the script)
- Do not expose the Docker port (its not good security and will be an issue later)
- Save the conf from the first to use on the others for simplicity and consistency
- Give each node at least 10GB of storage but don't worry about container data - that is solved below with the ZFS mount
- Docker swarm init and create a worker token on the first node, and add it to the other two (`docker swarm init` initializes and generates the command for the other two)
In Proxmox terminal, create the ZFS sub-volume and size it:
```bash
zfs list
zfs create zfs10/subvol-docker
zfs set quota=70G zfs10/subvol-docker
zfs list
```
Then go to the Datacenter level in Proxmox, select Storage, Add, Directory. Fill it in like so:
![[zfs_dir.png]]
Then go to the LXC (each of them) and in the resources, add a mount point like this:
![[zfs_mp.png]]
### Links
- https://docs.oracle.com/cd/E19253-01/819-5461/6n7ht6qu3/index.html
