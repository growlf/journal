---
title: "Policy: Local Sovereignty Law"
tags:
  - policy
  - sovereignty
  - automation
  - safeguard
---
# 📜 Local Sovereignty Law

> [!NOTE] The Instructor's Perspective
> In any complex system, there's a constant battle between "Automated Management" and "Manual Signal Discipline." This law ensures that our manual tactical overrides—the things we had to do by hand to fix a broken bridge—are never wiped out by a generic automation script or a system update. We are the masters of our own "manageable mess."

## 1. The Core Mandate
Manual "Safeguards" applied by the NetYeti or his Council must be persistent. Any automated tool or script that modifies system configuration must first check for the presence of these manual markers or use idempotent logic that preserves them. 

**Zero-Bake Exception:** While we avoid hardcoding secrets, we **do** hardcode "Sovereign Targets" (like interface names) to ensure consistent behavior across nodes.

## 2. Protected Assets (The Sovereign List)
The following assets are under **Sovereignty Protection**:

### 📡 Network Layer
- **WireGuard AllowedIPs:** Specific tunnel subnets (e.g., `10.0.0.0/24`) must be present in the `allowed-ips` list for the **Phoenix** tunnel. This allows tactical reach-back to the Internal management network.
- **Interface Naming:** The Phoenix VPN interface must ALWAYS be named `wg-phoenix`. This ensures monitoring and firewall rules remain consistent even if NetworkManager renames the device.
- **Dynamic Netplan Discovery:** The enforcement logic must dynamically find the correct Netplan file by searching for the "Phoenix" name, avoiding fragile reliance on hardcoded UUID-based filenames.

### 🌐 DNS Layer
- **DNS Overrides:** Manual `/etc/hosts` entries used to bypass circular dependencies (like the BMS Bitwarden link) must be preserved.

### 🔐 Access Layer
- **SSH Wildcards:** Wildcard configurations in `~/.ssh/config` (e.g., `Host bms *.bms`) must be persistent to provide tactical reach-back capability.
- **Local Key Parity:** Authorized keys synced across the council must not be pruned by automated "cleanup" scripts.

## 3. Enforcement Mechanism
We use the `enforce-sovereignty.sh` Power to audit and restore these safeguards. 
- **Idempotent Patching:** The script uses "search-and-ensure" logic rather than destructive overwrites.
- **Automatic Restoration:** If a breach is detected (e.g., interface renamed, entry missing), the script restores the safeguard and applies the changes (e.g., `netplan apply`).
- **Scheduling:** This power is hard-wired into the `crontab` to run hourly and @reboot, ensuring the forest "self-heals."

## 4. Teachable Moment: Idempotency & Signal Strength
"Idempotency" means that running a command multiple times has the same effect as running it once. Our sovereignty scripts should be idempotent—they should "check for the signal" before "applying the fix." This prevents "flapping" configurations and ensures that we only intervene when a safeguard has actually been breached.

## 5. External Tool & Script Interdiction (The Guardrail Law)
As we integrate more automated tools and AI-generated scripts into our Powers, we must maintain strict signal purity. 

- **No Destructive Overwrites:** No externally sourced or AI-generated script is permitted to remove, disable, or overwrite a manual safeguard or a Local Sovereignty setting.
- **Approval Mandate:** Any script that touches networking, DNS, or access layers must be audited by the NetYeti before it is integrated into a persistent cron job or automated workflow.
- **Safeguard Persistence:** If an external tool attempts to reset a configuration (e.g., clearing `iptables`, resetting `/etc/hosts`, or renaming interfaces), the `enforce-sovereignty.sh` Power MUST be capable of detecting and reversing that change immediately.
- **Loophole Awareness:** Watch for tools that use "transient" configurations (like `ip addr` vs `netplan`) which might bypass persistent file-based audits. Sovereignty applies to the *runtime state*, not just the configuration files.

---
*Related: [[Policies/SOP - Updating the Home Lab]], [[Knowledge Base/LLM/Hybrid Architecture - The PACE Plan|The PACE Plan]], [[_assets/_scripts/enforce-sovereignty.sh|Enforcement Script]]*
