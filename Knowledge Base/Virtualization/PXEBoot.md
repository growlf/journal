---
title: PXE Boot
---

# PXE Boot: The Network Powerhouse

Preboot Execution Environment (PXE) allows a computer to boot from the network before its local OS loads.

## Why PXE?
- **Automation:** Install OSs on multiple machines without touching a USB drive.
- **Diskless Nodes:** Boot machines (like a Raspberry Pi cluster) without local storage.
- **Diagnostics:** Boot into a live environment like Memtest86 or Clonezilla for maintenance.

## NetYeti's Implementation Stack
- **DHCP:** Tells the machine where the PXE server is (using Options 66 and 67).
- **TFTP:** Serves the initial bootloader (like `ipxe.efi`).
- **HTTP:** Serves the larger OS images (much faster than TFTP).
- **Tools:** 
    - **Netboot.xyz:** The "Swiss Army Knife" of network booting.
    - **Fog Project:** For full-blown image management.

## Integration Tip
- Use `dnsmasq` for a lightweight PXE/DHCP/DNS all-in-one.
- If using Proxmox, enable PXE on new LXCs/VMs for rapid provisioning.

### Knowledge Check:
- Is your DHCP server correctly identifying the client architecture (BIOS vs UEFI)?
- Are your network switches configured for "PortFast" to avoid boot timeouts?
