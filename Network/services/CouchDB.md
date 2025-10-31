---
tags:
  - data
  - obsidian
  - documentation
Creation date:
Documentation: https://docs.couchdb.org/en/stable/
aliases:
  - obsidian-sync
management_url: https://sync.yeticraft.net/_utils/
---
# Description
CouchDB is an open-source, NoSQL, document-oriented database that stores data in JSON format, making it ideal for modern web and mobile applications. It is designed for high availability and horizontal scalability, using a distributed architecture with built-in replication for seamless data synchronization and offline access. Key features include its use of JavaScript for queries and a RESTful API for data access via HTTP, making it highly compatible with various programming languages and platforms.  I use it primarily for running my own self-hosted Obsidian Sync service to allow easy backups, centralized synchronization across all of my devices, and most importantly - for collaboration with other individuals. It is also very easy to configure a replication process to multiple storage locations to make full (live or periodic) backups and fail-over solutions.

Key characteristics
- **Document-oriented:** Stores data in flexible, schema-free JSON documents instead of rows and columns.
- **Web-friendly:** Uses HTTP for its API, allowing access from web browsers and other applications through standard protocols.
- **Distributed and replicated:** Features a robust replication system that supports master-master setups, allowing data to be synchronized and accessed from multiple nodes, even when offline.
- **Fault-tolerant:** Built with a durable storage engine and provides automatic conflict detection and resolution during replication.
- **Scalable:** Can be scaled horizontally by adding more nodes to a cluster.
- **Flexible querying:** Allows querying, combining, and transforming data using JavaScript and MapReduce.
## Self Hosting Obsidian Sync
Setting up a basic CouchDB service is actually very simple and very easily customized to specific needs. Below is an example that I use as a guide to setting up my own Obsidian-Sync. It is curated from many web pages and documentations sources and (hopefully) simplified/streamlined for an average "new-user" experience through my own trials and tribulation along the way.
### Prerequisites
Of course, step one is to have [[Obsidian]] installed and understand the basics of how to enable the community plugins and configure them.  Don't worry, for this process we only need to add a single plugin and I will show the general screens that need to be configured.  I would strongly recommend having your own domain as well.  Without one, you may not be able to fully secure this service, which can be  important when making it available to the internet.
### Step 1- Choose a Network Environment
Like most services, you will need a static IP (one way or another) to connect to the sync service with obsidian - and to enable proper security protocols such as SSL. There are three common scenarios that I am focusing on here:
- User with access to a static IP address (commercial or otherwise) - aka [[#Static IP]]
- Residential internet user with no access to a static public IP address - aka [[#Dynamic IP]]
- User with access to a hosting provider - aka [[#Hosted]]
Most users will fall into the second or third categories, and that's where things get a bit murky with the decision tree branching quite a bit. So, I will start with the simpler and more easily understood implementation for a static IP.
#### Static IP
In this scenario, you will have an IP address that never changes. If you do not know if you have this, it generally means that you do not.  Many ISPs will offer this feature (at an additional cost) only by specific request.  This what I have and I also use my own domain name which was purchased looooong ago to simplify access by name and not just numbers.
#### Dynamic IP
Tools such as [[Tailscale]] can be used to simulate a static IP nicely. 
> [!WARNING] If you do not own your own Domain, this is the preferred option
>  If you do not have your own domain to allow SSL encryption and security, this is the recommended option! Warning, however, it is a bit more complex to set up fully and is not quite as easy to collaborate through for additional users. It is still very secureable.
- [ ] Complete this section or generate a page with further details. 🔽 
#### Hosted
An alternative is to use a hosting provider such as AWS, Google, or MS Azure where your instance can be assigned a static public-facing IP address.
> [!NOTE] Generally Not FREE
> I feel it is important to point out that hosting is generally not a free option. However it can be very inexpensive depending on the provider that you choose.
- [ ] Complete this section or generate a page with further details. 🔽 
### Step 2 - Choose a Deployment Strategy
There are several ways to deploy our solution:
- [[Docker]]
- [[LXC]]
- Virtual Machine
- Kubernetes
- Dedicated system (Raspberry Pi?)
I will be focusing on the Docker and LXC options because [[Proxmox]] and [[Portainer]] both just make this so darned easy. If you have neither [[Proxmox]] nor [[Portainer]] set up, I heartily recommend _both_.  They work very well together.  As I state elsewhere (and frequently) I recommend starting with [[Proxmox]] if you can.
### Step 3 - Configure and Deploy
We will want the following information ready:
1) **Hostname** and **Port** - the default port is 5984 and is fine as is. We wont be exposing it to the outside internet directly.
2) **Username** and **Password** to use as the initial admin user's credentials. Pick something not obvious and use a Password manager (such as [[Vaultwarden]]) to generate and store these. Remember, this service will be Internet facing, so be creative - not lazy.  If you are using the Proxmox Script for LXC, these values are prompted during the installation process.
3) Next -
	- If you are using Portainer:
		1) create [[CouchDB Deployment Files]] from example (add note for swarm deployment vs standalone)
		2) add environment values that set credentials etc
		3) deploy
	- Otherwise if you are using LXC on Proxmox:
		1) use this [script](https://community-scripts.github.io/ProxmoxVE/scripts?id=apache-couchdb) in the console of one of your Proxmox nodes.
		2) answer the prompts
- [ ] Fill in details on how to actually deploy for each method 
### Step 4 - Management Interface
1) connect to it with the admin credentials establish previously above.
- [ ] Screenshots and description of connecting to the interface 
### Step 5 - Configure Access
- Using NGiNX Proxy Manager with a Domain and SSL
	1) Firewall access
- Using Tailscale for direct access
- [ ] Add screenshots, links, and details for firewall and Tailscale 
### Step  6 - Connect and Sync
1) Install the [plugin](https://github.com/vrtmrz/obsidian-livesync), configure, connect
- [ ] Add screenshots, links, and details
## Cautions and Notes
- DO enable encryption end to end
- DO enable field encryption
- do NOT store the Setup URI as a note
- do NOT save credentials in a sync-settings file (but DO use one)