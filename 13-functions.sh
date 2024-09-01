#!/bin/bash

# check the user has root access or not.
# if root access, proceed with script.
# otherwise throw the error.
# check already install or not if yes, inform user it is already installed.
# if not install it.
# check if it is success or not.

#sudo is root user

USER=$(id -u)  #you need to run script with sudo

VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo "$2 is not successfull.."
        exit 1

    else
        echo "$2 is successful.."
    fi
}


dnf list install git

VALIDATE $? "git installation"

echo "user id is:$USER"

if [ $USER -ne 0 ]
then
    echo "Please run the script with root previliges"
    exit 1
fi

dnf list install git

if [ $? -ne 0 ]
then
    echo "git is not install, we are going to instal it"
    dnf install git -y
    VALIDATE $? "Installing git"
else 
    echo "git is already installed, nothing to do"
fi

##mysql

dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo "mysql is not installed, we are goint to install it..."
    dnf install mysql -y
    VALIDATE $? "Installing mysql"
else
    echo "mysql is already installed, nothing to do..."
fi




