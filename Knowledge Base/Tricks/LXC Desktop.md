---
tags:
  - containerization
Creation date: 2025-08-25 17:02
Documentation:
aliases:
---
---
# Creating LXC as Desktop

> In the Army, we call this "repurposing equipment." Why build a whole VM for a single app when you can just pass through your graphics?

It *can* be done. You can run a full desktop environment or just individual GUI applications inside an LXC container. This is particularly useful when you want to isolate a specific app but still have it feel like it's part of your host system.

## Key Concepts
- **X11 Forwarding**: The classic way. Pass your `/tmp/.X11-unix` socket into the container.
- **Wayland**: The modern way. Pass your `$WAYLAND_DISPLAY` socket.
- **DRI Passthrough**: You'll need to pass through `/dev/dri` to get hardware acceleration (GPU).
- **x11docker**: A fantastic tool that simplifies this process significantly. Check it out on GitHub!

## Common Pitfalls
- **Permissions**: Ensure your container user has the correct GID to access your graphics devices.
- **Audio**: Passing through PulseAudio or PipeWire can be its own challenge.
