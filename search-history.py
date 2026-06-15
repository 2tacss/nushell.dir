import sys
import os
import json

keyword = sys.argv[1] if len(sys.argv) > 1 else ""
history_path = os.path.expanduser("~/.config/nushell/history.txt")

with open(history_path, "r", encoding="utf-8") as f:
    for line in f:
        line = line.strip()
        if not line:
            continue
        try:
            cmd = str(json.loads(line))
        except json.JSONDecodeError:
            cmd = line
        
        if keyword in cmd:
            print(cmd)
