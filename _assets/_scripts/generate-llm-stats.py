import os
import json
import glob
from collections import defaultdict
from datetime import datetime

# Paths
OPENCLAW_DIR = os.path.expanduser("~/.openclaw")
SESSIONS_DIR = os.path.join(OPENCLAW_DIR, "agents/main/sessions")
SESSIONS_INDEX = os.path.join(SESSIONS_DIR, "sessions.json")
OUTPUT_FILE = "~/Obsidian/Journal/Internal/LLM Usage Statistics.md"

def parse_usage():
    stats = defaultdict(lambda: {"input": 0, "output": 0, "total": 0})
    
    # 1. Process all .jsonl files (Historical usage)
    for session_file in glob.glob(os.path.join(SESSIONS_DIR, "*.jsonl")):
        with open(session_file, 'r') as f:
            for line in f:
                try:
                    data = json.loads(line)
                    if data.get("type") == "message" and "usage" in data.get("message", {}):
                        msg = data["message"]
                        provider = msg.get("provider", "unknown")
                        model = msg.get("model", "unknown")
                        usage = msg.get("usage", {})
                        
                        key = (provider, model)
                        stats[key]["input"] += usage.get("input", 0)
                        stats[key]["output"] += usage.get("output", 0)
                        stats[key]["total"] += usage.get("totalTokens", 0)
                except:
                    continue
    
    # 2. Process sessions.json (Current/Live usage summary if available)
    if os.path.exists(SESSIONS_INDEX):
        try:
            with open(SESSIONS_INDEX, 'r') as f:
                index = json.load(f)
                for key, data in index.items():
                    # Check for usage fields in the session object
                    if "inputTokens" in data:
                        # sessions.json doesn't always break down by model in the root
                        # but it has current session totals. We'll add them to 'active'
                        # if we can't find a better model match.
                        provider = data.get("providerOverride") or "google-gemini-cli"
                        model = data.get("modelOverride") or "active-session"
                        
                        # Note: This might double count if the session is already in .jsonl
                        # OpenClaw usually flushes to .jsonl, so we'll treat this as 
                        # 'current session' buffer.
                        
                        # stats[(provider, model)]["input"] += data.get("inputTokens", 0)
                        # stats[(provider, model)]["output"] += data.get("outputTokens", 0)
                        # stats[(provider, model)]["total"] += data.get("inputTokens", 0) + data.get("outputTokens", 0)
                        pass # Skipping for now to avoid double-counting until logic is clearer
        except:
            pass
                    
    return stats

def generate_markdown(stats):
    now = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    
    # Mapping for friendly names
    provider_map = {
        "ollama": "Local Ollama (Phoenix)",
        "ollama-remote": "BMS Bridge (Ollama)",
        "google-gemini-cli": "Gemini (Cloud)",
        "anthropic": "Claude (Cloud)"
    }
    
    content = f"""---
tags:
  - statistics
  - llm
  - internal
updated: {now}
---
# 📊 LLM Usage Statistics

> [!info] Data Source
> Aggregated from OpenClaw session logs in `~/.openclaw/`. Updated automatically every hour via cron.

## 🚀 Token Usage by Provider & Model

| Provider | Model | Input | Output | Total Tokens |
| :--- | :--- | :--- | :--- | :--- |
"""
    
    # Sort by provider then model
    sorted_keys = sorted(stats.keys(), key=lambda x: (x[0], x[1]))
    
    grand_total = 0
    local_total = 0
    cloud_total = 0
    
    for provider, model in sorted_keys:
        usage = stats[(provider, model)]
        if usage['total'] == 0: continue
        
        p_name = provider_map.get(provider, provider)
        content += f"| {p_name} | `{model}` | {usage['input']:,} | {usage['output']:,} | **{usage['total']:,}** |\n"
        
        grand_total += usage['total']
        if "ollama" in provider:
            local_total += usage['total']
        else:
            cloud_total += usage['total']
            
    content += f"""
## 📈 Summary Metrics

- **Total Local/Edge Tokens (Ollama):** {local_total:,}
- **Total Cloud Tokens (Gemini/Claude):** {cloud_total:,}
- **Grand Total:** **{grand_total:,}**

---
*Note: Usage data depends on individual session logs. Cloud models using the CLI may report usage differently than local engines.*

*Last Updated: {now}*
"""
    return content

if __name__ == "__main__":
    usage_stats = parse_usage()
    md_content = generate_markdown(usage_stats)
    
    with open(OUTPUT_FILE, 'w') as f:
        f.write(md_content)
    print(f"Stats updated successfully at {OUTPUT_FILE}")
