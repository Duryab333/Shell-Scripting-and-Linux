#!/bin/bash

alert=90 
backup_date=$(date +'%m/%d/%Y %H:%M:%S')

df -H | awk '{print $5 " " $1}' | while read output; do
    # Extract usage percentage and file system
    usage=$(echo $output | awk '{print $1}' | cut -d'%' -f1)
    file_sys=$(echo $output | awk '{print $2}')
    
    # Skip non-numeric usage values (e.g., for /dev/sr0)
    if [[ ! $usage =~ ^[0-9]+$ ]]; then
        continue
    fi

    # Check if usage exceeds the alert threshold
    if [ $usage -ge $alert ]; then
        echo "CRITICAL for $file_sys on $backup_date"
    fi
done

