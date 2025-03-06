#!/bin/bash

echo "===== System Resource Usage ====="

echo "--- CPU Usage ---"
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Usage: " 100-$8 "%"}'

echo "--- Memory Usage ---"
free -m | awk 'NR==2{printf "Used: %sMB, Free: %sMB (%.2f%% Used)\n", $3, $4, $3*100/($3+$4)}'

echo "--- Disk Usage ---"
df -h --total | awk '/total/{printf "Used: %s, Free: %s (%.2f%% Used)\n", $3, $4, $3*100/($3+$4)}'

echo "--- Top 5 Processes by CPU Usage ---"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

echo "--- Top 5 Processes by Memory Usage ---"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
