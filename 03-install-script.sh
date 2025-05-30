#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "Error : You must have sudo access"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then   
    dnf install mysql -y
    if [ $? -ne 0 ]
    then    
        echo "Installing MYSQL..Failure"
        exit 1
    else
        echo "Installing MYSQL..Success"
    fi
else    
    echo "MYSQL is already..Installed"
fi

dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y
    if [ $? -ne 0 ]
    then    
        echo "Installing Git.. Failure"
        exit
    else    
        echo "Installing Git..Success"
    fi
else
    echo "Git is already..Installed"
fi