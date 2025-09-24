#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
# /var/log/shell-practice/16-logs/log

mkdir -p $LOGS_FOLDER
echo "script started executed at:$(date)"  | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then
    echo "ERROR:please run this script with root privilage"
    exit 1 # failure is othher than 0
fi     
# functions receives inputs through args like shell script args.
VALIDATE () { 
    if [ $1 -ne 0 ] ; then
        echo -e " installing $2 is $R failure $N"  | tee -a $LOG_FILE
        exit 1
    else
        echo -e "installing $2 is $G success $N"  | tee -a $LOG_FILE
    fi
}

for package in $@
do 
# check packages are already installed or not
  dnf list installed $package 
  if [ $? -ne 0 ]; then
    dnf install $package
    VALIDATE $? "$package"
  else
    echo -e "$package is already installed ... $Y SKIPPING $N"
  fi
done      