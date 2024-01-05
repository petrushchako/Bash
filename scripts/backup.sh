#!/bin/bash
  
# Using Bash to write backup script
# Write the Script to Back Up the Requested Files

# Create log entry and direcotry
echo "Backup starting"
echo "Creating backup directory" >> /home/cloud_user/backup_logs
mkdir /home/cloud_user/work_backup 2> /dev/null || echo "Directory work_backup e
xists"


# Copying files
echo "Backing up files" >> /home/cloud_user/backup_logs
cp -v /home/cloud_user/work/* /home/cloud_user/work_backup/ >> /home/cloud_user/
backup_logs
echo "Finished Copying Files" >> /home/cloud_user/backup_logs

echo "Backup completed"

# After creating this file, add authorization
# chmod +x backup.sh / chmod 744 backup.sh