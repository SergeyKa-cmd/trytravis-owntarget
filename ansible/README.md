## Contents:
  # 1. Ansible first look
  # 2. Ansible: advanced deployment and configuration management
  ______________________________________________________________
## Ansible first look
### Main issue: preparing Ansible environment and simple playbook
### Additional task: design simple script in C++/Python for ansible ping command to dymanic inventory.json file

## System prerequisites:
  + Prepare for python local environment not less than 2.7;
  + Prepare Ansible environment for your OS [Ansible install] (https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html);
## App testing for additional task:
  + For C++parse.cpp script use bash command:
    
    $./parse_on_cpp
  + For Python parse.py script use python in bash command:
    
    $python parse.py
  + After C++/Python scripts find inventory.json file in repository
_____________________________________________________________________________________________________________________________
## Ansible: advanced deployment and configuration management
### Main issue: Re-configuring Ansible playbooks, handlers and configuration templates
### Additional task: Google API plugin implementation
## System prerequisites:
  + Clone this repository to local host
  + Remove all GCP instances from 1-st task using terraform destroy
  + Using [Ansible Guide](https://docs.ansible.com/ansible/latest/scenario_guides/guide_gce.html) prepare environment for Google API using
 ## App testing for additional task:
  + Run site.yml playbook
  + Checkout current inventory in [Google Cloud Console](https://console.cloud.google.com/compute)
  + Run inventory.gcp.yml playbook for gcp_plugin test like:
  
    $ansible -i inventory.gcp.yml all --list
    
    $ansible -i inventory.gcp.yml all -m ping
