#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-roboshop"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
# /var/log/shell-practice/16-logs/log
START_TIME=$(date +%s)

mkdir -p $LOGS_FOLDER
echo "script started executed at:$(date)"  | tee -a $LOG_FILE
SOURCE_DIR=/home/ec2-user/app-logs


if [ ! -d $SOURCE_DIR ] ; then
    echo -e "ERROR :: $SOURCE_DIR doesn't exist"
    exit 1
fi

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -type f -mtime +14)

while IFS= read -r filepath;  
do
    echo "deleting file : $filepath"
    rm -rf $filepath
    echo "deleted file: $filepath"
    
done <<< $FILES_TO_DELETE