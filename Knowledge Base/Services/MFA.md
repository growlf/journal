---
title: "MFA: Multi-Factor Authentication"
tags:
  - security
  - networking
  - authentication
---
# MFA: The Multi-Layered Sentry

> [!NOTE] The Instructor's Perspective
> In the Army, we had "gatekeepers." A single sentry (a password) is good, but a sentry backed by a "challenge and pass" (MFA) is much better. MFA is your defense-in-depth for every account you own. If a service doesn't support MFA, it shouldn't be in your lab. It's a non-negotiable part of your "signal discipline."

## How it works
MFA combines at least two different types of evidence to verify a user's identity:
1.  **Something you know:** A password or PIN. (The "Sentry")
2.  **Something you have:** A physical object like a mobile phone (to receive a code via text or an authenticator app) or a hardware security key. (The "Challenge")
3.  **Something you are:** A biometric identifier, such as a fingerprint or face scan. (The "Pass")

## Authentication Reliability (The PACE Plan)
> [!TIP] Information Discipline
> **P (Primary):** Authenticator App (e.g., [[Bitwarden]]/[[Knowledge Base/Services/Vaultwarden|Vaultwarden]] or Tofu/Ente Auth).
> **A (Alternate):** Hardware Security Key (e.g., YubiKey or NitroKey).
> **C (Contingency):** Email or SMS-based codes (Use only if P and A are unavailable).
> **E (Emergency):** Printed "Recovery Codes" stored in a physical fire-safe (The ultimate fallback).

## Standard Operating Procedure (SOP): Securing Your Accounts
1. **Enable MFA Everywhere:** If a service supports it, turn it on immediately.
2. **Use TOTP over SMS:** SMS is vulnerable to "SIM swapping." Use an app or a physical key whenever possible.
3. **Backup Your Keys:** If you're using an app, ensure it has an encrypted backup (like [[Knowledge Base/Services/Vaultwarden|Vaultwarden]]).
4. **Test Your Recovery:** Periodically verify that your "Emergency" recovery codes still work.

## Check for Understanding
- Why is an authenticator app (Primary) better than an SMS code (Contingency)? (Hint: Think about "SIM swapping").
- If you lose your phone, how do you regain access to your accounts? (Hint: Check your **Emergency** plan).

---
*Related: [[Knowledge Base/Services/Vaultwarden]], [[Knowledge Base/Networking/Security]], [[Network/The Stack]]*