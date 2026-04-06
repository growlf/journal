---
tags:
  - docker
  - swarm
  - maintenance
  - shutdown
  - guide
---
To safely shut down a Docker Swarm for physical maintenance, you must first stop all services and drain the worker nodes, then safely shut down the manager nodes. This graceful process prevents data loss and corruption. Simply turning off the servers is not recommended, as it can disrupt the swarm's state and lead to inconsistencies. 

> [!NOTE] This is for shutting down the entire swarm
> If you only need to shutdown or remove a single node from Docker service, please see [[Shutting Down a Single Swarm Node]] instead.

Before you begin
- **Back up your swarm:** Back up the entire `/var/lib/docker/swarm` directory on a manager node. If auto-lock is enabled, make sure you also have the unlock key.
- **Communicate downtime:** Inform your team and affected stakeholders about the planned maintenance window.
- **Access the cluster:** Log in to a manager node with SSH. 
## Step 1: Scale down all services
Use the `docker service ls` command to list all active services. Then, scale each service down to zero replicas. This ensures all containers are stopped gracefully, allowing for proper cleanup. 
```sh
# List all running services
docker service ls

# For each service, scale it down
docker service scale <SERVICE_NAME>=0
```
## Step 2: Drain worker nodes
Set the availability of all worker nodes to `drain`. This will cause the swarm manager to stop any remaining tasks on those nodes and prevent it from assigning any new tasks to them. 
```sh
# List all nodes to get their IDs or hostnames
docker node ls

# Set each worker node to drain
docker node update --availability drain <NODE_NAME_OR_ID>
```
## Step 3: Demote extra manager nodes
If you have multiple manager nodes, demote all but one to worker status to prevent quorum issues during the shutdown. The last remaining manager will be shut down in a later step. 
```sh
# On an active manager node, identify the managers to demote
docker node ls

# Demote a manager. Replace <MANAGER_NODE> with its name or ID
docker node demote <MANAGER_NODE>
```
## Step 4: Stop Docker on worker nodes
Once all worker nodes are drained and have no running tasks, stop the Docker daemon on each worker. 
```sh
# On each worker node
sudo systemctl stop docker
```
## Step 5: Shut down the remaining manager node
After all other nodes are shut down, perform a clean shutdown of the last remaining manager node to safely stop the swarm. 
```sh
# Stop the Docker daemon on the final manager node
sudo systemctl stop docker
```
At this point, all services are stopped and the swarm is completely shut down. You can now safely perform physical maintenance on your server infrastructure. 
# Startup procedure
1. **Start the main manager:** After maintenance is complete, boot up the last manager node that you shut down.
2. **Start other managers:** Start the Docker daemon on the other manager nodes. They will rejoin the swarm.
3. **Start worker nodes:** Boot up all worker nodes and start their Docker daemons.
4. **Activate all nodes:** Set the availability of all drained nodes back to `active`. 
```sh
docker node update --availability active <NODE_NAME_OR_ID
```
5. **Restart services:** Scale your services back up to their original replica count.
```sh
docker service scale <SERVICE_NAME>=<REPLICA_COUNT>
```