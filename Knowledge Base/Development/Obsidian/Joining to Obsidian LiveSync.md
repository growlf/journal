---
tags:
  - guide
  - Obsidian
---
This guide walks you through connecting your local Obsidian vault to our shared Live Sync server. Before joining the Obsidian workspace, make sure to [install Obsidian](https://obsidian.md/download) on your client machine if you haven't already. An SME with administrative access to the CouchDB will also need to [[Create a CouchDB User Account]] prior to remote connection.

## Step 1: Create a Vault
1. Open **Obsidian**
2. Select **“Create new vault”**
3. Enter a vault name (e.g. piclub)
> [!Caution] The vault name is case-sensitive, so type it exactly as provided.
4. Choose a location to store it locally (e.g. /home/user/Documents).
5. Click **Create** to finish
## Step 2: Install Live Sync Plugin
1. Click the **⚙️ Settings** icon (bottom-left corner)
2. Under **Options > Community plugins**:
    - Enable **“Turn on community plugins”**
    - Click **Browse** → search for **“Self-hosted LiveSync”**
    - Click **Install** and then **Enable**
![[Pasted image 20251007231658.png]]
3. When prompted:
    - Select **“No, I do not have a device set up.”**
    ![[Pasted image 20251007231726.png]]
    - Then choose **“Set it up all manually.”**
    ![[Pasted image 20251007231805.png]]
4. After installation, exit the marketplace
5. You’ll now see **“Self-hosted LiveSync”** listed under **Community Plugins** in Settings
6. Click on **Self-hosted LiveSync**
7. In the top row of icons, select the **🛰️ “Remote Configuration”** tab

## Step 3: Connect to the Database
1. Under **Remote Configuration**, fill in the following fields:
```
Server URI: https://sync.yeticraft.net
Username: [CouchDB Username]
Password: [CouchDB Password]
Database Name: [CouchDB Database Name]
```
2. Enable:
	- ✅ **“Use Request API to avoid ‘inevitable’ CORS problem.”**
3. Click Test and confirm that the connection is successful
![[Pasted image 20251007231833.png]]
4. Click Apply Settings
5. Next, select Fetch Settings to pull initial configuration data from the server
![[Pasted image 20251007231857.png]]
6. You’ll be prompted several times — respond as follows:
	- **Use Remote Configuration:** Use configured settings
	- **Confirmation Popups:** Yes
	- **Fetch option**: Fetch everything from remote > Yes, fetch and apply remote settings
	- **Enable extra features:** Yes
	- **Enable customization sync:** Yes, Enable it
	- **Enter a device name:** (e.g. `laptop-main` or `desktop-home`)
	- **Hidden file sync:** Select **Fetch**
	- **Database size notification:** Select **2GB (Standard)**
## Step 4: Finishing Touches
1. Go back to Self-hosted LiveSync Settings
2. Click the 🔄 “Sync Settings” tab (circling arrows icon)
3. Under Synchronization Method, set Sync Mode to **LiveSync**
![[Pasted image 20251007231933.png]]
4. Exit out of Settings
5. In the vault, locate the **[[index]]** note
	- Scroll to the section labeled **“Settings Sync.”**
	- Click the link to the **[[sync_settings]]** file (it will redirect you there)
6. Once in the `sync_settings` file:
	- Press Ctrl + P → Search for "parse"
	- Select "Self-hosted LiveSync: Parse setting file"
	![[Pasted image 20251007231952.png]]
	- A popup will appear in the top-right corner — click the “HERE” link
	**![](data:image/png;base64,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)**
	- Select “Apply settings and restart Obsidian.”
7. After restart, your vault should automatically sync:
> [!Note] You'll notice new banners, icons, and plugins have appeared!
- To verify the sync:
	- Go to **Settings → Community Plugins → Self-hosted LiveSync.*
	- Click the **🔄 “Sync Settings”** icon again.
	- Scroll down to **“Sync Settings via Markdown.”**
	- Confirm that the **Filename** field shows:  \_assets/sync_settings.md
![[Pasted image 20251007231103.png]]
