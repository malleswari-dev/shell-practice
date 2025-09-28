#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # if not provided consider as 14 days. default days is 14.

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-practice"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
# /var/log/shell-practice/16-logs/log

mkdir -p $LOGS_FOLDER
echo "script started executed at:$(date)"  | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then
    echo "ERROR:please run this script with root privilage"
    exit 1 # failure is othher than 0
fi

USAGE() {
    echo -e "$R USAGE :: sudo sh 24-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS> $N "
    exit 1
}

 ## check source dir and dest dir passed or not ##
if [ $# -lt 2 ]; then
    USAGE
fi    


# ### check source dir exist or not ###
if [ ! -d $SOURCE_DIR ]; then
    echo -e "$R source $SOURCE_DIR doesn't exist $N"
    exit 1
fi

# ### check dest dir exist or not ###
if [ ! -d $DEST_DIR ]; then
    echo -e "$R destination $DEST_DIR doesn't exist $N"
    exit 1
fi

# ### find the files ###
FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

if [ ! -z "${FILES}" ] ; then
    echo "file found: $FILES"
    TIMESTAMP=$(date +%F-%H-%M)
    ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    echo "zip file name : $ZIP_FILE_NAME"
    find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS | zip -@ -j "$ZIP_FILE_NAME"
    if [ -f $ZIP_FILE_NAME ] ; then
        echo -e "archeival ...$G SUCCESS $N"
        while IFS= read -r filepath; 
        do
            echo "deleting file: $filepath"
            rm -rf $filepath
            echo "deleted file : $filepath"
        done <<< $FILES    
    else
        echo -e "archeival ... $R FAILURE $N"
        exit 1
    fi         
else
    echo -e "no files to archieve ...$Y SKIPPING $N"    
fi    