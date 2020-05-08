#!/bin/bash

# get pwd from script args
LOGGED_IN_USER=$1

# Update pc
apt-get update -y

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E -S bash -
apt-get update -y

# Check if node is installed
which node > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "Node is installed, skipping..."
else
    echo "Node is NOT installed, installing..."
    apt-get install nodejs -y
fi

# Check if pm2 is installed
which pm2 > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "PM2 is installed, skipping..."
    # stop pm2
    pm2 restart server
else
    echo "PM2 is NOT installed, installing..."
    npm i -g pm2
    # start server
    pm2 start ./bin/www # in my project, use server.js
fi

# set as process on startup
pm2 startup "$LOGGED_IN_USER"

# display status
pm2 status
pm2 save