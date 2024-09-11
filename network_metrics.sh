#!/bin/bash

# Collect metrics
TIMESTAMP=$(date +'%Y-%m-%d %H:%M:%S')
TCP_ESTABLISHED=$(netstat -an | grep ESTABLISHED | wc -l)
TCP_TIME_WAIT=$(netstat -an | grep TIME_WAIT | wc -l)
TCP_CLOSE_WAIT=$(netstat -an | grep CLOSE_WAIT | wc -l)

# Format and log metrics in JSON
echo "{\"timestamp\": \"$TIMESTAMP\", \"tcp_established\": $TCP_ESTABLISHED, \"tcp_time_wait\": $TCP_TIME_WAIT, \"tcp_close_wait\": $TCP_CLOSE_WAIT}" >> /var/log/network_metrics.log
