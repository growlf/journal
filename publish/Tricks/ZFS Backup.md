---
tags: 
Creation date: 2025-09-11 00:43
modification date: Thursday 11th September 2025 00:43:04
Documentation: 
aliases:
---
Here's a breakdown of the process:

### Create a Snapshot

On the Source System (where you want to back up from):
```sh
zfs snapshot -r source_pool/dataset@backup_snapshot_name
```

This command creates a recursive snapshot (`-r`) of the `source_pool/dataset` and names it `backup_snapshot_name`. Replace `source_pool/dataset` with your actual ZFS dataset name and `backup_snapshot_name` with a descriptive name for your snapshot. 

### Send the snapshot
(to a remote server via ssh from the Source System)
```sh
zfs send -R source_pool/dataset@backup_snapshot_name | ssh user@backup_server zfs recv -F backup_pool/backup_dataset
```

This command sends the snapshot stream to the remote server (`backup_server`) via `ssh`. 

- `-R` sends a replication stream, preserving all properties and descendent datasets.
- `user` is the username on the backup server.
- `backup_server` is the hostname or IP address of the backup server.
- `backup_pool/backup_dataset` is the ZFS dataset on the backup server where the data will be received.
- `-F` forces the receive, allowing it to overwrite existing data if needed.
### Important Considerations:

- **Encryption:**
    For secure backups, especially over a network, consider using SSH with encryption or encrypting the ZFS pool itself on the backup server.    
- **Incremental Backups:**
    For subsequent backups, you can send incremental snapshots using `zfs send -i` or `zfs send -I`. This significantly reduces transfer time and storage space.
- **ZFS Versions:** 
    Ensure both the source and backup systems are running compatible ZFS versions.
- **Space Requirements:**
    ZFS snapshots can consume significant disk space. Regularly prune old snapshots to manage storage.
- **Tools:**
    Consider using tools like `syncoid` (part of the `zfs-auto-snapshot` package) or `zfsnap` for automating backups, snapshot management, and incremental transfers.
- **Firewall:**
    If using `ssh`, ensure that the firewall on the backup server allows incoming connections on the SSH port (usually 22).
- **Network Bandwidth:**
    For large datasets, consider using compression or tools like `mbuffer` to manage network bandwidth during transfers.

