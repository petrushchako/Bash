#!/bin/bash
# sys-info.sh - quick system summary for troubleshooting

set -euo pipefail

echo "=== Host ==="
hostnamectl

echo -e "\n=== Uptime ==="
uptime

echo -e "\n=== Load ==="
cat /proc/loadavg

echo -e "\n=== Disk usage ==="
df -hT --total

echo -e "\n=== Top processes (by CPU) ==="
ps aux --sort=-%cpu | head -n 10

echo -e "\n=== Recent syslog (last 50 lines) ==="
if [ -r /var/log//syslog ] ; then
    tail -n 50 /var/log/syslog
elif [ -r /var/log/messages ] ; then
    tail -n 50 /var/log/messages
else
    echo "No syslog/messages found or not readable"
fi