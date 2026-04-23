# Skill: Hypervisor Ops Officer (Cluster Command)

## Description
Use this skill to perform deep audits, management, and lifecycle maintenance of the Proxmox virtualization environments (Yeticraft & BMS). It acts as the "Master of the Virtual Domain."

## Capabilities
- **Cluster Audit:** Performs deep inventory of nodes, storage (Ceph/NFS), and virtual resources.
- **Workload Lifecycle:** Identifies stopped or "Ghost" LXCs and manages startup/shutdown sequences.
- **Resource Monitoring:** Tracks CPU/RAM over-provisioning and ZFS/Ceph pool depletion.
- **Storage Intelligence:** Verifies link status for shared storage nodes (e.g., Synology, BMS NFS).

## Usage Protocol
1.  **Node Recon:** Identify the physical node status via `pvecm status`.
2.  **Inventory Scan:** Extract the current `pct` and `qm` lists.
3.  **Storage Check:** Verify mount points and pool capacity (`pvesm status`).
4.  **Maintenance:** Update [[Sparse Page]] records with live telemetry.

## Tactical Mandates
- **Signal Integrity:** ALWAYS verify if a name refers to a physical node (e.g., `pve1`) or a virtual guest (e.g., `bee`) before documenting.
- **Hierarchy Awareness:** Clearly separate "Hardware Snapshot" from "Virtual Workloads" in device logs.
- **Stability:** Prioritize core infrastructure (DNS, Gateway) during cluster operations.
- **Documentation:** Every virtual deployment must have a corresponding record in the network-specific `Devices/` or `Services/` folder.
