#!/bin/bash
#
#
<<comment
This file will show how much diskspace is freed after backup rotaion
Usage:
./diskspace_cleanup.sh <path to log file>
comment

function display_usage {
        echo "Usage: ./diskspace_cleanup.sh <path to log file>"
}

if [ $# -eq 0 ]; then
        display_usage
        exit 1
fi



log_file=$1
#echo "Disk usage Before Cleaning "
echo "-----------------------------------" >> $log_file
echo "$(date +'%y-%m-%d-%H-%M-%S')" >> $log_file
#echo "-----------------------------------" >> $log_file
before=$(df -h  /home/duryab_ariq/shell-scripting/backups | awk 'NR==2 {print $3}')
echo "Disk usage Before $before" >> $log_file

./backup-script.sh /home/duryab_ariq/shell-scripting/files/ /home/duryab_ariq/shell-scripting/backups > /dev/null
if [ $? -eq 0 ]; then
        echo "Cleanup Performed Successfull"
else
        exit 1
fi

after=$(df -h  /home/duryab_ariq/shell-scripting/backups | awk 'NR==2 {print $3}')
echo "Disk usage After $after" >> $log_file
