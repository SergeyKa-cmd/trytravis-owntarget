#!/bin/bash
############
# Bash script to install Ruby&Mongodb packages
# Written by sserdj7@gmail.com for OTUS
############
sudo apt update
sudo apt upgrade -y
sudo apt-get install -y ruby-full ruby-bundler build-essential

## MongoDB installation start
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
sudo apt update
sudo apt-get install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod

## Deploy Puma server
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
puma -d