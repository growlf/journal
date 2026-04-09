---
title: Open WebUI - Multi-Model Frontend
tags:
  - llm
  - docker
  - open-webui
  - frontend
---

# Open WebUI (formerly Ollama WebUI)

Garth, this is the "NetYeti" **Command and Control (C2)** layer for your Local LLM setup. It provides a ChatGPT-like interface that points directly at your containerized **Ollama** instance.

## The Strategy
Open WebUI is deployed as a standalone container, connected to the host's Ollama instance via the `host.docker.internal` gateway. We've also integrated **Open Terminal**, giving your AI a "sandbox" to execute code and manage files.

### The `docker-compose.yml`
```yaml
services:
  open-webui:
    image: ghcr.io/open-webui/open-webui:main
    container_name: open-webui
    restart: always
    ports:
      - "3000:8080"
    environment:
      - OLLAMA_BASE_URL=http://host.docker.internal:11434
      - OPEN_TERMINAL_URL=http://open-terminal:8000
      - OPEN_TERMINAL_API_KEY=b9f916233a86e2d3767985d36e000e4a
    volumes:
      - open-webui:/app/backend/data
    extra_hosts:
      - "host.docker.internal:host-gateway"
    networks:
      - open-webui-net

  open-terminal:
    image: ghcr.io/open-webui/open-terminal:latest
    container_name: open-terminal
    restart: unless-stopped
    ports:
      - "8000:8000"
    environment:
      - OPEN_TERMINAL_API_KEY=b9f916233a86e2d3767985d36e000e4a
    volumes:
      - open-terminal-data:/home/user
    networks:
      - open-webui-net

volumes:
  open-webui:
    external: true
  open-terminal-data:

networks:
  open-webui-net:
```

## How to Deploy
1.  **Navigate** to `Network/Services/Open-WebUI/`.
2.  **Pull and Start:**
    ```bash
    docker compose up -d
    ```
3.  **Verify the Handshake:**
    Access the UI at `http://localhost:3000`. In **Admin Settings > Integrations**, verify that the **Open Terminal** connection is active and pointed at `http://open-terminal:8000`.

## Open Terminal: The "Hands" of the AI
By adding Open Terminal, your LLMs can now:
- **Execute Code:** Run Python, Node.js, or Shell scripts directly from the chat.
- **Manage Files:** View and edit files in the sidebar navigator.
- **Persistent Sandbox:** The `/home/user` directory in the terminal is backed by a Docker volume, meaning the AI's "workspace" survives container restarts.

## Security Hardening
- **Signup Disabled:** Once the initial admin (e.g., `growlfd@gmail.com`) is logged in, `ENABLE_SIGNUP` has been set to `False` in the `docker-compose.yml`. This prevents unauthorized users from creating accounts on your private instance.

> [!TIP] The PACE Connection
    This is your **Alternate (A)** layer for interaction. While **[[OpenClaw]]** handles complex orchestration, Open WebUI is your go-to for direct chat, document RAG, and multi-model comparison.

## Knowledge Check
- **Why `host.docker.internal`?** Because the `open-webui` container needs to "reach out" to the host machine (where Ollama is listening on 11434). The `extra_hosts` flag maps this hostname to the host's internal gateway IP.
- **Why an external volume?** To ensure your chat history, uploaded documents, and RAG data persist even if you delete the container or update the image.

---
*Related: [[Network/Services/Ollama/index]], [[Knowledge Base/LLM/index]]*
