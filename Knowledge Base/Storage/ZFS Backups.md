---
tags: 
Creation date: 2026-04-12 22:46
Documentation: 
aliases:
---
To send a ZFS snapshot to another server, use the `zfs send` command to create a snapshot stream and pipe it over SSH to the `zfs recv` command on the destination server. The basic command is `zfs send <pool>/<dataset>@<snapshot> | ssh user@remote_host zfs recv <pool>/<dataset>`, but you can use flags like `-R` for a recursive replication stream, `-i` or `-I` for incremental snapshots, or add compression like `gzip` for bandwidth-constrained environments. 

Before you start:

1. [**Establish a pool on the destination server:**](https://www.google.com/search?num=10&newwindow=1&sca_esv=348adf5b6927ae42&cs=1&sxsrf=AE3TifOKrAY9exZDn_k__pWgHMZ7B-MJIA%3A1758058260561&q=Establish+a+pool+on+the+destination+server&sa=X&ved=2ahUKEwi3ud6wnd6PAxV-ITQIHTL-KfAQxccNegQIDRAD&mstk=AUtExfANBMBI8CPWuu3GurkMdL69LisHXjsItnex3X4SWOs_5ZoRdjOv2q5AMDckJAA197RwJdt-xUoJPqP_mg5Bw3ZmwfSSmN-lin02sX9aXg6CtyJjjNxoicD7XzCi-n5udUfYvxhEkTUgBTr9eZDUwRiO8Znj1nGtsx7oCK7qDCZBFaP_qS_P10omDBUNonR7oXA7P0RzQ2rifL2fUJOLuWdNjpt230Txe0amHOCaONDUguRHwoMjhPsux3gkbiCVpfkPXZ6_ZCKT5L0oJJNUIqQU-ojUL6NS1yrHhp1WG3zfnQ&csui=3) 
    
    The receiving server must have a ZFS pool set up to store the incoming data. 
    
2. [**Ensure SSH connectivity:**](https://www.google.com/search?num=10&newwindow=1&sca_esv=348adf5b6927ae42&cs=1&sxsrf=AE3TifOKrAY9exZDn_k__pWgHMZ7B-MJIA%3A1758058260561&q=Ensure+SSH+connectivity&sa=X&ved=2ahUKEwi3ud6wnd6PAxV-ITQIHTL-KfAQxccNegQIGRAD&mstk=AUtExfANBMBI8CPWuu3GurkMdL69LisHXjsItnex3X4SWOs_5ZoRdjOv2q5AMDckJAA197RwJdt-xUoJPqP_mg5Bw3ZmwfSSmN-lin02sX9aXg6CtyJjjNxoicD7XzCi-n5udUfYvxhEkTUgBTr9eZDUwRiO8Znj1nGtsx7oCK7qDCZBFaP_qS_P10omDBUNonR7oXA7P0RzQ2rifL2fUJOLuWdNjpt230Txe0amHOCaONDUguRHwoMjhPsux3gkbiCVpfkPXZ6_ZCKT5L0oJJNUIqQU-ojUL6NS1yrHhp1WG3zfnQ&csui=3) 
    
    Make sure you can SSH from the source to the destination server and have appropriate user permissions on both ends. 
    
3. [**Take a snapshot on the source:**](https://www.google.com/search?num=10&newwindow=1&sca_esv=348adf5b6927ae42&cs=1&sxsrf=AE3TifOKrAY9exZDn_k__pWgHMZ7B-MJIA%3A1758058260561&q=Take+a+snapshot+on+the+source&sa=X&ved=2ahUKEwi3ud6wnd6PAxV-ITQIHTL-KfAQxccNegQIGhAD&mstk=AUtExfANBMBI8CPWuu3GurkMdL69LisHXjsItnex3X4SWOs_5ZoRdjOv2q5AMDckJAA197RwJdt-xUoJPqP_mg5Bw3ZmwfSSmN-lin02sX9aXg6CtyJjjNxoicD7XzCi-n5udUfYvxhEkTUgBTr9eZDUwRiO8Znj1nGtsx7oCK7qDCZBFaP_qS_P10omDBUNonR7oXA7P0RzQ2rifL2fUJOLuWdNjpt230Txe0amHOCaONDUguRHwoMjhPsux3gkbiCVpfkPXZ6_ZCKT5L0oJJNUIqQU-ojUL6NS1yrHhp1WG3zfnQ&csui=3) 
    
    Use `zfs snapshot <source_pool>/<dataset>@<snapshot_name>` on the source server to create the snapshot you want to send. 
    

Full Replication (Initial Backup)

This sends the entire dataset with all its properties and descendants. 

Code

```
# On the source server:zfs send -R <source_pool>/<dataset>@<full_snapshot> | ssh <user>@<remote_host> zfs recv -F <destination_pool>/<dataset>
```

- `-R`: Sends a recursive replication stream, preserving properties, snapshots, and descendant file systems. 
- `-F`: (On the receiving side) Rollbacks the target if necessary and expands the target pool to match the source. 

Incremental Backup

This sends only the changes between two snapshots, which is much more efficient for subsequent backups. 

Code

```
# On the source server:zfs send -i <source_pool>/<dataset>@<previous_snapshot> <source_pool>/<dataset>@<new_snapshot> | ssh <user>@<remote_host> zfs recv -F <destination_pool>/<dataset>
```

- `-i`: Sends an incremental stream from the `<previous_snapshot>` to the `<new_snapshot>`. 

Example with Compression

For limited bandwidth, you can add compression to the pipeline. 

Code

```
# On the source server:zfs send -i <previous_snapshot> <new_snapshot> | gzip | ssh <user>@<remote_host> "gunzip | zfs recv -F"
```

- `gzip`: Compresses the data stream on the sending side. 
- `gunzip | zfs recv -F`: Decompresses the data on the receiving side before it's received by `zfs recv`.

```bash
zfs list
zfs snapshot rpool/USERDATA/home_dpwraq@home_20250916
sudo zfs send -R rpool/USERDATA/home_dpwraq@home_20250916 | pv | ssh nexus zfs recv -F zfs10/gearboxsnapshots
```
