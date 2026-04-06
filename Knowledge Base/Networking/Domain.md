---
title: Domain
---

# Domains: The Address Book of the Internet

A domain (e.g., `netyeti.net`) is a human-readable "alias" for an IP address.

## Why a Domain in the Lab?
- **Ease of Use:** `router.home.arpa` is easier than `192.168.1.1`.
- **SSL/TLS:** You need a domain to get a valid certificate from Let's Encrypt (using the DNS-01 challenge).
- **Organization:** Subdomains can group your services (`nas.netyeti.net`, `plex.netyeti.net`).

## NetYeti's Strategy for Domains
1.  **Public Domain:** Register one (via Cloudflare, Namecheap, etc.) for external access (with a VPN!).
2.  **Internal Domain:** Use `.home.arpa` (RFC 8375) or a subdomain of your public domain (`internal.netyeti.net`).
3.  **Local Resolution:** Use Pi-hole or Technitium to resolve internal domains to local IPs.

## Common TLDs (Top-Level Domains)
- `.net` / `.com` / `.org`: Standard.
- `.home.arpa`: Recommended for internal non-routable domains.
- `.internal`: A newer emerging standard.

### Knowledge Check:
- Are you using "Split-Horizon DNS" to resolve your public domain to local IPs when you're at home?
- Is your "Dynamic DNS" (DDNS) client updating your IP automatically?
