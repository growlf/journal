import os
import subprocess
import httpx
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import Optional

app = FastAPI(title="NetYeti Sidecar API")

class CommandRequest(BaseModel):
    command: str

class FileRequest(BaseModel):
    path: str
    content: Optional[str] = None

class ProxyRequest(BaseModel):
    url: str
    method: str = "GET"
    data: Optional[dict] = None

@app.post("/execute")
async def execute_command(request: CommandRequest):
    try:
        # Execute command in the context of the host (via /host mount or direct)
        # Note: In docker, we usually mount host root to /host
        process = subprocess.run(request.command, shell=True, capture_output=True, text=True, timeout=30)
        return {
            "stdout": process.stdout,
            "stderr": process.stderr,
            "exit_code": process.returncode
        }
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/read")
async def read_file(path: str):
    # Map to /host for host filesystem access
    host_path = os.path.join("/host", path.lstrip("/"))
    if not os.path.exists(host_path):
        raise HTTPException(status_code=404, detail="File not found")
    try:
        with open(host_path, "r") as f:
            return {"content": f.read()}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.post("/write")
async def write_file(request: FileRequest):
    host_path = os.path.join("/host", request.path.lstrip("/"))
    try:
        os.makedirs(os.path.dirname(host_path), exist_ok=True)
        with open(host_path, "w") as f:
            f.write(request.content)
        return {"status": "success", "path": host_path}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.post("/proxy")
async def proxy_request(request: ProxyRequest):
    try:
        async with httpx.AsyncClient() as client:
            if request.method.upper() == "GET":
                resp = await client.get(request.url)
            else:
                resp = await client.post(request.url, json=request.data)
            return {"status_code": resp.status_code, "body": resp.text}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=11435)
