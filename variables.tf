# Path: variables.tf

## NetBox variables ## 
variable "netbox_token" {
  description = "Netbox API token"
  type = string
}

variable "netbox_url" {
  description = "Netbox URL"
  type = string
}

variable "netbox_version" {
  description = "Netbox version"
  type = string
}

variable "netbox_verify_ssl" {
  description = "Verify SSL certificate"
  type = bool
}

variable "netbox_timeout" {
  description = "Netbox API timeout"
  type = number
}

## VM Variables ##
variable "vcenter_cluster" {
  description = "vCenter cluster"
  type = string
}
  
variable "vm_name" {
  description = "VM name"
  type = string
}

variable "vm_mac_address" {
  description = "VM MAC address"
  type = string
}
  
variable "network_cidr" {
  description = "Network CIDR"
  type = string
}

variable "vm_comment" {
  description = "VM comment"
  type = string
}
  
variable "vm_cpu" {
  description = "VM CPU"
  type = number
}

variable "vm_memory" {
  description = "VM memory"
  type = number
}

variable "network_tag" {
  description = "Network tag"
  type = string
}