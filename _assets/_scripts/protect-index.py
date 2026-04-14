import os
import shutil

ROOT_INDEX = "index.md"
BAK_INDEX = "Internal/index.md.bak"

def protect():
    if not os.path.exists(ROOT_INDEX):
        if os.path.exists(BAK_INDEX):
            print(f"[!] ROOT INDEX MISSING. Restoring from {BAK_INDEX}")
            shutil.copy2(BAK_INDEX, ROOT_INDEX)
        else:
            print("[!] CRITICAL: Root index missing and no backup found in Internal/")
    else:
        # Update backup if root index is healthy (> 1KB)
        if os.path.getsize(ROOT_INDEX) > 1000:
            shutil.copy2(ROOT_INDEX, BAK_INDEX)
            # print("[*] Index signal healthy. Backup updated.")

if __name__ == "__main__":
    protect()
