output "vm_info" {
  value = {
    hostname          = values(azurerm_linux_virtual_machine.n01662612-vm)[*].name      
    linux_vm_fqdn     = values(azurerm_public_ip.n01662612-pip)[*].fqdn
    linux_private_ip  = values(azurerm_network_interface.n01662612-nic)[*].private_ip_address
    linux_vm_ids = values(azurerm_linux_virtual_machine.n01662612-vm)[*].id
    linux_network_ids = values(azurerm_network_interface.n01662612-nic)[*].id     
    linux_public_ip   = values(azurerm_public_ip.n01662612-pip)[*].ip_address     
  }
}
