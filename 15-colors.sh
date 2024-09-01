#!/bin/bash


#!/bin/bash

# check the user has root access or not.
# if root access, proceed with script.
# otherwise throw the error.
# check already install or not if yes, inform user it is already installed.
# if not install it.
# check if it is success or not.


# echo -e "\e[31m Hello World" ---> it is syntax in linux

#sudo is root user

USERID=$(id -u)  #you need to run script with sudo
R="\e[31m"
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


dnf list install git

VALIDATE $? "git installation"

echo "user id is:$USERID"

CHECK_ROOT


dnf list install git

if [ $? -ne 0 ]
then
    echo "git is not install, we are going to instal it"
    dnf install git -y
    VALIDATE $? "Installing git"
else 
    echo -e "git is already $G installed $N, nothing to do"
fi

##mysql

dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo "mysql is not installed, we are goint to install it..."
    dnf install mysql -y
    VALIDATE $? -e "$G Installing mysql $N"
else
    echo "mysql is already installed, nothing to do..."
fi




