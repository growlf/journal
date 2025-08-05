---
tags:
  - monitoring
  - alerting
  - lab
  - deployment
Creation date: Monday April 4th 2022 11:18:30
modification date: Thursday 31st July 2025 18:06:43
Documentation: https://grafana.com/docs/grafana/latest/
aliases:
---
---
## The Goal
To tie together all of the services necessary to completely monitor all resources on mission critical services, containers, servers, etc. for the purposes of alerting and debugging issues before they become major.

NOTE: None of these demonstration links to anything in the `yeticraft.net` domain are real. So don't expect them to work for you.  When I spin up my home lab, it generates DNS entries for my LXCs, Containers, and VMS that are entirely behind the lab firewall - not to mention they are only temporary.

## The Journey

### Grafana
I started with installing Grafana as a standalone [[LXC]] on my [[Proxmox]] server using a [script](https://community-scripts.github.io/ProxmoxVE/scripts?id=grafana). It looks like it is running fine at http://grafana.yeticraft.net:3000/. Nothing there though.  I need some data first.
### Prometheus
I then installed [Prometheus](https://community-scripts.github.io/ProxmoxVE/scripts?id=prometheus) the same way. I logged into the resultant LXC and edited the `/etc/prometheus/prometheus.yml` file as [described](https://prometheus.io/docs/prometheus/latest/getting_started/), to monitor itself. It was mostly already there though - just minor additions. I then configured a connection to it in Grafana by going to `connections` in Grafana and configuring the connection for it from the rather large list of options. 

Using the well known property `prometheus_target_interval_length_seconds` as a query focus, I can see that it is working. A bit borng... but seems to be accumulating data about itself just fine.
### CAdvisor
Lets monitor some [[Docker]] containers. That should be more exciting!

Using the documentation - [Promethus as the back end](https://github.com/google/cadvisor/blob/master/docs/storage/prometheus.md) for CAdvisor - I logged into my docker server (a manager node named `dock1`) and ran the following:
```sh
#!/bin/sh

#VERSION=v0.53.0 # use the latest release version from https://github.com/google/cadvisor/releases
sudo docker run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:ro \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --volume=/dev/disk/:/dev/disk:ro \
  --publish=8080:8080 \
  --detach=true \
  --name=cadvisor \
  --privileged \
  --device=/dev/kmsg \
  gcr.io/cadvisor/cadvisor:${VERSION:-latest}
```
And then immediately went to the web interface at `http://dock1.yeticraft.net:8080/` - it works! My, there is a lot of good info in there!

A good 20 minutes of playing around it CAdvisor's interface later, I followed the [storage instructions](https://github.com/google/cadvisor/blob/master/docs/storage/prometheus.md) to get the data into [[Prometheus]] and thus into my lovely [[Grafana]].

### Links
- [Loki](https://grafana.com/docs/loki/latest/)
- [Prometheus](https://grafana.com/docs/grafana/latest/datasources/prometheus/) and/or [InfluxDB](https://docs.influxdata.com/influxdb/v2/install/use-docker-compose/)
	- [Prometheus config docs](https://prometheus.io/docs/prometheus/latest/configuration/configuration/)
- Node Exporter
	- https://grafana.com/docs/grafana-cloud/send-data/metrics/metrics-prometheus/prometheus-config-examples/docker-compose-linux/
- cAdvisor
- Promtail
- [Grafana Labs Dashboards](https://grafana.com/grafana/dashboards)
- https://blog.devops.dev/a-beginners-guide-to-monitoring-docker-swarm-with-grafana-7def8ed5843f
- [Proxmox Exteran Metrics](https://pve.proxmox.com/wiki/External_Metric_Server) with [InfluxDB](https://docs.influxdata.com/influxdb/v2/install/use-docker-compose/)
Specific dashboards:
- [Docker Swarm and Grafana](https://grafana.com/grafana/dashboards/609-docker-swarm-container-overview/)
- https://grafana.com/grafana/dashboards/11939-ssc-services-2/
- https://community.grafana.com/t/promtail-config-and-setup-for-docker-swarm-containers/136766/9


