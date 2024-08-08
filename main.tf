terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.114.0"
    }
  }
}

# Configuração do provedor
provider "azurerm" {
  features {}
}

# Criação do RG (Resource Group)
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source              = "./network"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = var.address_space
  subnet_prefix       = var.subnet_prefix
  
}

module "vm" {
  source = "./vm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  network_interface_id = module.network.network_interface_id

}

