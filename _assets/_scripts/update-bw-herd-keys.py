#!/usr/bin/env python3
import json
import subprocess
import os
import sys
import base64

def run_command(cmd):
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    if result.returncode != 0:
        print(f"Error running command: {cmd}\n{result.stderr}")
        sys.exit(1)
    return result.stdout.strip()

def update_bw_item(node_name):
    key_dir = f"~/Obsidian/Journal/Internal/Automation/Ansible/keys/{node_name}"
    if not os.path.exists(key_dir):
        print(f"No keys found for {node_name}. Skipping.")
        return

    # Read keys
    with open(f"{key_dir}/id_rsa", "r") as f:
        private_key = f.read()
    with open(f"{key_dir}/id_rsa.pub", "r") as f:
        public_key = f.read()

    # Find item
    search_results = json.loads(run_command(f"bw list items --search 'SSH - {node_name} (bmsadmin)' --session $BW_SESSION"))
    if not search_results:
        print(f"No Bitwarden entry found for {node_name}. Skipping.")
        return
    
    item = search_results[0]
    
    # Update fields
    for field in item.get('fields', []):
        if field['name'] == 'SSH_PRIVATE_KEY':
            field['value'] = private_key
        elif field['name'] == 'SSH_PUBLIC_KEY':
            field['value'] = public_key

    # Save item
    item_json = json.dumps(item)
    encoded_json = base64.b64encode(item_json.encode()).decode()
    run_command(f"echo '{encoded_json}' | bw edit item {item['id']} --session $BW_SESSION")
    print(f"Updated Bitwarden entry for {node_name} with SSH keys.")

if __name__ == "__main__":
    nodes = ["nuk1", "lab1", "lab2", "lab3", "lab4", "500.gemini", "501.gemini", "502.gemini", "pve", "pve2"]
    for node in nodes:
        update_bw_item(node)
