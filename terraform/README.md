# SergeyKa-cmd_infra
## IaC practice using Terraform environment
### Main issue: preparing and customise terraform project files for instances creation processing
### *Additional task: customise main.tf file with adding public ssh key to various users
### **Additional task: preparing load balance to multiple instances using terraform

## System prerequisites:
  + Prepare your environment with terraform app [Download Terraform](https://www.terraform.io/downloads.html)
  + Clone project from [SergeyKa-cmd-infra](https://github.com/Otus-DevOps-2019-08/SergeyKa-cmd_infra.git) and configure variables.tf, terraform.tfvars files and run terraform cli
  + Move to ./terraform directory and initialise terrafrom environment with command:
  
    $terrafrom init
  
  + Ensure that there is no errors by command:
  
    $ terrafotm plan
  + Start deployment with command:
    $terrafrom apply
    
  ## App testing:
  + Ensure that "reddit-app" instancer up and running on [Google Console](https://console.cloud.google.com/compute)
  + Open web browser and type in http://lb_ip_address:9292 (to define lb_ip address see terminal after terraform apply comand)
  + Simply stop one of the created instance "reddit-app" and ensure that http://lb_ip_address:9292 still available
