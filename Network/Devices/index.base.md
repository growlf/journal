---
tags:
- devices
- index
title: Device Catalog
---
# Sanitized View
> [!NOTE] Public Version
> This is a sanitized version of the internal documentation for community and learning purposes.

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
