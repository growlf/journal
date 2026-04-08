---
title: Shell
---

# The NetYeti's Command Line: Shell

The shell is where you'll spend most of your time as a Lab Operator. It's your direct line to the heart of the system. 

## Which Shell?
- **Bash:** The "Old Reliable." Ubiquitous on almost every Linux system.
- **Zsh:** More "creature comforts" (auto-complete, plugins via Oh My Zsh).
- **Fish:** Extremely user-friendly, but not always POSIX-compliant.

## NetYeti's Shell Mastery
1.  **Redirection:** `>` (overwrite), `>>` (append), `2>&1` (catch errors too).
2.  **Pipes:** `|` (taking the output of one tool and feeding it into another).
3.  **Scripts:** Automation! Don't do it manually twice; script it once.

### Core Utilities to Know:
- `grep`: Finding text in files.
- `awk` / `sed`: Text processing powerhouses.
- `find`: Locating files by criteria.
- `xargs`: Feeding find results into other commands.

> [!CAUTION]
> Avoid "Copy-Paste Engineering." If you don't understand what a one-liner does, don't run it as root.

## Knowledge Check:
- Can you explain the difference between `sh` and `bash`?
- Do you use a multiplexer like `tmux` or `screen` to keep your sessions alive?
