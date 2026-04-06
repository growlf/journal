---
title: Apt Cacher NG
tags:
  - linux
  - networking
  - caching
  - lab-infrastructure
---
# Apt-Cacher NG: Bandwidth Discipline for the Home Lab

> [!NOTE] The Instructor's Perspective
> If you have more than two Linux systems on your network, you are wasting bandwidth. Every time you run `apt update && apt upgrade`, you're pulling the same bits from the internet. Apt-Cacher NG is a caching proxy that keeps those bits local. It's faster for you and more polite to the mirror owners.

## Why use it?
- **Speed:** Installing a new package on your 5th LXC container will be near-instant.
- **Efficiency:** Drastically reduces your external bandwidth usage.
- **Reliability:** If the external repo is temporarily down or slow, you might already have what you need.

## The PACE Plan for Updates
> [!TIP] Update Reliability
> **P (Primary):** Local Apt-Cacher NG instance.
> **A (Alternate):** Direct connection to official mirrors (bypass the proxy).
> **C (Contingency):** Secondary local cache or a sibling node with the packages already downloaded.
> **E (Emergency):** Sneakernet - Use a USB drive with `.deb` files or a full local repository mirror.

## Basic Setup (The NetYeti Way)
1. **Install:** `sudo apt install apt-cacher-ng`
2. **Configure Clients:** On your other Linux systems, create a file at `/etc/apt/apt.conf.d/00aptproxy`:
   ```text
   Acquire::http::Proxy "http://<your-cacher-ip>:3142";
   ```
3. **Monitor:** Access the web interface at `http://<your-cacher-ip>:3142/acng-report.html` to see your "Hit Rate."

## Check for Understanding
- If your Apt-Cacher NG server goes down, can your clients still update? (Hint: Check your **Alternate** plan).
- Why do we use a dedicated configuration file in `apt.conf.d` instead of modifying the main `apt.conf`?

---
*Related: [[Network/The Stack]], [[Linux]]*
