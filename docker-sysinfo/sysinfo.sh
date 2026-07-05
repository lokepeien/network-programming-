#!/bin/bash

echo "================= LINUX SYSTEM INFORMATION ================="

echo -e "\n--- Hostname ---"
hostname

echo -e "\n--- Current Date and Time ---"
date

echo -e "\n--- CPU Information ---"
lscpu

echo -e "\n--- Memory Usage ---"
free -h

echo -e "\n--- Disk Usage ---"
df -h

echo -e "\n--- Logged-in Users ---"
who

echo -e "\n--- Top 5 Processes by CPU Usage ---"
ps aux --sort=-%cpu | head -6

echo -e "\n=============================================================="
