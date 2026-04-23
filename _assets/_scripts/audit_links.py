import os
import re

VAULT_ROOT = os.path.expanduser("~/Obsidian/Journal")

def get_headers(file_path):
    headers = set()
    if not os.path.exists(file_path) or not os.path.isfile(file_path):
        return headers
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            for line in f:
                match = re.match(r'^(#+)\s+(.*)$', line)
                if match:
                    header_text = match.group(2).strip()
                    # Obsidian anchors are usually lowercase, but resolution can be tricky
                    headers.add(header_text.lower())
    except Exception:
        pass
    return headers

def audit():
    all_files = []
    for r, d, f in os.walk(VAULT_ROOT):
        for file in f:
            if file.endswith(".md"):
                all_files.append(os.path.join(r, file))

    file_map = {}
    name_map = {}
    for f in all_files:
        rel = os.path.relpath(f, VAULT_ROOT)
        file_map[rel] = f
        name = os.path.splitext(os.path.basename(f))[0]
        if name not in name_map:
            name_map[name] = []
        name_map[name].append(f)

    broken_links = [] # Missing headers
    missing_files = [] # Sparse pages
    path_errors = [] # Incorrect relative paths

    # WikiLink: [[Target]] or [[Target|Alias]]
    wikilink_re = re.compile(r'\[\[([^\]|]+)(?:\|[^\]]+)?\]\]')
    # Markdown Link: [Title](Path)
    mdlink_re = re.compile(r'\[([^\]]+)\]\(([^)]+)\)')

    for file_path in all_files:
        rel_source = os.path.relpath(file_path, VAULT_ROOT)
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                content = f.read()
        except Exception:
            continue

        # Check WikiLinks
        for match in wikilink_re.finditer(content):
            raw_target = match.group(1).strip()
            if not raw_target:
                continue
                
            target_file_part = raw_target
            anchor = None
            if '#' in raw_target:
                parts = raw_target.split('#', 1)
                target_file_part = parts[0].strip()
                anchor = parts[1].strip()

            found_path = None
            
            if not target_file_part: # Link to anchor in same file [[#Anchor]]
                found_path = file_path
            else:
                # 1. Check as relative path from vault root
                if target_file_part in file_map:
                    found_path = file_map[target_file_part]
                elif target_file_part + ".md" in file_map:
                    found_path = file_map[target_file_part + ".md"]
                # 2. Check as relative path from current file
                else:
                    current_dir = os.path.dirname(file_path)
                    rel_try = os.path.normpath(os.path.join(current_dir, target_file_part))
                    if os.path.exists(rel_try) and os.path.isfile(rel_try):
                        found_path = rel_try
                    elif os.path.exists(rel_try + ".md"):
                        found_path = rel_try + ".md"
                    # 3. Check by name
                    elif target_file_part in name_map:
                        found_path = name_map[target_file_part][0]
            
            if not found_path:
                missing_files.append({
                    "source": rel_source,
                    "target": raw_target,
                    "type": "WikiLink"
                })
            elif anchor:
                headers = get_headers(found_path)
                if anchor.lower() not in headers:
                    broken_links.append({
                        "source": rel_source,
                        "target": raw_target,
                        "type": "WikiLink"
                    })

        # Check Markdown links
        for match in mdlink_re.finditer(content):
            target = match.group(2).strip()
            if not target or target.startswith("http") or target.startswith("mailto") or target.startswith("tel:"):
                continue
            
            # Skip obsidian internal links that might look like markdown links but use [[...]]
            # (Wait, the regex already handles that)
            
            target_path = target
            anchor = None
            if '#' in target:
                target_path, anchor = target.split('#', 1)

            if not target_path and anchor:
                full_target = file_path
            elif target_path.startswith('/'):
                full_target = os.path.join(VAULT_ROOT, target_path.lstrip('/'))
            else:
                full_target = os.path.normpath(os.path.join(os.path.dirname(file_path), target_path))

            if not os.path.exists(full_target):
                # Maybe it's missing .md?
                if not full_target.endswith(".md") and os.path.exists(full_target + ".md"):
                    # This is likely a path error if they didn't include .md in a markdown link
                    # But Obsidian often resolves it. However, standard Markdown links usually need the extension.
                    path_errors.append({
                        "source": rel_source,
                        "target": target,
                        "reason": "Missing .md extension in Markdown link"
                    })
                else:
                    path_errors.append({
                        "source": rel_source,
                        "target": target,
                        "reason": "File does not exist"
                    })
            elif anchor:
                headers = get_headers(full_target)
                if anchor.lower() not in headers:
                    broken_links.append({
                        "source": rel_source,
                        "target": target,
                        "type": "Markdown"
                    })

    return missing_files, broken_links, path_errors

missing, broken, errors = audit()

print("## Missing Files (Sparse Pages)")
# Sort and unique
missing_unique = sorted(list(set([(m['source'], m['target']) for m in missing])))
for src, tgt in missing_unique:
    print(f"- **{src}**: `[[{tgt}]]`")

print("\n## Broken Links (Missing Anchors)")
broken_unique = sorted(list(set([(b['source'], b['target'], b['type']) for b in broken])))
for src, tgt, t in broken_unique:
    print(f"- **{src}**: `{tgt}` ({t})")

print("\n## Path Errors (Markdown links)")
errors_unique = sorted(list(set([(e['source'], e['target'], e['reason']) for e in errors])))
for src, tgt, reason in errors_unique:
    print(f"- **{src}**: `{tgt}` ({reason})")
