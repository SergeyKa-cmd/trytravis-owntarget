#!/bin/bash
###########
# Bash script for deploy puma server on Ruby
# Written by sserdj@gmail.com for OTUS
##########

cd $HOME
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
puma -d
