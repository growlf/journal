---
tags:
  - docker
  - deployment
  - optimization
  - paralellism
aliases:
  - parallelism
---
---
## Overview
***TL/DR***
Default settings in docker that are relevant are:
- the health-check (defined in the [image](https://docs.docker.com/reference/dockerfile/#healthcheck) and/or in the [stack](https://docs.docker.com/reference/compose-file/services/#healthcheck))
- deployment [replicas](https://docs.docker.com/reference/compose-file/deploy/#replicas), and 
- parallelism (in both [update](https://docs.docker.com/reference/compose-file/deploy/#update_config) and [rollback](https://docs.docker.com/reference/compose-file/deploy/#rollback_config) specifications) 

These can be tweaked to provide a smooth roll-out (and roll-back) with zero-down time firmly in mind.

Consider this pseudo example:
```yml
services:
  frontend:
    image: example/webapp
    healthcheck:
      test: ["CMD", "/path/to/test", "--param", "etc"]
      interval: 30s
      timeout: 10s
      retries: 5
      start_period: 10s
    deploy:
      mode: replicated
      replicas: 3
      update_config:
        parallelism: 2
        delay: 10s
        order: start-first
```
By having a `parallelism` of two and three `replicas` (along with a solid `healthcheck`) this deployment will cleanly upgrade two of the three deployed containers without even dropping the original two that they are replacing until they are fully running - thanks the healthcheck and the `order` of the `update_config`. **Then** it will circle back and update the remaining container as well.  Very stable, no downtime.
## Details
Often when creating stacks, especially at first, it is common to rely upon the defaults for how our containers and services are actually deployed.  This is all fine and dandy until you are facing production quality expectations that include near-zero down-time when upgrading or patching - or in the event of unexpected failures during a roll-out. 
### First, a Description of the Issue
By default, when Docker executes an update of a service, it will trigger the shutdown of the existing containers within the stack that have changed, start the new images, and *then* connect it to the expected networks and endpoints.  This means we have a gap of service availability between triggering the roll-out until the new service is fully up and running again.
While this gap is generally on a few seconds to a few minutes, this is typically not acceptable in production environments.
### The Goal
What would be better, is if the old containers *only shutdown **after*** the new one is up, running and available. Or, better yet - if one container was ***always*** left running and only swapped out once others are already updated and have taken over.  This would provide a clean migration for services even while they are in use, leaving the client-user with no awareness of the process happening.
### Step One - the Healthcheck
Ensure that either the container [image](https://docs.docker.com/reference/dockerfile/#healthcheck) or the definition for it's [service](https://docs.docker.com/reference/compose-file/services/#healthcheck) in your stack-file has a valid and appropriate healthcheck. This means that the healthcheck should do more than the default (merely return `true` once it is simply running), and focus a bit more on the validity of the service run-level.

Further, it should specify timing and other values that reflect the execution requirements and response, for best results.

For instance, consider the following stack file example:
```YAML
rabbitmq:
  image: "rabbitmq:management"
  healthcheck:
    test: ["CMD", "rabbitmq-diagnostics", "-q", "ping"]
    interval: 30s
    timeout: 10s
    retries: 5
    start_period: 10s
```
#### test
First off, the `test` used is an advanced built-in check that is specific to this image and allows for some easy customization with parameters.  In this case it is merely "pinging" its service with a query. This is typically a good indicator that the service is actually "ready" to serve.  It has a few other options as well:
- `rabbitmq-diagnostics check_running`: Verifies that the RabbitMQ application is running on the target node.
- `rabbitmq-diagnostics check_local_alarms`: Checks for any local alarms on the node.
- `rabbitmq-diagnostics check_port_connectivity`: Tests TCP connectivity to the RabbitMQ port (e.g., 5672).
- `rabbitmq-diagnostics check_virtual_hosts --timeout 60`: Checks if all configured virtual hosts are running on the target node within a specified timeout.

This also allows for some expert orchestration of services along a timeline of their availability.  Consider this example:
```YAML
  your_app:
    ...
    depends_on:
        rabbitmq:
            condition: service_healthy
```
Allowing the `your_app` container to stall starting up (and avoid it's own failing healthcheck due to failure to connect to the message queue properly) until the `rabbitmq` has passed the test and is fully up and serving its channels.
Not all containers come with adequate built-in checks though, so you may need to add them in either the stack-file or a custom image.
#### start_peroid
This needs to be a value that allows for the healthcheck to complete in a normal scenario. Think of it like a grace period. In this case, we are looking for all of the channels to have loaded and the service to respond normally. *Probe failure during this period will not be counted towards the maximum number of retries*. However, if a health check succeeds during the start period, the container is considered started and all consecutive failures will be counted towards the maximum number of retries.
#### interval
The health check will first run **interval** seconds after the container is started, and then again **interval** seconds after each previous check completes.
#### start_interval
The time between health checks during the **start period**.
#### retries
It takes **retries** consecutive failures of the health check for the container to be considered `unhealthy`
### Replicas
Having some extra copies running means that the update process has some wiggle room for juggling the running containers while it updates. Set the number or deployed replicas like so in the stack file:
```yml
services:
  frontend:
    image: example/webapp
    deploy:
      mode: replicated
      replicas: 3
```
### Parallelism
This is the real magic of a smooth deployment. There are two places that we specify parallelism in our service definition.
```YAML
services:
  frontend:
    image: example/webapp
    deploy:
      update_config:
        parallelism: 2
        delay: 10s
        order: start-first
```
#### update_config & rollback_config
These, obviously, configure how the service should be updated and, potentially, rolled back. Particularly useful for configuring rolling updates like what we want to do.

Both update and rollback configs have the almost the same parameters.
- `parallelism`: The number of containers to update/rollback at a time. If set to 0, all containers affected simultaneously. **We want a number less than "all" of them to allow a straggler to continue serving to clients** with the "old but known good" version, while we update.
- `delay`: The time to wait between each container group's update/rollback (default 0s). This is fine for our purposes in most cases.
- `failure_action`: What to do if an update/rollback fails. One of `continue` or `pause` (with the default being `pause`). For updates you can also specify `rollback`.
- `monitor`: Duration after each task update to monitor for failure `(ns|us|ms|s|m|h)` (default 0s). This might need some tweaking for specific services.
- `max_failure_ratio`: Failure rate to tolerate during a update/rollback (default 0).
- `order`: Order of operations during updates/rollbacks. One of `stop-first` (old task is stopped before starting new one), or `start-first` (new task is started first, and the running tasks briefly overlap) (default `stop-first`). **We need to use `start-first`** to ensure that the new container is available/running before shutting the old ones down.