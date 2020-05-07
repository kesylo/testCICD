#!/bin/bash

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt install nodejs -y

if node -v > /dev/null
  then
    echo " 111 node is installed, skipping..."
  else
    echo " 111 node is installed, skipping..."
fi

if which node > /dev/null
  then
    echo "222 node is installed, skipping..."
  else
    echo "222 node is installed, skipping..."
fi