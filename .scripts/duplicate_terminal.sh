#!/bin/bash

# Get active window PID (the terminal process)
terminal_pid=$(hyprctl activewindow -j | jq -r '.pid')

# Recursively search for a shell (bash/zsh/fish) child of the terminal
shell_pid=$(ps --ppid $terminal_pid -o pid= | while read pid; do
    pstree -p $pid | grep -Eo '[a-z]*\(([^)]+)\)' | grep -E 'bash|zsh|fish' | grep -Eo '[0-9]+' | head -n 1
done)

# If shell PID not found, fallback to terminal PID (home dir)
if [[ -z "$shell_pid" ]]; then
    shell_pid=$terminal_pid
fi

# Get working directory
cwd=$(readlink "/proc/$shell_pid/cwd")

kitty --directory "$cwd" &
