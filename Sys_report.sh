

#!/bin/bash

# System Info Report

echo "🖥️ SYSTEM INFORMATION REPORT"
echo "====================="
echo "Hostname: $(hostname)"
echo "OS: $(uname -o)"
echo "Kernel: $(uname -r)"
echo "Uptime: $(uptime -p)"
echo ""

# CPU and RAM Usage
echo "CPU Load: $(top -bn1 | grep 'Cpu(s)' | awk '{print $2 + $4}')%"
echo "RAM Usage: $(free -h | awk '/Mem:/ {print $3 "\" $2}')"
echo ""

# Disk Space Summary
echo "Disk Usage:"
df -h | grep '^/dev/' | awk '{print $1, $5, $6}'
echo ""

# Top 5 Memory-Hungry Processes
echo "Top 5 Memory-Hungry Processes:"
ps aux --sort=-%mem | awk 'NR<=6{printf "%-10s %-8s %-5s %-5s %s\n", $1, $2, $3, $4, $11}'
