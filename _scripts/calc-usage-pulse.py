import glob, os, json
from datetime import datetime

# Paths
GEMINI_CHATS = os.path.expanduser("~/.gemini/tmp/journal/chats/session-*.json")
BUDGET_FILE = os.path.expanduser("~/.gemini/token-budget.json")

def get_budget():
    try:
        with open(BUDGET_FILE, "r") as f:
            return json.load(f)
    except:
        return {"daily": 100000000, "monthly": 1000000000}

def get_usage():
    today_str = datetime.now().strftime("%Y-%m-%d")
    month_str = datetime.now().strftime("%Y-%m")
    
    daily_total = 0
    monthly_total = 0
    
    files = glob.glob(GEMINI_CHATS)
    for file in files:
        try:
            with open(file, "r") as f:
                data = json.load(f)
                for msg in data.get("messages", []):
                    if "tokens" in msg:
                        ts = msg.get("timestamp", "")
                        tokens = msg["tokens"].get("total", 0)
                        if ts.startswith(today_str):
                            daily_total += tokens
                        if ts.startswith(month_str):
                            monthly_total += tokens
        except:
            continue
    return daily_total, monthly_total

def make_bar(percent, width=20):
    filled = int(width * percent / 100)
    if filled > width: filled = width
    return "[" + "=" * filled + " " * (width - filled) + "]"

if __name__ == "__main__":
    budget = get_budget()
    daily_usage, monthly_usage = get_usage()
    
    daily_pct = (daily_usage / budget["daily"]) * 100 if budget["daily"] > 0 else 0
    monthly_pct = (monthly_usage / budget["monthly"]) * 100 if budget["monthly"] > 0 else 0
    
    # Simple one-liner for the shell script
    print(f"Daily:   {daily_usage:12,.0f} / {budget['daily']:,} {make_bar(daily_pct)} {daily_pct:6.1f}%")
    print(f"Monthly: {monthly_usage:12,.0f} / {budget['monthly']:,} {make_bar(monthly_pct)} {monthly_pct:6.1f}%")
