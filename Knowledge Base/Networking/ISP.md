---
title: ISP - Internet Service Provider
---

# ISP: The Gatekeeper of Your Network

Your Internet Service Provider is the "P (Primary)" layer of your connection to the world.

## Why the ISP Matters
- **Latency:** Fiber (best) vs Cable (variable) vs DSL (legacy) vs Satellite (worst).
- **Public IP:** Do you have a static IP? Are you behind CGNAT (Carrier-Grade NAT)?
- **Hardware:** Bridge Mode is your friend! Don't use your ISP's "all-in-one" router.

## NetYeti's Strategy for Connectivity
1.  **Bridge Mode:** Disable the routing/Wi-Fi on the ISP modem so *your* router (OPNsense/pfsense) does the heavy lifting.
2.  **DNS:** Don't use the ISP's DNS. Use Quad9, Cloudflare, or your own local recursive resolver (Unbound).
3.  **Bypass:** Use Tailscale or Wireguard to "punch through" if you're stuck behind CGNAT.

## Common Pitfalls
- **CGNAT:** Prevents port forwarding. (Solve with a VPS/Tunnel).
- **DNS Hijacking:** Some ISPs redirect 404s to their own ad-heavy pages. (Solve with DoH/DoT).

### Knowledge Check:
- Is your ISP modem in "Bridge Mode"?
- Do you have a secondary (Alternate) internet connection for when the grid goes down?
