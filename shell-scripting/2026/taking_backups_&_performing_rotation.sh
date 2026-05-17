#!/bin/bash
#
#
<<comment
This script takes backup for 5 day rotation

Usage:
./backup-shell.sh <path to your source> <path to backup folder>
comment
function display_usage {
        echo "Usage: ./backup-shell.sh <path to your source> <path to backup folder>"
}
if [ $# != 2 ]; then
        display_usage
fi

source_dir=$1
timestemp=$(date +'%y-%m-%d-%H-%M-%S')
backup_dir=$2

function create_backup {
        echo "Creating Backup ..."
        zip -r "${backup_dir}/backup_${timestemp}.zip" ${source_dir} > /dev/null
        if [ $? -eq 0 ]; then
                echo "Backup generated Successfully for ${timestemp}"
        else
                echo "ERROR"
        fi
}

function perform_rotation {
        backups=($(ls -t "${backup_dir}/backup_"*.zip 2>/dev/null))
        #echo "${backups[@]}"
        if [ "${#backups[@]}" -gt 5 ]; then
                echo "Performing rotaiton for 5 days"
                for backup in "${backups_to_remove[@]}"; do
                        rm -f $backup
                        echo "Backups  removed successfully $backup"
                done

        fi


}

create_backup
perform_rotation
