#!/bin/bash


du -h | sort -hr > disklogs.txt

echo "Top 10 Largest Directories in Current Directory: "

head disklogs.txt

threshold=80

usage=$(df / | awk 'NR==2 {gsub("%",""); print $5}')

echo "Current Disk Usage: $usage%"

if [ "$usage" -gt "$threshold" ]; then
	echo "Warning : Threshold of $threshold reached!"

else
	echo "Disk usage under control"
fi
