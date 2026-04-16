import os
import re
from datetime import datetime, timedelta

VAULT_ROOT = "/home/netyeti/Obsidian/Journal"

def get_relative_path(path):
    return os.path.relpath(path, VAULT_ROOT)

def get_wiki_link(file_path):
    rel_path = get_relative_path(file_path)
    if rel_path.endswith(".md"):
        rel_path = rel_path[:-3]
    name = os.path.basename(rel_path)
    return f"[[{rel_path}|{name}]]"

def format_datetime(timestamp):
    dt = datetime.fromtimestamp(timestamp)
    # Dataview format: 7:15 PM - April 15, 2026
    return dt.strftime("%-I:%M %p - %B %d, %Y")

def refresh_folder_index(file_dir, query_lines):
    data = {}
    for root, dirs, files in os.walk(file_dir):
        if root == file_dir:
            continue
        
        rel_root = os.path.relpath(root, file_dir)
        folder_name = rel_root.split(os.sep)[0]
        
        if folder_name not in data:
            data[folder_name] = []
            
        for f in files:
            if f.endswith(".md") and f != "index.md":
                full_path = os.path.join(root, f)
                data[folder_name].append(get_wiki_link(full_path))
                
    # Sort and format
    sorted_folders = sorted(data.keys())
    lines = ["| Folder | Documents |", "| --- | --- |"]
    for folder in sorted_folders:
        docs = " | ".join(sorted(data[folder]))
        lines.append(f"| {folder} | {docs} |")
    
    return "\n".join(lines)

def refresh_recent_changes(file_dir, query_lines, limit=20, days=7):
    cutoff = datetime.now() - timedelta(days=days)
    results = []
    
    for root, dirs, files in os.walk(file_dir):
        for f in files:
            if f.endswith(".md"):
                full_path = os.path.join(root, f)
                stat = os.stat(full_path)
                ctime = stat.st_ctime
                mtime = stat.st_mtime
                
                if datetime.fromtimestamp(ctime) >= cutoff or datetime.fromtimestamp(mtime) >= cutoff:
                    results.append({
                        "link": get_wiki_link(full_path),
                        "created": format_datetime(ctime),
                        "updated": format_datetime(mtime),
                        "mtime": mtime
                    })
                    
    results.sort(key=lambda x: x["mtime"], reverse=True)
    results = results[:limit]
    
    lines = ["| File | Created | Updated |", "| --- | --- |"]
    for r in results:
        lines.append(f"| {r['link']} | {r['created']} | {r['updated']} |")
        
    return "\n".join(lines)

def refresh_global_activity(query_lines):
    # Detect limit
    limit_match = re.search(r'LIMIT (\d+)', query_lines)
    limit = int(limit_match.group(1)) if limit_match else 40
    
    exclude_folders = ["Internal/daily", "_templates", "_assets", "Internal", "Discord", ".git", ".obsidian"]
    
    results = []
    for root, dirs, files in os.walk(VAULT_ROOT):
        rel_root = os.path.relpath(root, VAULT_ROOT)
        if any(rel_root == ex or rel_root.startswith(ex + "/") for ex in exclude_folders):
            continue
            
        for f in files:
            if f.endswith(".md"):
                full_path = os.path.join(root, f)
                stat = os.stat(full_path)
                results.append({
                    "link": get_wiki_link(full_path),
                    "updated": format_datetime(stat.st_mtime),
                    "mtime": stat.st_mtime
                })
                
    results.sort(key=lambda x: x["mtime"], reverse=True)
    results = results[:limit]
    
    lines = ["| File | Updated |", "| --- | --- |"]
    for r in results:
        lines.append(f"| {r['link']} | {r['updated']} |")
        
    return "\n".join(lines)

def refresh_list_daily(query_lines):
    # LIST FROM "Internal/daily" ... GROUP BY regexreplace(file.folder, ".*daily/", "")
    data = {}
    daily_root = os.path.join(VAULT_ROOT, "Internal/daily")
    
    for root, dirs, files in os.walk(daily_root):
        rel_root = os.path.relpath(root, daily_root)
        if rel_root == ".":
            group_name = "Daily"
        else:
            group_name = rel_root
            
        if group_name not in data:
            data[group_name] = []
            
        for f in files:
            if f.endswith(".md") and f != "index.md" and f != "settings.md":
                full_path = os.path.join(root, f)
                data[group_name].append(get_wiki_link(full_path))
                
    sorted_groups = sorted(data.keys(), reverse=True)
    if "Daily" in sorted_groups:
        sorted_groups.remove("Daily")
        sorted_groups.append("Daily")
        
    lines = []
    for group in sorted_groups:
        if not data[group]: continue
        lines.append(f"- **{group}**")
        for doc in sorted(data[group]):
            lines.append(f"    - {doc}")
            
    return "\n".join(lines)

def process_file(file_path):
    print(f"[*] Processing {file_path}...")
    with open(file_path, 'r') as f:
        content = f.read()
    
    # 1. Fix broken Tricks 1 links
    new_content = content.replace("[[Knowledge Base/Tricks 1/", "[[Knowledge Base/Tricks/")
    
    # 2. Refresh Dataview blocks
    pattern = re.compile(r'%% DATAVIEW_PUBLISHER: start\n(.*?)\n%%(.*?)%% DATAVIEW_PUBLISHER: end %%', re.DOTALL)
    
    def replacement(match):
        query = match.group(1).strip()
        file_dir = os.path.dirname(file_path)
        
        if "GROUP BY lastPart as Folder" in query:
            result_table = refresh_folder_index(file_dir, query)
        elif "file.ctime AS \"Created\"" in query:
            result_table = refresh_recent_changes(file_dir, query)
        elif "SORT file.mtime DESC" in query:
            result_table = refresh_global_activity(query)
        elif "FROM \"Internal/daily\"" in query:
            result_table = refresh_list_daily(query)
        else:
            print(f"[!] Unrecognized query in {file_path}:\n{query}")
            return match.group(0)
            
        return f"%% DATAVIEW_PUBLISHER: start\n{query}\n%%\n\n{result_table}\n\n%% DATAVIEW_PUBLISHER: end %%"

    new_content = pattern.sub(replacement, new_content)
    
    if new_content != content:
        with open(file_path, 'w') as f:
            f.write(new_content)
        print(f"[+] Updated {file_path}")
    else:
        print(f"[-] No changes for {file_path}")

if __name__ == "__main__":
    for root, dirs, files in os.walk(VAULT_ROOT):
        if ".git" in root or ".obsidian" in root:
            continue
        for f in files:
            if f.endswith(".md"):
                full_path = os.path.join(root, f)
                process_file(full_path)
