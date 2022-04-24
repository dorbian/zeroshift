# ZeroShift
Zeroshift is the brainchild of a someone with too little spare time and too much ideas.  
Working with OpenShift on a daily base, but not having the resources to properly run a cluster in a home environment sprung the idea to make a similar product,both in installation and use, but then lightweight.  
Hence using k0s made sense as this is a low resource distribution of Kubernetes.  
However using this in a similar fashion as the original so the installation should be trouble free and rich in featureset.

# Requirements
## Infrastructure
Initially this is build to run on XenServer as that is what my current development environment has, in the future more will be added by the power of terraform.  
## Resources
Below are the minimum requirements for installation, however during the configuration stage you can increase this as needed.
### Controller nodes minimum
1.5GB of ram  
10GB of disk space  
1vCpu
### Worker nodes minimujm
2GB of ram  
10GB disk for OS  
20GB disk for data  
1vCpu

## Dependencies
All components for the installation are available within the installer, however for the injection of the ignition file into the coreos image guestfish-tools has to be installed on the system used to provision.  
in the future all components will be run from containers instead.

# Components
## Cluster
k0sproject - https://k0sproject.io/  
cri-o - https://cri-o.io/  
Fedora CoreOS - https://getfedora.org/en/coreos?stream=stable  

## Installer
Terraform - https://www.terraform.io/  
Butane - https://coreos.github.io/butane/  
Portable Ansible - https://github.com/ownport/portable-ansible  
