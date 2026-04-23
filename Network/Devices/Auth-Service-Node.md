---

Active: true
IP: 10.0.2.12
Updated: 2026-04-07
model: LLDAP (LXC 118)
networks:
- 10.0.2.0/24
os: Debian
tags:
- service
- ldap
- auth
- devices
type: service-host
---


# Description
- Last Updated: **`=this.Updated`**
- Active: **`=this.Active`**
- Type:  `=this.type`
- IP: **`=this.IP`**
- model: **`=this.model`**
- os: **`=this.os`**
- networks: **`=this.networks`**
- tags: **`=this.tags`**

LXC hosting the LLDAP directory service for centralized authentication.

## Tasks
- [ ] Document integrated services.
