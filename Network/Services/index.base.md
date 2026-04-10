---
title: Service Catalog
tags:
  - services
  - index
---
# Service Catalog

This is a sanitized view of the services running in the network.

```dataview
TABLE 
  status,
  type,
  node
FROM "Network/Services"
WHERE file.name != this.file.name
SORT file.name ASC
```
