#!/bin/bash

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
logfile="user_audit_$timestamp.log"

echo "User Audit Report - $timestamp" > "$logfile"
echo "===================================" >> "$logfile"

echo "Normal users: " >> "$logfile"
awk -F":" '$3 >= 1000 && $7 != "/usr/sbin/nologin" && $7 != "bin/false" {print $1}' /etc/passwd >> "$logfile"



echo "Users with root access: " >> "$logfile"
getent group sudo | awk -F":" '{print $4}' | tr ',' '\n' >> "$logfile"





echo "=====================================" >> "$logfile"

cat "$logfile"
