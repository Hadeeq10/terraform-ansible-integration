output "vnet_name" {
  value = azurerm_virtual_network.n01662612-vnet.name
}

output "vnet_address_space" {
  value = azurerm_virtual_network.n01662612-vnet.address_space
}

output "subnet_name" {
  value = azurerm_subnet.n01662612-subnet.name
}

output "subnet_address_prefix" {
  value = azurerm_subnet.n01662612-subnet.address_prefixes
}

output "subnet_id" {
  value = azurerm_subnet.n01662612-subnet.id
}

output "nsg_name" {
  value = azurerm_network_security_group.n01662612-nsg.name
}
