#!/bin/bash
###########
# Bash script for Mongodb installation packages
# Written by sserdj&@gmail.com for OTUS
###########

set -e
sudo mv -f /tmp/mongod.conf /etc/mongod.conf
sudo systemctl restart mongod
