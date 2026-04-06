---
tags:
  - docker
  - swarm
---
# Shutting Down a Single Swarm Node

> In the Army, we call this a "Tactical Withdrawal." You don't just pull the plug; you move your troops out first.

To gracefully shut down a node in a Docker Swarm, you should "drain" it. This tells the Swarm manager to move any tasks (containers) running on that node to other available nodes in the cluster.

## Procedure
1.  **Drain the node**:
    ```bash
    docker node update --availability drain <node-id>
    ```
2.  **Verify tasks are moved**:
    ```bash
    docker node ps <node-id>
    ```
3.  **Shut down the OS**:
    Once all tasks have been successfully moved, you can safely shut down or reboot the node.

## Bringing it back online
When the node returns, you should set it back to "active":
```bash
docker node update --availability active <node-id>
```
