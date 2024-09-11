#!/bin/bash

# Collect metrics
TIMESTAMP=$(date +'%Y-%m-%d %H:%M:%S')
MEM_USED_PERCENT=$(free | awk '/Mem:/ {printf "%.2f", $3/$2 * 100.0}')
MEM_AVAILABLE_PERCENT=$(free | awk '/Mem:/ {printf "%.2f", $7/$2 * 100.0}')

# Format and log metrics in JSON
echo "{\"timestamp\": \"$TIMESTAMP\", \"mem_used_percent\": $MEM_USED_PERCENT, \"mem_available_percent\": $MEM_AVAILABLE_PERCENT}" >> /var/log/memory_metrics.log
