---
banner: "![[NetworkMap.light.svg]]"
tags:
  - bms
  - map
  - network
---
# BMS Network Map (10.10.0.0/16)

This diagram represents the logical layout of the Bellingham Makerspace LAN.

```mermaid
graph TD
    subgraph WAN
        ISP[Fiber Gateway]
    end

    subgraph Core
        ISP --> Mikrotik[BMS-Core Router <br/> 10.10.0.1]
        Mikrotik --> Switch1[Main Switch]
    end

    subgraph Infrastructure
        Switch1 --> DNS[DNS Server <br/> 10.10.0.4]
        Switch1 --> Door[Mercury Access Controller <br/> 10.10.1.24]
        Switch1 --> Print[Brother Printer <br/> 10.10.0.18]
        
        subgraph Proxmox_Cluster
            Switch1 --> PVE1[BMS-PVE-01 <br/> 10.10.0.5]
            Switch1 --> PVE2[BMS-PVE-02 <br/> 10.10.0.7]
            Switch1 --> PVE3[BMS-PVE-03 <br/> 10.10.0.8]
            Switch1 --> PVE4[BMS-PVE-04 <br/> 10.10.0.13]
        end
    end

    subgraph Public_LAN
        Mikrotik -.-> Guest[Guest WiFi <br/> 10.10.128.0/18]
        Switch1 --> APs[Unifi APs]
    end

    subgraph Lab_Space
        Switch1 --> Pis[IoT Devices / Raspberry Pis]
        Pis --> Cam[Reolink Cameras <br/> 10.10.0.23]
    end
```

## Critical Segments
- **Infrastructure (10.10.0.0/24):** Core routers, servers, and fixed infrastructure.
- **Office/Management (10.10.1.0/24):** Office machines, printers, and door access.
- **Dynamic DHCP (10.10.2.0 - 10.10.63.255):** Member devices and wired connections.
- **WiFi Clients (10.10.64.0/18):** Wireless users and mobile devices.

---
*Related: [[Network/Networks/BMS/index]]*
