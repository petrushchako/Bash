#!/bin/bash
  
# Using Bash to write backup script
# Write the Script to Back Up the Requested Files

# $USER so the script activity can be loged for any user
LOGFILE="/home/cloud_user/backup_logs"
BACKUP_LOC="/usr/bin/*"
BACKUP_TARGET="/home/cloud_user/backup"


# Create log entry and direcotry
echo "Backup starting"

function init{

    echo "Creating backup directory" >> $LOGFILE
    mkdir $BACKUP_LOC 2> /dev/null || echo "Directory work_backup exists"

    # Clean up the log file for new backup
    echo "" > $LOGFILE
}

init

# Copying files
echo "Backing up files" >> $LOGFILE
cp -v $BACKUP_LOC $BACKUP_TARGET >> $LOGFILE
echo "Finished Copying Files" >> $LOGFILE

echo "Backup completed"

# After creating this file, add authorization
# chmod +x backup.sh / chmod 744 backup.sh