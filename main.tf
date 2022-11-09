# get netbox prefix ip address and use it to create a new instance
# Path: main.tf

provider "netbox" {
  server_url           = var.netbox_url
  api_token            = var.netbox_token
  allow_insecure_https = true
}

# Get the prefix name from Netbox using a tag
data "http" "netbox_get_prefix" {
  url = "${var.netbox_url}/api/ipam/prefixes/?tag=${var.network_tag}"
  insecure = true
  # Request headers
  request_headers = {
    Accept = "application/json"
    Authorization = "Token ${var.netbox_token}"
  }
}
# Parse the JSON response from Netbox to get the prefix name
locals {
  http_response = jsondecode(data.http.netbox_get_prefix.body)
  prefix_name = local.http_response.results[0].display
}



# Find vCenter cluster id 
data "netbox_cluster" "vcenter_cluster" {
  name = var.vcenter_cluster
}

# Create a new VM in NetBox
resource "netbox_virtual_machine" "vm" {
  cluster_id = data.netbox_cluster.vcenter_cluster.id
  name       = var.vm_name
  comments   = var.vm_comment
  vcpus      = var.vm_cpu
  memory_mb  = var.vm_memory
  tags = [ "customer:CGI" ] # the tag is the name not the slug
}

# Create interface for VM
resource "netbox_interface" "vm_eth0" {
  name               = "eth0"
  enabled            = true
  mac_address        = var.vm_mac_address
  virtual_machine_id = netbox_virtual_machine.vm.id
}

# Find prefix in NetBox
data "netbox_prefix" "prefix" {
  # cidr = var.network_cidr
  cidr = local.prefix_name
}

# Reserve an IP address from the prefix
resource "netbox_available_ip_address" "vm-ip" {
  prefix_id    = data.netbox_prefix.prefix.id
  status       = "active"
  interface_id = netbox_interface.vm_eth0.id
  dns_name     = var.vm_name
}

# Set primary IP address for VM
resource "netbox_primary_ip" "primary_ip4" {
  ip_address_id      = netbox_available_ip_address.vm-ip.id
  virtual_machine_id = netbox_virtual_machine.vm.id
}


