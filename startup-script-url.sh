#!/bin/bash
###########
# Srciprt for VM instance creation with ruby, mongodb and puma server
# Was created by sserdj7@gmail.com for OTUS
##########
gcloud compute instances create puma-web-app \
  --zone=europe-west1-d \
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --tags http-server \
  --machine-type=f1-micro \
  --restart-on-failure \
  --metadata startup-script='wget -O -  https://gist.githubusercontent.com/SergeyKa-cmd/67d8d331fa7ba90d647a1c7e154c8c83/raw/04cd340f13b81ac8d5ac0363c52b6a0236ab64b6/puma_deploy.sh | bash'
