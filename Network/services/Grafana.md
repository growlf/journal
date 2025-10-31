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
management_url: http://grafana.yeticraft.net:3000/
---
Grafana is an open-source, web-based platform for querying, visualizing, and creating dashboards from your data, no matter where it's stored. It is used to monitor infrastructure and applications by transforming time-series data into beautiful graphs and charts, which helps users analyze performance and make data-driven decisions.  

Key features and functions
- **Data visualization:** 
    Transforms data from various sources, such as Prometheus, [Loki](https://www.google.com/search?num=10&newwindow=1&sca_esv=5174aa7661d349ca&cs=1&sxsrf=AE3TifP7-_6if7FmMbMimxJBW-pzle52rA%3A1761682125924&q=Loki&sa=X&ved=2ahUKEwjenq-q2ceQAxV3JUQIHalUN6AQxccNegQIHxAB&mstk=AUtExfB7axZKkdVqLuHY2EtVoGIizVVCisTfV6VgRnJoV6SW46RJYYGiHgLsK27QTUgDGPSm33is2qVdApBaGkXd4MmprEnzYnnqlh-9PDMX3tVLAiNMkWtBnpNbjHIP4pCbFsH20B1ZX4vwRLSdTDzACsutQmuwrSAE-rdd_rbGf936h8s&csui=3), and [Elasticsearch](https://www.google.com/search?num=10&newwindow=1&sca_esv=5174aa7661d349ca&cs=1&sxsrf=AE3TifP7-_6if7FmMbMimxJBW-pzle52rA%3A1761682125924&q=Elasticsearch&sa=X&ved=2ahUKEwjenq-q2ceQAxV3JUQIHalUN6AQxccNegQIHxAC&mstk=AUtExfB7axZKkdVqLuHY2EtVoGIizVVCisTfV6VgRnJoV6SW46RJYYGiHgLsK27QTUgDGPSm33is2qVdApBaGkXd4MmprEnzYnnqlh-9PDMX3tVLAiNMkWtBnpNbjHIP4pCbFsH20B1ZX4vwRLSdTDzACsutQmuwrSAE-rdd_rbGf936h8s&csui=3), into visually appealing and informative graphs and dashboards. 
- **Observability:** 
    Allows users to visualize metrics, logs, and traces from different systems in one place, providing a unified view of performance and system health. 
- **Alerting:** 
    Enables the creation and management of alerts within a single UI, allowing teams to respond to issues proactively. 
- **Multiple data sources:** 
    Supports a wide range of data sources, including databases, cloud services like AWS CloudWatch, and time-series databases. 
- **Extensibility:** 
    Can be extended with custom plugins to add new data sources, panels, and features, making it highly flexible. 
- **Open-source and enterprise versions:** 
    Available as a free, open-source project or as a commercial enterprise and cloud offering with additional features and support. 

Who uses Grafana
- Developers and operations teams use it to monitor the health of their applications and infrastructure.
- Businesses use it to gain insights from their data and make more informed decisions.
## The Goal
To tie together all of the services necessary to completely monitor all resources on mission critical services, containers, servers, etc. for the purposes of alerting and debugging issues before they become major.

NOTE: None of these demonstration links to anything in the `yeticraft.net` domain are real. So don't expect them to work for you.  When I spin up my home lab, it generates DNS entries for my [[LXC]], Containers, and VMS that are entirely behind the lab firewall - not to mention they are only temporary.
## The Journey
This one is fairly lengthy, so get a cup of tea, have a sit on the comfy chair and take your time reading through this.
### Grafana
I started with installing Grafana as a standalone [[LXC]] on my [[Proxmox]] server using a [script](https://community-scripts.github.io/ProxmoxVE/scripts?id=grafana). It looks like it is running fine at http://grafana.yeticraft.net:3000/. Nothing there though.  I need some data first.
### Prometheus
I then installed [Prometheus](https://community-scripts.github.io/ProxmoxVE/scripts?id=prometheus) the same way. I logged into the resultant LXC and edited the `/etc/prometheus/prometheus.yml` file as [described](https://prometheus.io/docs/prometheus/latest/getting_started/), to monitor itself. It was mostly already there though - just minor additions. I then configured a connection to it in Grafana by going to `connections` in Grafana and configuring the connection for it from the rather large list of options. 

Using the well known property `prometheus_target_interval_length_seconds` as a query focus, I can see that it is working. A bit boring... but seems to be accumulating data about itself just fine. http://prometheus.yeticraft.net:9090/
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
And then immediately went to the web interface at http://dock1.yeticraft.net:8080/ - it works! My, there is a lot of good info in there!

A good 20 minutes of playing around CAdvisor's interface later, I read the [storage instructions](https://github.com/google/cadvisor/blob/master/docs/storage/prometheus.md) to get all of that lovely data into [[Prometheus]] and thus into my friendly [[Grafana]] interface. Opening a terminal to the Prometheus container, I added the following to it's scrape config list:
```yaml
  - job_name: 'cadvisor'
    scrape_interval: 5s # Adjust as needed
    static_configs:
      - targets: ['dock1.yeticraft.net:8080'] # Replace 'cadvisor' with the hostname or IP of your cAdvisor instance
```
Then restarted the daemon like so:
```bash
systemctl daemon-reload && systemctl restart prometheus
```
After a quick look at the data through Grafana's Explore tab - I can see that there is definitely data coming in!
### Docker Dashboard
This seems like a great time to load a [Grafana Labs Dashboards](https://grafana.com/grafana/dashboards) and see the beginning of the usefulness of this set of tools. I'll build my own later and customize it specifically to my needs but, for now, this is the easiest and fastest way to get some joy. 

I browsed through the available dashboards, setting the filters for 'Prometheus' as the data-source and 'Docker' as the category... selected a dashboard or three to try out. Each dashboard has a numeric ID that can then be imported on the Grafana Dashboards panel.
### Proxmox Server Data

Found [this](https://github.com/prometheus-pve/prometheus-pve-exporter/) little gem. Just run it in your docker system, and feed it some valid credentials from the Proxmox, and WHEEEE!  There is a related dashboard as well.

### Linux Node Data
Added node exporters to all of my Linux servers with this [guide](https://grafana.com/docs/grafana-cloud/send-data/metrics/metrics-prometheus/prometheus-config-examples/noagent_linuxnode/#monitoring-a-linux-host-using-prometheus-and-node_exporter) and this [guide](https://prometheus.io/docs/guides/node-exporter/).  I created an install script that just adds it to the system as a service like so:
```bash
#!/bin/sh

### Download and install the linux node exporter
wget -P /tmp/exporter https://github.com/prometheus/node_exporter/releases/download/v1.9.1/node_exporter-1.9.1.linux-amd64.tar.gz
tar xvfz /tmp/exporter/node_exporter-*.*-amd64.tar.gz -C /tmp/exporter
sudo mv /tmp/exporter/node_exporter-1.9.1.linux-amd64/node_exporter /usr/local/bin/
sudo ufw allow 9100/tcp
sudo firewall-cmd --add-port=9100/tcp --permanent && sudo firewall-cmd --reload

### Create the system user, service file, enable it, and start it
sudo useradd --no-create-home --shell /bin/false node_exporter
sudo tee -a /etc/systemd/system/node-exporter.service > /dev/null << 'EOF'
[Unit]
Description=Prometheus Node Exporter
After=network.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOF
sudo chmod +x /etc/systemd/system/node-exporter.service
sudo systemctl daemon-reload
sudo systemctl enable node-exporter.service
sudo systemctl start node-exporter.service
sudo systemctl status node-exporter.service
```
I prefer to run the exporter directly as a binary service instead of as a container because it seems more stable and will be available sooner than if it waits for docker and it's other stacks to load (or if docker is offline for some reason).

I imported the related dashboard ( # `10180`) in my Grafana instance and immediately had some beautiful graphs of each of my nodes.
### Generic Server Metrics

Getting the drive space, RAM, CPU load, network bandwidth / interface, etc...
### Alerting

This is next. Alerting can be done from multiple methods - both Prometheus and Grafana support it.  Ill be detailing this a bit more soon.

### Links during Discovery
- [Loki](https://grafana.com/docs/loki/latest/)
- [Prometheus](https://grafana.com/docs/grafana/latest/datasources/prometheus/) and/or [InfluxDB](https://docs.influxdata.com/influxdb/v2/install/use-docker-compose/)
	- [Prometheus config docs](https://prometheus.io/docs/prometheus/latest/configuration/configuration/)
	- [DNS Service Discovery](https://prometheus.io/docs/prometheus/latest/configuration/configuration/#dns_sd_config)
- Node Exporter
	- https://grafana.com/docs/grafana-cloud/send-data/metrics/metrics-prometheus/prometheus-config-examples/docker-compose-linux/
- cAdvisor
- Promtail
- [Grafana Labs Dashboards](https://grafana.com/grafana/dashboards)
- https://blog.devops.dev/a-beginners-guide-to-monitoring-docker-swarm-with-grafana-7def8ed5843f
- [Proxmox Exteran Metrics](https://pve.proxmox.com/wiki/External_Metric_Server) with [InfluxDB](https://docs.influxdata.com/influxdb/v2/install/use-docker-compose/)
- Proxmox_pve_exporter
	- https://blog.devops.dev/just-do-grafana-monitor-proxmox-with-prometheus-23312d3e8349
- Linux Host Exporter
	- https://grafana.com/docs/grafana-cloud/send-data/metrics/metrics-prometheus/prometheus-config-examples/noagent_linuxnode/#monitoring-a-linux-host-using-prometheus-and-node_exporter
- SMTP [configuration](https://grafana.com/docs/grafana/latest/setup-grafana/configure-grafana/#smtp) - Example environment section in the `compose.yml`:

  ```yaml
      GF_SMTP_ENABLED: "true"
      GF_SMTP_HOST: "smtp.gmail.com:587"
      GF_SMTP_USER: "no_reply@yourdomain.tld"
      GF_SMTP_PASSWORD: """your_smtp_password"""
      GF_SMTP_SKIP_VERIFY: "false"
      GF_SMTP_FROM_ADDRESS: "grafana@yourdomain.tld"
      GF_SMTP_FROM_NAME: "Grafana Alerts"
```

Specific dashboards:
- [Docker Swarm and Grafana](https://grafana.com/grafana/dashboards/609-docker-swarm-container-overview/)
- https://grafana.com/grafana/dashboards/11939-ssc-services-2/
- https://community.grafana.com/t/promtail-config-and-setup-for-docker-swarm-containers/136766/9
In use:
- https://grafana.com/grafana/dashboards/13679-mikrotik-mktxp-exporter/
	- https://github.com/akpw/mktxp#getting-started
- https://grafana.com/grafana/dashboards/17139-mikrotik-loki-logs/
- https://grafana.com/grafana/dashboards/3590-grafana-internals/
