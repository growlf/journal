---
title: Device Catalog
tags:
  - devices
  - index
---
# Device Catalog

This is a sanitized view of the devices in the network.

```dataview
TABLE 
  type,
  model,
  os,
  IP
FROM "Network/Devices"
WHERE file.name != this.file.name
SORT file.name ASC
```
