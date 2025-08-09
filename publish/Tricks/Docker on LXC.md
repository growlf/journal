---
tags: 
Creation date: <% tp.file.creation_date() %>
modification date: <% tp.file.last_modified_date("dddd Do MMMM YYYY HH:mm:ss") %>
Documentation: https://pve.proxmox.com/wiki/Storage#chapter_storage
aliases:
---
---

### Notes:
Creating the volume and sizing it:
```bash
zfs list
zfs create zfs10/subvol-docker
zfs set quota=70G zfs10/subvol-docker
zfs list
```
Then go to the Datacenter level in Proxmox, select Storage, Add, Directory. Fill it in like so:
![[Pasted image 20250809131333.png]]
Then go to the LXC itself and in the resources, add a mountpoint like this:
![[Pasted image 20250809131624.png]]
### Links
- https://docs.oracle.com/cd/E19253-01/819-5461/6n7ht6qu3/index.html
