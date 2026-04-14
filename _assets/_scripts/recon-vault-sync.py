import os
import subprocess
import xml.etree.ElementTree as ET
import yaml
import sys
import re
import json
from datetime import datetime

# --- CLUSTER CACHE ---
def get_cluster_resources():
    print("[*] Pulling high-fidelity cluster resource map via pvesh...")
    try:
        cmd = ["ssh", "pve", "pvesh get /cluster/resources --output-format json"]
        result = subprocess.run(cmd, capture_output=True, text=True)
        return json.loads(result.stdout)
    except: return []

def get_detailed_configs():
    print("[*] Pulling detailed guest network configurations...")
    configs = {}
    try:
        # Pulling IP data directly from node shells for precision
        cmd = ["ssh", "pve", "for node in pve1 pve2 frank crash; do echo NODE: $node; ssh -o BatchMode=yes -o StrictHostKeyChecking=no $node 'for vmid in $(pct list | awk \"{print \\$1}\" | grep \"^[0-9]\"); do echo LXC: $vmid; pct config $vmid | grep net; done; for vmid in $(qm list | awk \"{print \\$1}\" | grep \"^[0-9]\"); do echo VM: $vmid; qm config $vmid | grep net; done'; done"]
        result = subprocess.run(cmd, capture_output=True, text=True)
        current_node = ""
        for line in result.stdout.splitlines():
            if line.startswith("NODE: "): current_node = line.split(": ")[1]
            elif line.startswith("LXC: ") or line.startswith("VM: "):
                vmid = line.split(": ")[1]
                key = f"{current_node}:{vmid}"
                configs[key] = {"node": current_node, "vmid": vmid}
            elif "ip=" in line:
                ip_match = re.search(r'ip=([0-9\.]+)', line)
                if ip_match: configs[key]["ip"] = ip_match.group(1)
    except: pass
    return configs

def run_scan(target):
    print(f"[*] Starting detail nmap discovery on {target}...")
    cmd = ["nmap", "-F", "-sV", "-oX", "-", target]
    result = subprocess.run(cmd, capture_output=True, text=True)
    return result.stdout

def parse_nmap_xml(xml_data):
    root = ET.fromstring(xml_data)
    hosts = []
    for host in root.findall('host'):
        status = host.find('status').get('state')
        if status == 'up':
            ip = ""
            mac = ""
            vendor = ""
            hostname = ""
            ports = []
            for addr in host.findall('address'):
                if addr.get('addrtype') == 'ipv4': ip = addr.get('addr')
                if addr.get('addrtype') == 'mac':
                    mac = addr.get('addr')
                    vendor = addr.get('vendor', 'Unknown')
            hostnames = host.find('hostnames')
            if hostnames is not None:
                name_elem = hostnames.find('hostname')
                if name_elem is not None: hostname = name_elem.get('name')
            ports_elem = host.find('ports')
            if ports_elem is not None:
                for port in ports_elem.findall('port'):
                    portid = port.get('portid')
                    state = port.find('state').get('state')
                    service = port.find('service')
                    svc_name = service.get('name') if service is not None else "unknown"
                    if state == 'open': ports.append(f"{portid}/{svc_name}")
            hosts.append({"ip": ip, "mac": mac, "vendor": vendor, "hostname": hostname, "ports": ports})
    return hosts

def find_existing_file(base_path, ip):
    pattern = re.compile(rf'^IP:\s*["\']?{re.escape(ip)}["\']?\s*$', re.MULTILINE)
    for filename in os.listdir(base_path):
        if filename.endswith(".md") and filename not in ["index.md", "index.base.md"]:
            filepath = os.path.join(base_path, filename)
            try:
                with open(filepath, 'r') as f:
                    if pattern.search(f.read()): return filepath
            except: continue
    return None

def update_vault(network_name, hosts, cluster_res, detailed_configs):
    base_path = f"Internal/Networks/{network_name}/Devices"
    os.makedirs(base_path, exist_ok=True)
    now = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    
    # Map Cluster IP to Metadata
    ip_to_cluster = {}
    for key, cfg in detailed_configs.items():
        if "ip" in cfg: ip_to_cluster[cfg["ip"]] = cfg
    
    # Fallback to name-based mapping from cluster_res
    name_to_cluster = {res['name'].lower(): res for res in cluster_res if res.get('name')}

    for host in hosts:
        filepath = find_existing_file(base_path, host['ip'])
        
        # Identity Resolution
        cluster_info = ip_to_cluster.get(host['ip'])
        if not cluster_info and host['hostname']:
            clean_host = host['hostname'].split('.')[0].lower()
            cluster_info = name_to_cluster.get(clean_host)

        if not filepath:
            name = host['hostname'].split('.')[0] if host['hostname'] and not host['hostname'][0].isdigit() else host['ip']
            if name == "_gateway": name = "Gateway"
            filepath = os.path.join(base_path, f"{name}.md")
        
        frontmatter = {
            "Updated": now, "Active": True, "type": "unknown", "assignment": "dhcp",
            "IP": host['ip'], "MAC": host['mac'], "vendor": host['vendor'],
            "ports": host['ports'], "networks": [f"{host['ip'].rsplit('.', 1)[0]}.0/24"],
            "tags": ["devices", network_name.lower()]
        }
        
        if cluster_info:
            frontmatter["vmid"] = cluster_info.get("vmid")
            frontmatter["host_node"] = cluster_info.get("node")
            # If it's a cluster node, it's definitely static
            frontmatter["assignment"] = "static"
            # Update type if generic
            if frontmatter["type"] == "unknown":
                frontmatter["type"] = "lxc" if "lxc" in str(cluster_info).lower() else "vm"

        existing_content = ""
        if os.path.exists(filepath):
            with open(filepath, 'r') as f:
                raw_text = f.read()
                if raw_text.startswith('---'):
                    parts = raw_text.split('---', 2)
                    if len(parts) >= 3:
                        try:
                            existing_fm = yaml.safe_load(parts[1])
                            if existing_fm:
                                for key in ["type", "assignment", "model", "os", "vendor", "MAC", "vmid", "host_node", "ssh_alias", "mgmt_url"]:
                                    if key in existing_fm and existing_fm[key] and existing_fm[key] not in ["unknown", "", "[]"]:
                                        frontmatter[key] = existing_fm[key]
                                merged = existing_fm.copy()
                                merged.update(frontmatter)
                                frontmatter = merged
                            existing_content = parts[2].strip()
                        except: existing_content = raw_text
                else: existing_content = raw_text.strip()
        else:
            existing_content = f"# Device: {host['hostname'] or host['ip']}\nIdentified during automated recon."

        yaml_block = yaml.dump(frontmatter, sort_keys=False, default_flow_style=False)
        with open(filepath, 'w') as f: f.write(f"---\n{yaml_block}---\n\n{existing_content}\n")
        print(f"[+] Synced: {os.path.basename(filepath)} ({host['ip']})")

if __name__ == "__main__":
    net_name = sys.argv[1]
    subnet = sys.argv[2]
    cluster_res = get_cluster_resources()
    detailed_configs = get_detailed_configs()
    xml_output = run_scan(subnet)
    found_hosts = parse_nmap_xml(xml_output)
    update_vault(net_name, found_hosts, cluster_res, detailed_configs)
    print(f"[!] Mission Complete. {len(found_hosts)} hosts synced.")
