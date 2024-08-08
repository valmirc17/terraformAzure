# Saída do ID da sub-rede criada
output "subnet_id" {
  value = azurerm_subnet.subnet-terraform.id
}

output "network_interface_id" {
 value = azurerm_network_interface.nic-terraform.id
}