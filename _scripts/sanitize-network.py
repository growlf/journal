import os
import re
import yaml

INTERNAL_DIR = "Internal/Devices"
PUBLIC_DIR = "Network/Devices"

# Mapping for sensitive fields to sanitize
SENSITIVE_FIELDS = ["MAC", "Serial", "credentials", "password", "key"]

def sanitize_ip(ip):
    if not ip or not isinstance(ip, str):
        return ip
    # Simple replacement of 192.168.x.y with 10.0.x.y for sanitization
    return re.sub(r"192\.168\.(\d+)\.(\d+)", r"10.0.\1.\2", ip)

def sanitize_content(content):
    # Replace internal links with public ones if they exist
    # [[Internal/Devices/SomeDevice]] -> [[Network/Devices/SomeDevice]]
    content = content.replace("[[Internal/Devices/", "[[Network/Devices/")
    # Sanitize IPs in the text
    content = sanitize_ip(content)
    # Remove MAC addresses in text
    content = re.sub(r"([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})", "[REDACTED MAC]", content)
    return content

def process_file(filename):
    if not filename.endswith(".md") or filename == "index.md" or filename == "index.base":
        return

    internal_path = os.path.join(INTERNAL_DIR, filename)
    public_path = os.path.join(PUBLIC_DIR, filename)

    with open(internal_path, 'r') as f:
        lines = f.readlines()

    # Split frontmatter
    if len(lines) > 0 and lines[0].strip() == "---":
        end_fm = -1
        for i in range(1, len(lines)):
            if lines[i].strip() == "---":
                end_fm = i
                break
        
        if end_fm != -1:
            fm_content = "".join(lines[1:end_fm])
            body_content = "".join(lines[end_fm+1:])
            
            try:
                data = yaml.safe_load(fm_content)
            except Exception as e:
                print(f"Error parsing YAML in {filename}: {e}")
                return

            # Sanitize YAML fields
            for key in list(data.keys()):
                if any(s in key.upper() for s in SENSITIVE_FIELDS):
                    del data[key]
                elif key == "IP":
                    data[key] = sanitize_ip(data[key])
                elif isinstance(data[key], str):
                    data[key] = sanitize_ip(data[key])
                elif isinstance(data[key], list):
                    data[key] = [sanitize_ip(item) if isinstance(item, str) else item for item in data[key]]

            # Update body content
            body_content = sanitize_content(body_content)
            
            # Write sanitized file
            os.makedirs(os.path.dirname(public_path), exist_ok=True)
            with open(public_path, 'w') as f:
                f.write("---\n")
                yaml.dump(data, f, default_flow_style=False)
                f.write("---\n")
                f.write("# Sanitized View\n")
                f.write("> [!NOTE] Public Version\n")
                f.write("> This is a sanitized version of the internal documentation for community and learning purposes.\n\n")
                f.write(body_content)
            print(f"Processed {filename} -> {public_path}")

def main():
    if not os.path.exists(INTERNAL_DIR):
        print(f"Internal directory {INTERNAL_DIR} not found.")
        return
    
    for filename in os.listdir(INTERNAL_DIR):
        process_file(filename)

if __name__ == "__main__":
    main()
