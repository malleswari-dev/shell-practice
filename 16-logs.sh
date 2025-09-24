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

# install if it is not found
dnf list installed mysql &>> $LOG_FILE
if [ $? -ne 0 ] ; then
    dnf install mysql -y &>> $LOG_FILE
    VALIDATE $? "mysql"
else
    echo -e "mysql already exist .... $Y SKIPPING $N"  | tee -a $LOG_FILE
fi   

dnf list installed nginx &>> $LOG_FILE
if [ $? -ne 0 ] ; then
    dnf install nginx -y &>> $LOG_FILE
    VALIDATE $? "nginx"
else
    echo -e "nginx already exist .... $Y SKIPPING $N"  | tee -a $LOG_FILE
fi

dnf list installed python3 &>> $LOG_FILE
if [ $? -ne 0 ] ; then
    dnf install python3 -y &>> $LOG_FILE
    VALIDATE $? "python3"
else
    echo -e "python3 already exist .... $Y SKIPPING $N"  | tee -a $LOG_FILE
fi



