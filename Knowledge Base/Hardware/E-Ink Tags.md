---
title: E-Ink Tags
---

# E-Ink Tags: The Status Boards of the Home Lab

E-Ink Tags (often Electronic Shelf Labels or ESLs) are low-power displays that retain their image without power.

## Why E-Ink?
- **Visibility:** No glare, extremely crisp text.
- **Power:** Battery life is measured in *years*.
- **Aesthetic:** They look like paper!

## Lab Implementation
- **AP:** A modified access point (like the Solum or Hanshow AP) to push images.
- **Server:** A dedicated bridge (like "OpenEPAPERLink") to manage the images.
- **Automation:** Using Python or Home Assistant to update tags with:
    - Server status.
    - Weather info.
    - Calendar events.
    - Energy usage.

## Integration Stack
- **Dashboard:** Grafana -> PNG -> Image Converter.
- **Push:** OpenEPAPERLink API.
- **Display:** 2.9" or 4.2" ESL Tags.

### Knowledge Check:
- Are your tag batteries replaceable?
- Is your tag coordinator within range of all your tags?
