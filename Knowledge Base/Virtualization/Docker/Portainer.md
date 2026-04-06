---
Ports: 9000, 9443
tags:
  - services
  - docker
address: 
service description: Container management UI for Docker and Kubernetes.
management_url: 
hosts:
Documentation: https://docs.portainer.io/
---
# Portainer

> In the Army, we have "Command Posts." Portainer is your Command Post for Docker. It gives you a visual overview of your "digital troops" (containers) and lets you deploy them with ease.

## Description
Portainer is a powerful, open-source tool set that allows you to easily build and manage containers in Docker, Swarm, Kubernetes, and Azure ACI.

It's a "must-have" for any home lab running more than a couple of containers. It makes managing stacks (docker-compose) much more manageable.

## Knowledge Check
- [ ] Do you have the agent installed on your remote nodes?
- [ ] Are you using the Business Edition (free for up to 3 nodes) or the Community Edition?

## Common Pitfalls
- **Port Conflicts**: Ensure ports 9000 (HTTP) or 9443 (HTTPS) are not already in use on your host.
- **Volume Persistence**: Always map `/data` to a persistent volume so you don't lose your configuration on restart.
