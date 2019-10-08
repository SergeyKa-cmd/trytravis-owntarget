# SergeyKa-cmd_infra
## Principles of terraform code infrastructure and teamwork in Terraform environment
### Main issue: preparing and customise terraform project files with pre-defined modules
### *Additional task: Configuring google cloud storage bucket for .tfvars as file registry service
### **Additional task: Provisioners modules implement to "app" and "bd" configuration files

## System prerequisites:
  + Prepare your environment with terraform app [Download Terraform](https://www.terraform.io/downloads.html)
  + Clone terraform-2 project from [SergeyKa-cmd-infra](https://github.com/Otus-DevOps-2019-08/SergeyKa-cmd_infra.git) and configure variables.tf, terraform.tfvars files and run terraform cli
  + Traverse to ./terraform/stage or ./terraform/prod directory and initialise terrafrom environment with command:
  
    $terrafrom init
  
  + Ensure that there is no errors by command:
  
    $ terrafotm plan
  + Start deployment with command:
    $terrafrom apply
    
  ## App testing:
  + Ensure that "reddit-app" instancer up and running on [Google Console](https://console.cloud.google.com/compute)
  + Open web browser and type in http://lb_ip_address:9292 (to define lb_ip address see terminal after terraform apply comand)
  + Simply stop one of the created instance "reddit-app" and ensure that http://lb_ip_address:9292 still available
  + Using web browser connect to your console.cloud.google or use cmdlet:
		
		$gcloud compute instances list
	+ Use one of the url after terraform completion task like: http://some ip address:9292
	+ Ensure that Monolith Reddit web server is available on each of defined IP address
		
	## Additional tasks
	 + Check ~/.bash.profile file for pre-defined Database ip address on reddit-app instance
	 + Configured google cloud storage bucket for .tfvars as file registry service
	 + Manipulating with root terraform configuration files state lock: success
