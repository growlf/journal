import os
import re
import sys
from datetime import datetime

VAULT_ROOT = "/home/netyeti/Obsidian/Journal"
INTERNAL_DAILY = os.path.join(VAULT_ROOT, "Internal/daily")

# Tasks Plugin Emoji Map
PRIORITY_MAP = {"🔺": "1-High", "🔼": "2-Medium", "🔽": "3-Low"}

def get_today_path():
    now = datetime.now()
    return os.path.join(INTERNAL_DAILY, now.strftime("%Y"), now.strftime("%m"), now.strftime("%Y-%m-%d.md"))

def sync_and_audit():
    """
    1. Finds all tasks.
    2. Identifies tasks that are completed in one place but open in another (Duplicates).
    3. Auto-completes the duplicates.
    4. Returns the prioritized list of remaining tasks.
    """
    all_tasks = []
    # Match both [ ] and [x]
    task_pattern = re.compile(r'^(\s*-\s\[([ xX])\]\s+)(.*)', re.MULTILINE)
    
    completion_registry = {} # text -> is_completed
    file_map = {} # path -> content

    # --- PHASE 1: RECON ---
    for root, dirs, files in os.walk(VAULT_ROOT):
        if any(ignored in root for ignored in [".git", ".obsidian", ".trash"]): continue
        for file in files:
            if file.endswith(".md"):
                path = os.path.join(root, file)
                try:
                    with open(path, 'r', encoding='utf-8', errors='ignore') as f:
                        content = f.read()
                        file_map[path] = content
                        for m in task_pattern.finditer(content):
                            full_match, status_char, task_text = m.groups()
                            clean_text = task_text.strip()
                            is_done = status_char.lower() == 'x'
                            
                            if clean_text not in completion_registry:
                                completion_registry[clean_text] = is_done
                            elif is_done: # If we find even one completed version, mark the registry as done
                                completion_registry[clean_text] = True
                except: continue

    # --- PHASE 2: AUTO-COMPLETE DUPLICATES ---
    changes_made = 0
    for path, content in file_map.items():
        new_content = content
        def replacer(match):
            nonlocal changes_made
            prefix, status, text = match.groups()
            clean_text = text.strip()
            if completion_registry.get(clean_text) and status == ' ':
                changes_made += 1
                return prefix.replace('[ ]', '[x]') + text
            return match.group(0)
        
        updated_content = task_pattern.sub(replacer, content)
        if updated_content != content:
            with open(path, 'w', encoding='utf-8') as f:
                f.write(updated_content)

    if changes_made > 0:
        print(f"[Warden] Signal synchronized. {changes_made} duplicate tasks auto-completed.")

    # --- PHASE 3: BRIEFING GENERATION ---
    final_tasks = []
    for clean_text, is_done in completion_registry.items():
        if not is_done:
            # Re-parse metadata for briefing
            priority = "4-None"
            for emoji, label in PRIORITY_MAP.items():
                if emoji in clean_text: priority = label; break
            
            due_match = re.search(r'📅\s*(\d{4}-\d{2}-\d{2})', clean_text)
            is_ai = any(kw in clean_text.lower() for kw in ["scan", "update", "document", "fix", "audit", "recon", "sync", "skill", "tool"])
            
            final_tasks.append({
                "text": clean_text,
                "priority": priority,
                "due": due_match.group(1) if due_match else None,
                "ai_ready": is_ai
            })
            
    return final_tasks

def generate_briefing(tasks):
    tasks.sort(key=lambda x: (x['priority'], x['due'] or '9999-99-99'))
    ai_tasks = [t for t in tasks if t['ai_ready']]
    manual_tasks = [t for t in tasks if not t['ai_ready']]
    
    briefing = f"""
## 🫡 Warden's Tactical Briefing ({datetime.now().strftime("%Y-%m-%d")})

> [!IMPORTANT] Forest Health (Backlog)
> We have **{len(tasks)}** active objectives in the grove. Signal synchronized across all logs.

### 🤖 Minion Powers (Ready for Delegation)
*The council is ready to execute these tasks:*
"""
    for t in ai_tasks[:5]:
        p = t['priority'].split('-')[0].replace('1','🔺').replace('2','🔼').replace('3','🔽').replace('4','')
        briefing += f"- [ ] {p} {t['text']}\n"
    
    briefing += """
### 🛠️ Guardian Directives
*Objectives requiring the NetYeti's presence:*
"""
    for t in manual_tasks[:5]:
        p = t['priority'].split('-')[0].replace('1','🔺').replace('2','🔼').replace('3','🔽').replace('4','')
        briefing += f"- [ ] {p} {t['text']}\n"
        
    briefing += f"\n--- \n*Law of the Forest: Task the Warden by saying: 'Warden, execute the AI handoff.'*"
    return briefing

def ensure_daily():
    path = get_today_path()
    if not os.path.exists(path):
        os.makedirs(os.path.dirname(path), exist_ok=True)
        with open(path, 'w') as f:
            f.write(f"---\ntags:\n  - daily\n---\n# {datetime.now().strftime('%A, %B %d, %Y')}\n\n")
    return path

if __name__ == "__main__":
    # Ensure root index is protected
    os.system("python3 _scripts/protect-index.py")
    ensure_daily()
    remaining = sync_and_audit()
    print(generate_briefing(remaining))
