
# Shell Scripting Practice - 2026

This folder contains Bash scripts created for practicing real DevOps and Linux automation tasks.

The main focus is on backups, disk usage monitoring, logging, command-line arguments, functions, and basic error handling.

## Scripts

| Script | Description |
|---|---|
| `taking_backups_&_performing_rotation.sh` | Creates a zip backup of a source directory and is intended to keep only the latest 5 backups. |
| `diskspace_usage_cleanup.sh` | Logs disk usage before and after running the backup/cleanup process. |

## How to Run

Give execute permission:

```bash
chmod +x taking_backups_\&_performing_rotation.sh
chmod +x diskspace_usage_cleanup.sh
````

Run the backup script:

```bash
./taking_backups_\&_performing_rotation.sh <source-directory> <backup-directory>
```

Run the disk usage script:

```bash
./diskspace_usage_cleanup.sh <log-file-path>
```

## What I Practiced

* Bash functions
* Positional arguments
* Argument validation
* Creating zip backups
* Checking exit codes
* Disk usage monitoring with `df -h`
* Extracting output with `awk`
* Writing logs to a file
* Basic backup rotation logic

## DevOps Relevance

These scripts practice common DevOps tasks such as automating backups, monitoring disk usage, writing logs, and preparing scripts for scheduled jobs like cron.

## Future Improvements

* Complete the backup rotation logic
* Remove hardcoded paths
* Add better error handling
* Add cron job examples
* Make the scripts more reusable

