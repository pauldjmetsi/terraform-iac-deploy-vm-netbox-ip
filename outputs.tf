# Path: outputs.tf

# output "netbox_ip_address" {
#   value = data.netbox_ip_address.ip.address
# }

# output "netbox_ip_address_id" {
#   value = data.netbox_ip_address.ip.id
# }

output "netbox_vm_name" {
  value = netbox_virtual_machine.vm.name
}

output "netbox_vm_id" {
  value = netbox_virtual_machine.vm.id
}

output "netbox_vm_ip" {
  value = netbox_available_ip_address.vm-ip.ip_address
}

output "prefix_name" {
  value = local.prefix_name
}