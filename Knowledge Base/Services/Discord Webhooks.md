---
title: Discord Webhooks
tags:
  - discord
  - integration
  - devops
  - notifications
---
# Discord Webhooks: Automated Notifications

> [!NOTE] The Instructor's Perspective
> Webhooks are a simple, powerful way to get your tools talking to each other. Instead of constantly checking GitHub for build status, we let GitHub "shout" at us in Discord when something goes wrong. It's about maintaining **Situational Awareness** without the manual toil.

## Objective
To create a unique URL that allows external services (like GitHub Actions) to send automated messages directly into a Discord channel.

## Step-by-Step Configuration
1.  **Navigate to Server:** Open Discord and go to the server where you want the notifications.
2.  **Edit Channel:** Right-click the target channel (e.g., `#the-nest`) or click the **cog icon** to **Edit Channel**.
3.  **Integrations Tab:** Select **Integrations** from the left-hand menu.
4.  **Create Webhook:**
    *   Click **Webhooks** -> **New Webhook**.
    *   **Name:** Give the bot a descriptive name (e.g., `Journal Deployer`).
    *   **Channel:** Confirm the correct channel is selected in the dropdown.
    *   **Avatar (Optional):** Upload an icon to make the notifications stand out.
5.  **Copy Webhook URL:** Click the **Copy Webhook URL** button. **Keep this URL private!** Anyone with this link can post messages to your channel.
6.  **Save:** Click **Save Changes**.

## Usage in GitHub Actions
To use this webhook for deployment notifications:
1.  Go to your GitHub Repository -> **Settings** -> **Secrets and variables** -> **Actions**.
2.  Create a **New repository secret**.
3.  **Name:** `DISCORD_WEBHOOK`.
4.  **Secret:** Paste the URL you copied from Discord.

## Troubleshooting
- **No Messages:** Ensure the `DISCORD_WEBHOOK` secret name in GitHub matches exactly what is in your `.yml` workflow file.
- **Permissions:** The webhook inherits the permissions of the user who created it. Ensure you have the "Manage Webhooks" permission in the Discord server.

---
*Related: [[Knowledge Base/Github Workflow]], [[Knowledge Base/Discord Linkable ID]]*
