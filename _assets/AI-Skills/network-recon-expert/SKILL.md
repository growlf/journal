# Skill: Network Recon Expert

## Description
Use this skill to perform network reconnaissance and synchronize the results with the NetYeti vault. It automates host discovery via `nmap` and ensures all alive hosts are documented in the correct `Internal/Networks/` subdirectory.

## Capabilities
- **Scan & Sync:** Runs a host discovery scan and creates/updates `.md` device logs.
- **Port Discovery:** Automatically populates the `ports` frontmatter property with open services found during the scan.
- **Frontmatter Hardening:** Uses a YAML parser to ensure all device properties (IP, MAC, Vendor, Ports) are synchronized while preserving custom user data.
- **Sanitization:** Prepares public "Concept Twins" for the `Network/Devices` folder.

## Usage Protocol
1.  **Identify Subnet:** Determine the target range (e.g., 10.10.0.0/24).
2.  **Select Context:** Choose the network folder (e.g., BMS, Yeticraft).
3.  **Execute Engine:** Run the sync script:
    `python3 _scripts/recon-vault-sync.py [NetworkName] [Subnet]`
4.  **Verification:** Check the `Internal/` network device folder to ensure frontmatter is correctly populated.

## Tactical Mandates
- **OPSEC:** Always ensure new devices are created in the `Internal/` folder.
- **Instructional:** Tag new devices with `type: unknown` until the user provides functional context.
