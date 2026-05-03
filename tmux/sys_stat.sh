#!/bin/bash

# CPU
cpu=$(top -bn1 | grep "Cpu(s)" | awk '{printf "%.1f%%", 100 - $8}')

# RAM
ram=$(free -h | awk '/^Mem:/ {print $3 "/" $2}')
ram=${ram//i/}

# GPU (assuming nvidia)
if command -v nvidia-smi &> /dev/null; then
    gpu=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits | awk '{print $1"%"}')
else
    gpu="N/A"
fi

# Disk (free space on /)
disk=$(df -h / | awk 'NR==2 {print $4}')

# Print with tmux formatting
echo "cpu $cpu #[fg=colour238]• #[fg=colour245]ram $ram #[fg=colour238]• #[fg=colour245]gpu $gpu #[fg=colour238]• #[fg=colour245]disk $disk"
