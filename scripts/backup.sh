#!/bin/bash
  
# Using Bash to write backup script
# Write the Script to Back Up the Requested Files

if [ -z $1 ]
then    
    echo "You need to suply the name of the log file"
    exit 255
else
    echo "Backup process log file: $1"
fi


# $USER so the script activity can be loged for any user
LOGFILE=$1
BACKUP_LOC="/usr/bin/*"
BACKUP_TARGET="/home/cloud_user/backup"


# Create log entry and direcotry
echo "Backup starting"

function init {
    if [ -d $BACKUP_TARGET]
        then    
            echo "Directory work_backup exists"
            echo "$(date +"%x %r %Z")" >> $LOGFILE
            return 1
        else
            echo "$(date): Creating backup directory" >> $LOGFILE
            mkdir $BACKUP_LOC 2> /dev/null
            return 0
        fi


    # echo "$(date): Creating backup directory" >> $LOGFILE
    # mkdir $BACKUP_LOC 2> /dev/null || echo "Directory work_backup exists"

    # Clean up the log file for new backup
    # echo "$(date +"%x %r %Z")" >> $LOGFILE
}

tail () {
    command tail -n $1
}

cleanup () {
    rm -rf $BACKUP_TARGET
    echo "RECEIVED CTRL+C" >> /home/$USER/$LOGFILE
}

init
trap cleanup SIGING # trigger clena in case of CRTL + C (SIGINT) is used to terminate backup. 

# Copying files
echo "Backing up files" >> $LOGFILE
cd $BACKUP_LOC
for i in $(ls); do
    cp -v "$i" $BACKUP_TARGET/"$i"-backup >> /home/$USER/$LOGFILE 2>&1

done

echo -e "\n\n$(date +"%D %T")\n Finished Copying Files" >> $LOGFILE
echo "Backup completed"

# After creating this file, add authorization
# chmod +x backup.sh / chmod 744 backup.sh
