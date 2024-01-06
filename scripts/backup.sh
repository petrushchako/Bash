#!/bin/bash
  
# Using Bash to write backup script
# Write the Script to Back Up the Requested Files

LOGFILE="/home/cloud_user/backup_logs"

# Create log entry and direcotry
echo "Backup starting"
echo "Creating backup directory" >> $LOGFILE
mkdir /home/cloud_user/work_backup 2> /dev/null || echo "Directory work_backup exists"


# Copying files
echo "Backing up files" >> $LOGFILE
cp -v /home/cloud_user/work/* /home/cloud_user/work_backup/ >> $LOGFILE
echo "Finished Copying Files" >> $LOGFILE

echo "Backup completed"

# After creating this file, add authorization
# chmod +x backup.sh / chmod 744 backup.sh