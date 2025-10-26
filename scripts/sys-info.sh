#!/bin/bash
# sys-info.sh - quick system summary for troubleshooting

# 'set -euo pipefail' ensures safe script execution:
# -e : exit immediately on command failure
# -u : treat unset variables as an error
# -o pipefail : any failure in a pipeline causes the script to fail
set -euo pipefail

# === Host ===
# The hostnamectl command provides detailed host metadata:
# OS, kernel, architecture, and machine ID
echo "=== Host ==="
hostnamectl

# === Uptime ===
# Shows how long the system has been running,
# the number of users, and average system load
echo -e "\n=== Uptime ==="
uptime

# === Load ===
# Displays CPU load averages over the last 1, 5, and 15 minutes
# /proc/loadavg is a virtual file that always reflects current load
echo -e "\n=== Load ==="
cat /proc/loadavg

# === Memory ===
# Displays memory usage in a human-readable format (-h)
# Includes total, used, and free RAM + swap space
echo -e "\n=== Memory ==="
free -h

# === Disk usage ===
# Shows filesystem usage and types (-T),
# totals all disks at the end (--total)
echo -e "\n=== Disk usage ==="
df -hT --total

# === Top processes (by CPU) ===
# Lists top 10 processes consuming the most CPU
# 'ps aux' lists all processes; '--sort=-%cpu' sorts by CPU descending
# 'head -n 10' limits output to top 10
echo -e "\n=== Top processes (by CPU) ==="
ps aux --sort=-%cpu | head -n 10

# === Recent syslog (last 50 lines) ===
# Attempts to read the last 50 log entries for quick problem context.
# Works for both Debian-based (/var/log/syslog) and RHEL-based (/var/log/messages) systems.
echo -e "\n=== Recent syslog (last 50 lines) ==="
if [ -r /var/log//syslog ] ; then
    tail -n 50 /var/log/syslog
elif [ -r /var/log/messages ] ; then
    tail -n 50 /var/log/messages
else
    echo "No syslog/messages found or not readable"
fi