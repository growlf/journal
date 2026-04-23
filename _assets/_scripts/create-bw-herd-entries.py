#!/usr/bin/env python3
import json
import subprocess
import secrets
import string
import sys

def run_command(cmd):
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    if result.returncode != 0:
        print(f"Error running command: {cmd}\n{result.stderr}")
        sys.exit(1)
    return result.stdout.strip()

def create_bw_item(node_name, ip):
    # Check if item exists
    search_results = json.loads(run_command(f"bw list items --search 'SSH - {node_name}'"))
    if search_results:
        print(f"Item for {node_name} already exists. Skipping creation.")
        return search_results[0]['id']

    # Generate a secure password
    password = ''.join(secrets.choice(string.ascii_letters + string.digits + string.punctuation) for _ in range(24))
    
    # Create the item template
    template = json.loads(run_command("bw get template item"))
    template['name'] = f"SSH - {node_name} (bmsadmin)"
    template['notes'] = f"Automated entry for bmsadmin on {node_name} ({ip})"
    template['login'] = {
        'username': 'bmsadmin',
        'password': password,
        'uris': [{'uri': ip}]
    }
    template['fields'] = [
        {'name': 'SSH_PRIVATE_KEY', 'value': '', 'type': 0},
        {'name': 'SSH_PUBLIC_KEY', 'value': '', 'type': 0}
    ]

    # Add the item
    item_json = json.dumps(template)
    # Correctly encoding the JSON before passing it to 'bw create'
    import base64
    encoded_json = base64.b64encode(item_json.encode()).decode()
    new_item = json.loads(run_command(f"echo '{encoded_json}' | bw create item --session $BW_SESSION"))
    print(f"Created Bitwarden entry for {node_name}: {new_item['id']}")
    return new_item['id']

if __name__ == "__main__":
    nodes = {
        "nuk1": "10.0.1.252",
        "lab1": "10.0.1.75",
        "lab2": "10.0.1.139",
        "lab3": "10.0.1.30",
        "lab4": "10.0.1.238",
        "500.gemini": "10.0.1.194",
        "501.gemini": "10.0.1.195",
        "502.gemini": "10.0.1.196",
        "gemini": "10.0.1.201"
    }
    
    for name, ip in nodes.items():
        create_bw_item(name, ip)
