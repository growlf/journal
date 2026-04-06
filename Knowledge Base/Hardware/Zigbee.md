---
title: Zigbee
---

# Zigbee: The Wireless Mesh for Home Automation

Zigbee is a low-power, low-data-rate wireless mesh networking standard. Unlike Wi-Fi, it's designed for tiny battery-powered devices like sensors and switches.

## Why Zigbee in the Lab?
- **Mesh Networking:** Every mains-powered device (like a smart plug or light bulb) acts as a "router," extending the network's reach.
- **Privacy First:** It's local only. No cloud required to turn on your lights.
- **Battery Life:** Sensors can last for years on a single button cell.

## NetYeti's Implementation Stack
- **Coordinator:** The "Brain." I recommend the Sonoff ZBDongle-E or SkyConnect.
- **Controller:** 
    - **Zigbee2MQTT:** Highly flexible, supports the most devices.
    - **ZHA (Zigbee Home Automation):** Built directly into Home Assistant for easy setup.

## Best Practices
- **Interference:** Keep your Zigbee coordinator away from your Wi-Fi router (they both use 2.4GHz).
- **Placement:** Distribute mains-powered "routers" throughout your house to ensure a strong mesh.

### Knowledge Check:
- Are your Zigbee and Wi-Fi channels overlapping? (Check the channel mapping!)
- Have you secured your Zigbee network with a custom key?
