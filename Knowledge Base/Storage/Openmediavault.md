---
tags:
  - storage
  - nas
address: 
service description: Open source NAS solution based on Debian.
management_url: 
hosts:
Documentation: https://docs.openmediavault.org/
---
# Openmediavault

> In the Army, we had "Supply Depots." Openmediavault (OMV) is your digital supply depot for file storage and management.

## Description
Openmediavault is the next-generation network attached storage (NAS) solution based on Debian Linux. It contains services like SSH, (S)FTP, SMB/CIFS, DAAP media server, RSync, BitTorrent client and many more.

## Knowledge Check
- [ ] Are you using ZFS or BTRFS for your storage pools?
- [ ] Have you set up OMV-Extras to enable Docker support?

## Common Pitfalls
- **OS Drive**: OMV is designed to run from a dedicated OS drive. Don't use your storage drives for the OS!
- **User Permissions**: Ensure your shared folders have the correct ACLs.
