#!/bin/bash

R="\e[31m"
G="\e[32m"
y="\e[33m"
N="\e[0m"


USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:please run this script with root privilage"
    exit 1 # failure is othher than 0
fi     
# functions receives inputs through args like shell script args.
VALIDATE () { 
    if [ $1 -ne 0 ] ; then
        echo "ERROR: installing $2 is $R failure $N"
        exit 1
    else
        echo "installing $2 is $G success $N"
    fi
}

dnf install mysql -y
VALIDATE $? "mysql"

dnf install nginx -y
VALIDATE $? "nginx"

dnf install python3 -y
VALIDATE $? "python3"