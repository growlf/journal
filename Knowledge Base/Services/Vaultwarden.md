---
title: Vaultwarden
tags:
  - security
  - networking
  - docker
  - lab-infrastructure
---
# Vaultwarden: The Armory of Secrets

> [!NOTE] The Instructor's Perspective
> In the Army, "security of information" was paramount. In your lab, your passwords are your most vulnerable asset. Using a password manager isn't just a suggestion; it's a requirement for a professional environment. Vaultwarden gives you all the power of Bitwarden, but on your own hardware, under your own control.

## Why use it?
- **Self-Hosted Security:** You own the data and the encryption keys.
- **Cross-Platform:** Access your secrets from your phone, browser, and desktop.
- **Organization:** Share passwords securely with family, students, or peers.
- **Zero-Knowledge:** Your data is encrypted before it ever leaves your device.

## Secrets Reliability (The PACE Plan)
> [!TIP] Information Discipline
> **P (Primary):** Local Vaultwarden instance (Docker/LXC on [[Network/Services/Proxmox/index|Proxmox]]).
> **A (Alternate):** Encrypted local backup of the Vaultwarden database (`db.sqlite3`).
> **C (Contingency):** Bitwarden (Cloud-hosted) with a subset of critical recovery keys.
> **E (Emergency):** Printed "Emergency Kit" with master password and 2FA recovery codes in a fire-safe.

## SOP: Managing Secrets
1. **Generate Passwords:** Always use the built-in generator. 20+ characters, mixed symbols.
2. **Use 2FA:** Enable Multi-Factor Authentication for both Vaultwarden and all the accounts it manages.
3. **Regular Backups:** Ensure your database and attachments are part of your daily backup routine.
4. **Audit Your Vault:** Periodically check for weak or reused passwords using the "Reports" feature.

## Check for Understanding
- If your Vaultwarden server goes down, what is the fastest way to regain access to your passwords?
- Why do we use **Vaultwarden** instead of just a spreadsheet or a notebook?

---
*Related: [[Network/The Stack]], [[Knowledge Base/MFA]], [[Knowledge Base/Security]]*
