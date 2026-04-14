---
Ports: 3000
tags:
  - monitoring
  - grafana
service description: Open source observability and visualization platform.
Documentation: https://grafana.com/docs/
---
# Grafana

> In the Army, we had "Situation Maps." Grafana is your situation map for the digital world.

## Description
Grafana is the open-source platform for monitoring and observability. It allows you to query, visualize, alert on, and understand your metrics no matter where they are stored.

In our lab, it's typically used as the **P (Primary)** monitoring dashboard, often backed by [[Knowledge Base/Tools/Prometheus]] or [[InfluxDB]].

## Knowledge Check
- [ ] Have you connected your data sources?
- [ ] Are you using any community dashboards (e.g., Node Exporter for Linux)?

## Common Pitfalls
- **Over-Visualization**: Too many graphs can lead to "dashboard blindness." Focus on the metrics that actually matter.
- **Alert Fatigue**: Don't alert on everything. Only alert on things that require human intervention.
