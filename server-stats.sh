#!/bin/bash

# CPU usage
echo "👉 Total CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Usage: " 100 - $8 "%"}'
echo

# Memory usage
echo "👉 Memory Usage:"
free -h | awk '/Mem:/ {printf "Used: %s / Total: %s (%.2f%%)\n", $3, $2, $3/$2 * 100.0}'
echo

# Disk usage
echo "👉 Disk Usage (Root Partition):"
df -h / | awk 'NR==2 {printf "Used: %s / Total: %s (%s used)\n", $3, $2, $5}'
echo

# Top 5 processes by CPU
echo "👉 Top 5 Processes by CPU Usage:"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6
echo

# Top 5 processes by Memory
echo "👉 Top 5 Processes by Memory Usage:"
ps -eo pid,comm,%cpu,%mem --sort=-%mem | head -n 6
echo
