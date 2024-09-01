#!/bin/bash

LOGS_FOLDER="/var/log/shell-script" # /var/log is the default log folder in linux
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)  # this is used to the script name actual script name is 8-redirectors.sh
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER


USERID=$(id -u)  #you need to run script with sudo
R="\e[31m"       #we are decaring colors in function.
G="\e[32m"
N="\e[0m"
Y="\e[33m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
    echo -e "$R Please run the script with root previliges$N"  &>> $LOGS_FILE
    exit 1
    fi
}

VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo -e "$2 is $R FAILED..$N" &>> $LOGS_FILE
        exit 1

    else
        echo -e "$2 is $G SUCCESS..$N" &>> $LOGS_FILE
    fi
}

USAGE(){
    echo -e "$R USAGE :: $N sudo sh 18-redirectors.sh package1 package2"
    exit 1

}

CHECK_ROOT

if [ $# -eq 0 ]
then
    USAGE
fi

for package in $@ # $@ refers to all arguments passed to it
do 
    dnf list installed $package &>> $LOGS_FILE
    if [ $? -ne 0 ]
    then 
        echo "echo $package is not install, we are going to instal it" &>> $LOGS_FILE
        dnf install $package -y &>> $LOGS_FILE
        VALIDATE $? "Installing $package"
    else 
        echo -e "$package is already $Y installed, nothing to do..$N" &>> $LOGS_FILE
    fi

done