resource "azurerm_network_security_group" "nsg-terraform" {
  name                = "nsg-terraform"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_virtual_network" "vnet-terraform" {
  name                = "vnet-terraform"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space

  tags = {
    environment = "Dev"
  }
}

resource "azurerm_subnet" "subnet-terraform" {
  name                 = "subnet-terraform"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet-terraform.name
  address_prefixes     = ["10.0.1.0/24"]

  depends_on = [azurerm_virtual_network.vnet-terraform]
}

resource "azurerm_public_ip" "public_ip" {
  name                = "terraform-public-ip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}

resource "azurerm_network_interface" "nic-terraform" {
  name                = "nic-terraform"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet-terraform.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}
