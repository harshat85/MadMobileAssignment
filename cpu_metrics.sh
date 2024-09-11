#!/bin/bash

# Collect metrics
TIMESTAMP=$(date +'%Y-%m-%d %H:%M:%S')
CPU_USAGE_USER=$(mpstat 1 1 | awk '/Average:/ {print 100 - $12}')
CPU_USAGE_SYSTEM=$(mpstat 1 1 | awk '/Average:/ {print $4}')
CPU_USAGE_IDLE=$(mpstat 1 1 | awk '/Average:/ {print $12}')
CPU_USAGE_IOWAIT=$(mpstat 1 1 | awk '/Average:/ {print $6}')

# Format and log metrics in JSON
echo "{\"timestamp\": \"$TIMESTAMP\", \"cpu_usage_user\": $CPU_USAGE_USER, \"cpu_usage_system\": $CPU_USAGE_SYSTEM, \"cpu_usage_idle\": $CPU_USAGE_IDLE, \"cpu_usage_iowait\": $CPU_USAGE_IOWAIT}" >> /var/log/cpu_metrics.log
