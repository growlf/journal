Here are the primary places to find publicly available libraries:
## 1. The Official Gemini CLI Extension Gallery
The most direct source for curated "skills" is the official **Gemini CLI Extension Gallery**. These extensions often bundle custom slash commands, MCP (Model Context Protocol) server configurations, and specific `GEMINI.md` context files.
- **Access:** You can browse these at `https://geminicli.com/extensions/browse/`.
- **Installation:** In your terminal, you can list or add them directly:
    - `gemini extensions list` (To see what you have)
    - `gemini extensions install <github-url>` (To add community-contributed ones)
## 2. GitHub "Gemini-Skills" Topic
The community has standardized on the `gemini-skills` topic on GitHub. You can find over a thousand agentic skills here, ranging from DevOps automation to specialized research tools.
- **Key Repositories:**
    - **`google-gemini/gemini-cli`:** The official repository's "examples" folder contains templates for custom commands.
    - **`heilcheng/awesome-agent-skills`:** A massive, curated collection of `SKILL.md` files compatible with Gemini CLI, Claude Code, and other agentic terminals.
    - **`motherduckdb/agent-skills`:** Focuses specifically on software engineering workflows.
## 3. MCP (Model Context Protocol) Servers
Because the Gemini CLI supports **MCP**, you can use any MCP server as a "skill library." This allows the CLI to interact with external tools like Google Maps, Slack, GitHub, or local databases.
- **Usage:** You can find these on the [Smithery.ai](https://smithery.ai) registry or the [MCP GitHub organization](https://github.com/modelcontextprotocol).
- **Configuration:** These are typically added to your `~/.gemini/settings.json` or bundled within a `.gemini/extensions/` directory.
## 4. Local "Skills" Management
If you are looking for a way to manage your own or community scripts, the `agent-skills-cli` tool is a popular way to pull down specific capabilities.
- **Command:** `npx skills add <author>/<repo> -a gemini-cli`
- This command places the necessary Markdown and configuration files into your `~/.agents/skills` directory, which the Gemini CLI reads automatically.
---
## Pro-Tip: The `GEMINI.md` File
If you find a script or "skill" you like but it isn't packaged as an extension, you can simply drop the instructions into a `GEMINI.md` file in your project root. The Gemini CLI will automatically ingest this as its "system instructions" for that specific directory, effectively giving it those "skills" without a formal installation.