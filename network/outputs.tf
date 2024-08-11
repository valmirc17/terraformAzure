output "subnet_id" {
  value = azurerm_subnet.subnet-terraform.id
}

output "network_interface_id" {
 value = azurerm_network_interface.nic-terraform.id
}

output "public_ip" {
    value = azurerm_public_ip.public_ip.ip_address
}