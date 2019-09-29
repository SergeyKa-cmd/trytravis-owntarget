#!/bin/bash
############
# Bash script to install Ruby&Mongodb packages
# Written by sserdj7@gmail.com for OTUS
############
gcloud compute instances create reddit-fry \
--scopes storage-ro \
--metadata startup-xscipt-url=gs://nostromo-cargo/startup-script.sh
