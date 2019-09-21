# SergeyKa-cmd-cloud-bastion

# Working on Google Cloud Platform *(GCP)
## Main issue: Connection establishment between host machine and isolated instance in GCP
## Secondary issue: Prepare solution with trusted Certificate authority for Pritunl web interface

## Prerequisites for testing repository:
   + Creating GCP account with two "bastionych" and "ellen-ripley" Vm instances.
   + Prepare for ssh keys on host machine for Appuser user generating keys for GCP by using command:
    
    $ ssh-keygen -t rsa -f ~/.ssh/appuser -C appuser -P ""
   + Create instance with public IP with pre-installed VPN Pritunl web server (using attached setupvpn.sh file) and apply proper firewall inbound rules for this instance (Bastionych in that case)
   + Create another instance without public IP connections which means to be isolated ("ellen-ripley" in that case)
   + With generated file on Pritunl Web server (using attached cloud-bastion.ovpn file) and OpenVPN client (used Pritunl Client in my case) connect to the isolated instance excluding to use instance with public IP addres (like host -> bastionych -> ellen-ripley) only using host -> ellen-ripley scheme.
----------------------------------------------------------------------------------------------------------------------------------
   + Additional objectives: Prepared for two alternative shorthand path to connect with isolated "ellen-ripley" instance
    1. Way for used shorthand command with hops between hosts using -J option in ~/.ssh/config file
    
      Host bastionych
      Hostname 34.77.5.134
      User appuser
      Host ellen-ripley
      Hostname 10.132.0.3
      IdentityFile ~/.ssh/appuser.pub
      ProxyCommand ssh -q bastionych nc ellen-ripley 22
      # Run command:

        $ ssh appuser@ellen-ripley
        
    2. Way with using hops between hosts using -J option within one alias in ~/.bashrc file:
      alias ellen-ripley='ssh -i ~/.ssh/appuser -A -J appuser@34.77.5.134 appuser@10.132.0.3'
     # Run command:
        
        $ ellen-ripley
-----------------------------------------------------------------------------------------------------------------------------------
## How to test environment:
### bastion_IP = 34.77.5.134
### someinternalhost_IP = 10.132.0.3

   + Use attached cloud-bastion.ovpn file and Openvpn client on your host.
   + Try to connect with pre-installed ssh-key before and using command:
    
    $ ssh -i ~/.ssh/appuser appuser@ellen-ripley or IP
   + Ensure that your connection is established and secured on [Pritunl Dashboard](https://34.77.5.134/)

