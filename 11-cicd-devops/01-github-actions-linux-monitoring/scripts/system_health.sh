#!/bin/bash

echo "========== SYSTEM HEALTH REPORT =========="

echo "Hostname: $(hostname)"
echo

echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" | head -n 1
echo

echo "Memory Usage:"
free -h
echo

echo "Disk Usage:"
df -h /
echo

echo "Process Monitoring:"

# SSH Monitoring
process_count=$(pgrep -c sshd || true)

if [ "$process_count" -gt 0 ];
then
    echo "SSH is running ($process_count processes)"
elif [ "$process_count" -eq 0 ];
then
    echo "SSH is not running"
else
    echo "SSH status unknown"
fi

# Apache Monitoring
process_count=$(pgrep -c apache2 || true)

if [ "$process_count" -gt 0 ];
then
    echo "Apache is running ($process_count processes)"
elif [ "$process_count" -eq 0 ];
then
    echo "Apache is not running"
else
    echo "Apache status unknown"
fi

echo
echo "========== MONITORING COMPLETED =========="
