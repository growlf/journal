---
tags:
  - dns
  - wireguard
  - vpn
  - networking
Creation date: Monday April 4th 2022 11:18:30
modification date: 
Documentation:
---
I continually ran into the issue that I could not resolve system names over the Wireguard VPN. Turns out, this is easily resolved and even documented. From the man-page:

> DNS — a comma-separated list of IP (v4 or v6) addresses to be set as the interface’s DNS servers, or non-IP hostnames to be set as the interface’s DNS search domains. May be specified multiple times. Upon bringing the interface up, this runs ‘resolvconf -a tun._INTERFACE_ -m 0 -x‘ and upon bringing it down, this runs ‘resolvconf -d tun._INTERFACE_‘. If these particular invocations of **resolvconf**(8) are undesirable, the PostUp and PostDown keys below may be used instead.

So, for my local Bellingham Makerspace VPN config, I switched the DNS entry from:


```sh
DNS = 10.X.X.X
```

To:

```sh
DNS = 10.X.X.X,bellinghammakerspace.org
```

And the resolve issue was, pardon the pun, resolved!

NOTE: yes, it may look like it disappears after you import it, but it seems that it did update the config when I check with `resolvectl` afterwards. Server config done with [[Knowledge Base/Tools/Wireguard|WG-Dashboard]].
