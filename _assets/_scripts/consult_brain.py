import requests
import sys
def ask_local_brain(prompt):
    url = "http://localhost:11434/api/generate"
    data = {"model": "llama3.1", "prompt": prompt, "stream": False}
    try:
        response = requests.post(url, json=data, timeout=60)
        return response.json().get("response", "No response from brain.")
    except Exception as e:
        return f"Error: {str(e)}"
if __name__ == "__main__":
    print(ask_local_brain(" ".join(sys.argv[1:])))
