---
Ports: 554, 8000, 80, 443
tags:
  - services
  - security
  - camera
address: 
service description: ReoLink security cameras.
management_url: 
hosts:
Documentation: https://support.reolink.com/
---
# ReoLink Cameras

> In the Army, we had "Sentry Posts." ReoLink is our sentry for the home.

## Description
ReoLink offers a wide range of affordable and capable security cameras. They are popular in home labs because many of their models support standard protocols like RTSP and ONVIF, making them easy to integrate with tools like Home Assistant or Frigate.

## Knowledge Check
- [ ] Have you enabled the RTSP/ONVIF streams in the camera's settings?
- [ ] Are you using a dedicated VLAN for your cameras to isolate them from your main network?

## Common Pitfalls
- **Default Credentials**: Always change the default admin password immediately.
- **Firmware Updates**: Check for firmware updates manually as the auto-update feature can be unreliable.
