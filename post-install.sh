#!/bin/bash

# get pwd from script args
PWD=$1
USR=$2

# Update pc
echo "$PWD" | sudo -S apt-get update -y

echo "$PWD" | curl -sL https://deb.nodesource.com/setup_12.x | sudo -E -S bash -
echo "$PWD" | sudo -S apt-get update -y

# Check if node is installed
which node > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "Node is installed, skipping..."
else
    echo "Node is NOT installed, installing..."
    echo "$PWD" | sudo -S apt-get install nodejs -y
fi

# Check if pm2 is installed
which pm2 > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "PM2 is installed, skipping..."
    # stop pm2
    echo "$PWD" | sudo -S pm2 restart ./bin/www
else
    echo "PM2 is NOT installed, installing..."
    echo "$PWD" | sudo -S npm i -g pm2
    # start server
    pm2 start ./bin/www # in my project, use server.js
fi

# set as process on startup
echo "$PWD" | sudo -S env PATH="$PATH":/usr/bin /usr/lib/node_modules/pm2/bin/pm2 startup systemd -u "$USR" --hp /home/"$USR"

# display status
pm2 status
echo "$PWD" | sudo -S pm2 save