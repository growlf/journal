---
title: Syncthing - Peer-to-Peer File Sync
tags:
  - storage
  - backup
  - self-hosted
  - networking
management_url: "http://<syncthing-ip>:8384"
---
# Syncthing: Peer-to-Peer File Sync

> [!NOTE] The Instructor's Perspective
> In the Army, we had "distributed networks." Syncthing is a peer-to-peer file synchronization service that works without any central server. It's decentralized, secure, and incredibly reliable. It's my favorite way to keep my files in sync across all my devices without relying on a "cloud" provider.

## Why Syncthing?
- **Decentralized:** No central server to fail; every node is a peer.
- **Secure:** Data is encrypted end-to-end and authenticated with public keys.
- **Privacy-Focused:** Your data never leaves your network unless you choose to share it externally.
- **Cross-Platform:** Runs on Linux, Windows, macOS, Android, and even your [[Knowledge Base/Storage/NAS|NAS]].
- **Open Source:** Completely free and community-driven.

## File Synchronization Reliability (The PACE Plan)
> [!TIP] Information Discipline
> **P (Primary):** Syncthing on all major devices (Desktop, Phone, [[Knowledge Base/Storage/NAS|NAS]]).
> **A (Alternate):** Manual file transfers via [[Knowledge Base/ssh|SFTP]] or a local network share (SMB/NFS).
> **C (Contingency):** Cloud-based file storage (e.g., Nextcloud, Dropbox) for critical recovery only.
> **E (Emergency):** Direct copy to an encrypted physical USB drive.

## Standard Operating Procedure (SOP): Syncing Your Data
1. **Install:** Deploy Syncthing on your first device (e.g., your laptop).
2. **Add a Device:** Install Syncthing on a second device (e.g., your [[Knowledge Base/Storage/NAS|NAS]]) and exchange Device IDs to link them.
3. **Share a Folder:** Create a folder and share it with the linked device.
4. **Set Up Versioning:** Enable "File Versioning" (e.g., Staggered File Versioning) to protect against accidental deletions.
5. **Verify:** Add a file to the folder on one device and ensure it appears on the other.

## Check for Understanding
- Why is it helpful to have "File Versioning" enabled? (Hint: Think about "human error").
- How does a decentralized system like Syncthing increase your lab's reliability?

---
*Related: [[Learning/Home-Lab-Series/Default-Stack-Blueprint|The Stack]], [[Knowledge Base/Storage/NAS]], [[Knowledge Base/Storage/index]]*
