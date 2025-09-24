#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:please run this script with root privilage"
    exit 1 # failure is othher than 0
fi     
# functions receives inputs through args like shell script args.
VALIDATE () { 
    if [ $1 -ne 0 ] ; then
        echo -e " installing $2 is $R failure $N"
        exit 1
    else
        echo -e "installing $2 is $G success $N"
    fi
}

# install if it is not found
dnf list installed mysql
if [ $? -ne 0 ] ; then
    dnf install mysql -y
    VALIDATE $? "mysql"
else
    echo -e "mysql already exist .... $Y SKIPPING $N" 
fi   

dnf list installed nginx
if [ $? -ne 0 ] ; then
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo -e "nginx already exist .... $Y SKIPPING $N" 
fi

dnf list installed python3
if [ $? -ne 0 ] ; then
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e "python3 already exist .... $Y SKIPPING $N" 
fi

