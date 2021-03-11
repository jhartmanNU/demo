# Configure the VMware vSphere Provider
provider "vsphere" {
  user           = "username"
  password       = "password"
  vsphere_server = "vcenter"

  # if you have a self-signed cert
  allow_unverified_ssl = true
}

# Deploy 1 linux VMs
module "terraform-vsphere-vm" {
  source  = "git@github.com:NUIT-PS-Infrastructure/terraform-vsphere-vm.git"
  vmtemp        = "rhel7template"
  instances     = 1
  vmname        = "vmname"
  vmrp          = "resource pool"
  network = {
    "VLAN" = ["IPaddr"] # To use DHCP create Empty list ["",""]
  }
  vmgateway  = "gateway"
  dc        = "Datacenter"
  datastore = "datastore"
}