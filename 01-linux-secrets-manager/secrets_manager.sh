#!/bin/bash

clear

Database="users.txt"
Secrets="secrets.txt"

# Create files if they don't exist
[ ! -f "$Database" ] && touch "$Database"
[ ! -f "$Secrets" ] && touch "$Secrets"

echo
echo "=========================================="
echo "          Secrets Manager"
echo "=========================================="
echo

echo "1. New User"
echo "2. Login"
echo "3. Exit"
echo

read -p "Please select your option: " option

# New User Creation
if [ "$option" = "1" ]; then

echo
echo "=============== User Registration ==============="
read -p "Enter Your Username: " username

if [ -z "$username" ]; then
    echo "Username cannot be empty."
    exit 1
fi

if grep -q "^$username:" "$Database"; then
    echo
    echo "Username already exists."
    exit 1
fi

read -sp "Enter Password: " password
echo

if [ -z "$password" ]; then
    echo "Password cannot be empty."
    exit 1
fi

echo "$username:$password" >> "$Database"

echo
echo "Information stored successfully."
echo "Registration Successful."
echo

# Login
elif [ "$option" = "2" ]; then

echo
echo "======================= Login ====================="
read -p "Username: " user
read -sp "Password: " pass

echo
echo

if grep -q "^$user:$pass$" "$Database"; then

    echo "Login Successful."
    echo
    echo "Welcome $user!"

else

    echo "Incorrect Username or Password."
    echo
    echo "Calling 911......."
    exit 1

fi

# Exit
elif [ "$option" = "3" ]; then

echo
echo "Thank you for using Secrets Manager."
echo "Good Bye."
exit 0

else

echo
echo "Invalid Option."

fi
