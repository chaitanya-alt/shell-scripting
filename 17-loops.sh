#!/bin/bash


USERID=$(id -u)  #you need to run script with sudo
R="\e[31m"       #we are decaring colors in function.
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
    echo "Please run the script with root previliges"
    exit 1
    fi
}

VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo -e "$2 is $R FAILED..$N"
        exit 1

    else
        echo -e "$2 is $G SUCCESS..$N"
    fi
}

CHECK_ROOT

for package in $@ 
do 
    dnf list install $package
    if [ $? -ne 0 ]
    then 
        echo "echo "$package is not install, we are going to instal it"
        dnf install $package -y
        VALIDATE $? "Installing $package"
    else 
        echo "$package is already installed, nothing to do.." 
    fi

done
