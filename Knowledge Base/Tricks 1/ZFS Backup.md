---
tags: 
Creation date: 2026-04-12 22:47
modification date: Monday 20th October 2025 19:41:29
Documentation: 
aliases:
---
Here's a breakdown of the process of how to use ZFS to backup data to another system.
## Create a ZFS Target for Receiving Snapshots 
1. **Access the Remote System**: Log in to the system where you want to store the snapshots.
2. **Create a New ZFS Pool**
    - Use the `zpool create` command with the desired pool name and the devices that will comprise the pool. For example, to create a pool named `backup_pool` on devices `sda` and `sdb`:
```
zpool create backup_pool /dev/sda /dev/sdb
```
This creates the fundamental storage pool.
3. **Create a ZFS Dataset**:
    - Inside the new pool, create the specific ZFS dataset that will hold the incoming snapshots. This dataset will be the target for the `zfs receive` command.
    - For example, to create a dataset named `rpool/snapshots` within the new `backup_pool`: 
```
zfs create backup_pool/snapshots
```
 
> [!NOTE] NOTE
> If you are setting up for incremental sends, this dataset must exist on the receiving end.
### Determine the Source
Use `zfs list` to view the pools on the source system and select one to use for the following process.
### Create a Snapshot
On the Source System (where you want to back up from):
```
zfs snapshot -r source_pool/dataset@backup_snapshot_name
```
Example on my system:
```
sudo zfs snapshot -r rpool/USERDATA/home_dpwraq@home_20250916
```

This command creates a recursive snapshot (`-r`) of the `source_pool/dataset` and names it `backup_snapshot_name`. Replace `source_pool/dataset` with your actual ZFS dataset name and `backup_snapshot_name` with a descriptive name for your snapshot. 
### Send the snapshot
(to a remote server via ssh from the Source System)
Pipe the `zfs send` output to the `zfs recv` command on the destination system, typically through SSH. 
    - **For a full (initial) send**: The destination dataset does not need to exist beforehand. 

> [!NOTE] Show Progress
> To see the progress of the transmission, you will need to ensure that `pv` (Pipeline Viewer) is installed on the source machine.

```sh
zfs send -R source_pool/dataset@backup_snapshot_name | ssh user@backup_server zfs recv -F backup_pool/backup_dataset

# Showing progress as it works
sudo zfs send -R rpool/USERDATA/home_dpwraq@home_20250916 | pv | ssh nexus zfs recv -F zfs10/gearboxsnapshots
```

This command sends the snapshot stream to the remote server (`backup_server`) via `ssh`. 

- `-R` sends a replication stream, preserving all properties and descendent datasets.
- `user` is the username on the backup server.
- `backup_server` is the hostname or IP address of the backup server.
- `backup_pool/backup_dataset` is the ZFS dataset on the backup server where the data will be received.
- `-F` forces the receive, allowing it to overwrite existing data if needed.
### Incremental Backup
After the initial backup, you will want to use a much faster and lower resource intensive option - incremental backups.
> [!NOTE] For an incremental send
>  The destination dataset must exist and have the starting snapshot already received. This sends only the changes between two snapshots, which is much more efficient for subsequent backups. 
```
# On the source server:zfs send -i <source_pool>/<dataset>@<previous_snapshot> <source_pool>/<dataset>@<new_snapshot> | pv | ssh <user>@<remote_host> zfs recv -F <destination_pool>/<dataset>
```
`-i`: Sends an incremental stream from the `<previous_snapshot>` to the `<new_snapshot>`. 
### Example with Compression
For limited bandwidth, you can add compression to the pipeline. 
```
# On the source server:zfs send -i <previous_snapshot> <new_snapshot> | gzip | ssh <user>@<remote_host> "gunzip | zfs recv -F"
```

- `gzip`: Compresses the data stream on the sending side. 
- `gunzip | zfs recv -F`: Decompresses the data on the receiving side before it's received by `zfs recv`.
## Important Considerations:
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


