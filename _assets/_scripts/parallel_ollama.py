import asyncio
import json
import os
import sys
import re
from datetime import datetime
import urllib.request
import urllib.error

# Configuration
VAULT_ROOT = os.environ.get("OBSIDIAN_VAULT_ROOT", os.path.expanduser("~/Obsidian/Journal"))
CLUSTER_CONFIG_PATH = os.path.join(VAULT_ROOT, "Network/Services/YetiPack Cluster.md")
JOURNAL_PATH = os.path.join(VAULT_ROOT, "Parallel_Offloading_Reports.md")
LOG_DIR = os.path.expanduser("~/AI_Stack/logs/parallel/")
DEFAULT_MODEL = "llama3"

def discover_nodes():
    """Extract node IPs from the cluster markdown file."""
    nodes = ["127.0.0.1"] # Always include localhost
    if os.path.exists(CLUSTER_CONFIG_PATH):
        with open(CLUSTER_CONFIG_PATH, "r") as f:
            content = f.read()
            matches = re.findall(r"\|\s*(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})\s*\|", content)
            for ip in matches:
                if ip not in nodes:
                    nodes.append(ip)
    return nodes

async def process_task(node_ip, task_id, prompt, model):
    """Send a single task to a specific node using standard library urllib."""
    url = f"http://{node_ip}:11434/api/generate"
    payload = json.dumps({
        "model": model,
        "prompt": prompt,
        "stream": False
    }).encode('utf-8')
    
    start_time = datetime.now()
    try:
        # We wrap the synchronous urllib in a thread pool to avoid blocking the event loop
        loop = asyncio.get_event_loop()
        def sync_req():
            req = urllib.request.Request(url, data=payload, headers={'Content-Type': 'application/json'})
            with urllib.request.urlopen(req, timeout=300) as response:
                return response.read().decode('utf-8')
        
        raw_res = await loop.run_in_executor(None, sync_req)
        data = json.loads(raw_res)
        result = data.get("response", "")
        
        status = "Completed"
        if "QUESTION:" in result or "UNCERTAIN:" in result:
            status = "Needs Orchestrator Review"
        
        end_time = datetime.now()
        return {
            "task_id": task_id,
            "node": node_ip,
            "prompt": prompt,
            "response": result,
            "status": status,
            "duration": (end_time - start_time).total_seconds(),
            "timestamp": end_time.isoformat()
        }

    except Exception as e:
        error_msg = f"Error on node {node_ip} for task {task_id}: {str(e)}"
        return {
            "task_id": task_id,
            "node": node_ip,
            "prompt": prompt,
            "response": error_msg,
            "status": "Failed",
            "duration": (datetime.now() - start_time).total_seconds(),
            "timestamp": datetime.now().isoformat()
        }

async def worker(node_ip, queue, results):
    while True:
        task = await queue.get()
        if task is None:
            queue.task_done()
            break
        
        task_id, task_data = task
        res = await process_task(node_ip, task_id, task_data["prompt"], task_data.get("model", DEFAULT_MODEL))
        results.append(res)
        queue.task_done()

async def main():
    if len(sys.argv) < 2:
        print("Usage: python parallel_ollama.py <tasks_json_file>")
        sys.exit(1)
        
    tasks_file = sys.argv[1]
    if not os.path.exists(tasks_file):
        print(f"File {tasks_file} not found.")
        sys.exit(1)
        
    with open(tasks_file, "r") as f:
        tasks = json.load(f)
        
    os.makedirs(LOG_DIR, exist_ok=True)
    nodes = discover_nodes()
    
    queue = asyncio.Queue()
    for i, task in enumerate(tasks):
        await queue.put((i, task))
        
    for _ in nodes:
        await queue.put(None)
        
    results = []
    workers = [asyncio.create_task(worker(node, queue, results)) for node in nodes]
    await asyncio.gather(*workers)
    
    results.sort(key=lambda x: x["task_id"])
    
    report_md = f"\n## Herd-Orchestrator Report - {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n"
    report_md += "| Task ID | Node | Prompt | Status | Duration (s) |\n"
    report_md += "|---:|:---|:---|:---|---:|\n"
    
    for res in results:
        prompt_snippet = (res['prompt'][:50] + '...') if len(res['prompt']) > 50 else res['prompt']
        status_md = f"**{res['status']}**"
        if res['status'] == "Needs Orchestrator Review":
            status_md = f"⚠️ {status_md}"
        elif res['status'] == "Failed":
            status_md = f"❌ {status_md}"
        report_md += f"| {res['task_id']} | {res['node']} | {prompt_snippet} | {status_md} | {res['duration']:.2f} |\n"
    
    report_md += "\n### Herd Handoff Details\n\n"
    for res in results:
        report_md += f"#### Task {res['task_id']} (Node: {res['node']})\n"
        report_md += f"**Prompt:** {res['prompt']}\n\n"
        report_md += f"**Response:**\n{res['response']}\n\n"
        report_md += "---\n"
    
    os.makedirs(os.path.dirname(JOURNAL_PATH), exist_ok=True)
    with open(JOURNAL_PATH, "a") as f:
        f.write(report_md)
    print(f"Report generated: {JOURNAL_PATH}")

if __name__ == "__main__":
    asyncio.run(main())
