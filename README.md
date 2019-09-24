# SergeyKa-cmd_infra
## Test application deployment
### Main issue: preparing bash automation scripts for test app deployment
### Additional task: Perform startup-script for GCP automation and firewall rule cli command

## System prerequisites:
  + Preparing for gcloud/gsutil commandlet using [Documentation](https://cloud.google.com/sdk/docs/)
  + Creating new VM instance with gcloud command [Link to gist](https://gist.githubusercontent.com/Nklya/5bc429c6ca9adce1f7898e7228788fe5/raw/01f9e4a1bf00b4c8a37ca6046e3e4d4721a3316a/gcloud)
  + Manual apps deployment (Ruby, MongoDB, Puma-server) or using [Link to gist](https://gist.githubusercontent.com/SergeyKa-cmd/67d8d331fa7ba90d647a1c7e154c8c83/raw/6d1a40f7ac2e9eadd1c9fa547e1d327453d7154c/puma_deploy.sh)
  + Creating Firewall rule for port opening (tcp:9292) manually on CGP console or using gcloud script [Link to gist](https://gist.githubusercontent.com/SergeyKa-cmd/c9782954abe6ba4e076bc32f87285537/raw/f7980a965be6998f310cfd3800a4bc62072dd0e6/gcp_firewall_tcp9292.sh)
  
  ## App testing:
  ### testapp_IP = 35.241.180.163
  ### testapp_port = 9292
  Open url http://<vm instance IP>:9292
  
  ## Additional task:
  + [Startup-script](https://gist.githubusercontent.com/SergeyKa-cmd/35797877c0aae680ea9ffa7e3dfed5d7/raw/06064fb97f0a2cd3032c65e637ae48cd067cc3bf/startup_script_url.sh)
  + [Startup-script-url](https://gist.githubusercontent.com/SergeyKa-cmd/38e96487831a0f36307c166c80161bba/raw/f572abd2df0a8adf033704b69cf5e7aa1006a644/startup-script-url.sh)
  + [Firewall creation script](https://gist.githubusercontent.com/SergeyKa-cmd/c9782954abe6ba4e076bc32f87285537/raw/f7980a965be6998f310cfd3800a4bc62072dd0e6/gcp_firewall_tcp9292.sh)