---
tags:
documentation:
aliases:
---
# Description
Supplemental scripts and configuration examples for [[Sparse Page]].
## Docker Deployment
For single Docker server deployment, use the [[#Standalone version]]. For environments where you have Docker Swarm deployed, use the [[#Swarm version]]
### Standalone version
```YAML
services:

  couchdb:
    image: couchdb:latest
    container_name: couchdb-for-ols
    user: 5984:5984
    environment:
      - COUCHDB_USER
      - COUCHDB_PASSWORD
    volumes:
      - ./couchdb-data:/opt/couchdb/data
      - ./couchdb-etc:/opt/couchdb/etc/local.d
    ports:
      - ${COUCHDB_PORT:-5984}:5984
    restart: unless-stopped
```
### Swarm version
```YAML
services:

  couchdb:
    image: couchdb:latest
    container_name: couchdb-for-ols
    user: 5984:5984
    environment:
      - COUCHDB_USER
      - COUCHDB_PASSWORD
    volumes:
      - /pools/pool2/couchdb/data:/opt/couchdb/data
      - /pools/pool2/couchdb/etc:/opt/couchdb/etc/local.d
    ports:
      - ${COUCHDB_PORT:-5984}:5984
    restart: unless-stopped
    deploy:
      update_config:
        parallelism: 2
        delay: 10s
        order: start-first

```
## Configuration
### Example .env
```sh
COUCHDB_USER=${COUCHDB_USER:-obsidian}
COUCHDB_PASSWORD=${COUCHDB_PASSWORD:-changeme}
COUCHDB_PORT=${COUCHDB_PORT:-5984}
COUCHDB_HOSTNAME=${COUCHDB_HOSTNAME:-localhost}
COUCHDB_HOST=${COUCHDB_HOSTNAME}:${COUCHDB_PORT}
```
### Database Initialization
After the container or service is up, use the following script (along with the environment variables above) to configure the  database for obsidian.
```bash
#!/bin/bash

source .env

if [[ -z "$COUCHDB_HOSTNAME" ]]; then
    echo "ERROR: Hostname missing"
    exit 1
fi
if [[ -z "$COUCHDB_USER" ]]; then
    echo "ERROR: Username missing"
    exit 1
fi

if [[ -z "$COUCHDB_PASS" ]]; then
    echo "ERROR: Password missing"
    exit 1
fi

COUCHDB_PORT=${COUCHDB_PORT:-5984}
COUCHDB_HOST=${COUCHDB_HOSTNAME}:${COUCHDB_PORT}

echo "-- Configuring CouchDB by REST APIs... -->"

until (curl -X POST "${COUCHDB_HOST}/_cluster_setup" -H "Content-Type: application/json" -d "{\"action\":\"enable_single_node\",\"username\":\"${COUCHDB_USER}\",\"password\":\"${COUCHDB_PASS}\",\"bind_address\":\"0.0.0.0\",\"port\":5984,\"singlenode\":true}" --user "${COUCHDB_USER}:${COUCHDB_PASS}"); do sleep 5; done
until (curl -X PUT "${COUCHDB_HOST}/_node/nonode@nohost/_config/chttpd/require_valid_user" -H "Content-Type: application/json" -d '"true"' --user "${COUCHDB_USER}:${COUCHDB_PASS}"); do sleep 5; done
until (curl -X PUT "${COUCHDB_HOST}/_node/nonode@nohost/_config/chttpd_auth/require_valid_user" -H "Content-Type: application/json" -d '"true"' --user "${COUCHDB_USER}:${COUCHDB_PASS}"); do sleep 5; done
until (curl -X PUT "${COUCHDB_HOST}/_node/nonode@nohost/_config/httpd/WWW-Authenticate" -H "Content-Type: application/json" -d '"Basic realm=\"couchdb\""' --user "${COUCHDB_USER}:${COUCHDB_PASS}"); do sleep 5; done
until (curl -X PUT "${COUCHDB_HOST}/_node/nonode@nohost/_config/httpd/enable_cors" -H "Content-Type: application/json" -d '"true"' --user "${COUCHDB_USER}:${COUCHDB_PASS}"); do sleep 5; done
until (curl -X PUT "${COUCHDB_HOST}/_node/nonode@nohost/_config/chttpd/enable_cors" -H "Content-Type: application/json" -d '"true"' --user "${COUCHDB_USER}:${COUCHDB_PASS}"); do sleep 5; done
until (curl -X PUT "${COUCHDB_HOST}/_node/nonode@nohost/_config/chttpd/max_http_request_size" -H "Content-Type: application/json" -d '"4294967296"' --user "${COUCHDB_USER}:${COUCHDB_PASS}"); do sleep 5; done
until (curl -X PUT "${COUCHDB_HOST}/_node/nonode@nohost/_config/couchdb/max_document_size" -H "Content-Type: application/json" -d '"50000000"' --user "${COUCHDB_USER}:${COUCHDB_PASS}"); do sleep 5; done
until (curl -X PUT "${COUCHDB_HOST}/_node/nonode@nohost/_config/cors/credentials" -H "Content-Type: application/json" -d '"true"' --user "${COUCHDB_USER}:${COUCHDB_PASS}"); do sleep 5; done
until (curl -X PUT "${COUCHDB_HOST}/_node/nonode@nohost/_config/cors/origins" -H "Content-Type: application/json" -d '"app://obsidian.md,capacitor://localhost,http://localhost"' --user "${COUCHDB_USER}:${COUCHDB_PASS}"); do sleep 5; done

echo "<-- Configuring CouchDB by REST APIs Done!"
```
### TODO
- [x] Add parallelism to these stacks for better performance reliability during updates ✅ 2025-09-10
- [x] Add example `.env` file ✅ 2025-09-10
- [x] add `init.sh` script for basic [[Sparse Page]] configuration ✅ 2025-09-10
