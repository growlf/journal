- [ ] All critical infrastructure needs to be optimized into LXCs where appropriate
	- [ ] rebuild docker node template as LXC ⏫ 
		- [ ] create debian LXC
		- [ ] ensure auto-apt-cacher is installed and enabled
		- [ ] install docker
		- [ ] install nfs and mount NFS pools
		- [ ] create image for duplication
	- [ ] remake docker nodes in current swarm using new LXC template
		- [ ] remake all stacks with version control and CICD
	- [ ] make another docker LXC swarm for development  (drive with local git)
- [ ] Cleanup homepage - or replace with Grafana and Obsidian
	1) wiki
	2) dashboard
	3) link hub