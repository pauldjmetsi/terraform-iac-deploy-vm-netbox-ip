# Path: terraform.tfvars

# NetBox variables 
netbox_token = "ab84833dfae5342e7a911f29767bfed549e6ca6c"
netbox_url = "https://10.22.54.100"
netbox_version = "2.8.5"
netbox_verify_ssl = false
netbox_timeout = 30

# VM Variables 
vcenter_cluster = "DJ-Test01-Cluster"
vm_name = "pj-test-vm"
vm_mac_address = "00:00:00:00:00:00"
network_cidr = "10.22.54.0/24"
vm_comment = "Test VM"
vm_cpu = 2
vm_memory = 2048
network_tag = "bridgedomain-bd_54"