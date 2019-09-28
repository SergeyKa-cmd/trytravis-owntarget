# SergeyKa-cmd_infra
## GCP environment deployment using Packer
### Main issue: preparing custom JSON configuration files for private image processing
### Additional task: preparing custom JSON with pre-built image creation processing, deployment VM instance from pre-built image

## System prerequisites:
  + Insall [Packer environment](https://www.packer.io/downloads.html) and prepare for Application Default Credentials:
  
      $ gcloud auth application-default login
  + Prepare base image "reddit-base" in repository ./config-scripts/ubuntu16.json and ./config-scripts/variables.json See [Related documentation](https://www.packer.io/docs/builders/googlecompute.html);
  + Tuning packer JSON file with additional features ("machine_type", "image_description", "disk_type", "disk_size", "tags");
  + Preparation of customized immutable.json & variables.json files and script files in ./files;
  + gcloud script file preparation for image-to-intsance deployment [Link to Gist](https://gist.github.com/SergeyKa-cmd/b24ae20b275bfb8e49da426bebceb621).
  + Creating Firewall rule for port opening (tcp:9292) manually on CGP console or using gcloud script [Link to gist](https://gist.githubusercontent.com/SergeyKa-cmd/c9782954abe6ba4e076bc32f87285537/raw/f7980a965be6998f310cfd3800a4bc62072dd0e6/gcp_firewall_tcp9292.sh)
  
  ## App testing:
  + For prepare base image "reddit-base" run cmdlet within ./config-scripts repository folder:
  
      $ packer build -var-file=variables.json immutable.json
  + reddit-full_IP = (ip of created "reddit-vm instance")
  + reddit-full_port = 9292
  
  Open url http://(<vm instance IP>):9292
  
  ## Additional task:
  + For prepare pre-built or "backed" image from "reddit-base" image run cmdlet within root repository folder:
  
      $ packer build -var-file=variables.json immutable.json
  + For instance from baked image deployment use gcloud cmdlet in bash [Link to Gist](https://gist.githubusercontent.com/SergeyKa-cmd/b24ae20b275bfb8e49da426bebceb621/raw/0090e03f85b60547c94c56737e10a4aef0e838a6/create-reddit-%2520vm.sh)