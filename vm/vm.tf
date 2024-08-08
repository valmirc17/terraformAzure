

resource "azurerm_linux_virtual_machine" "vm-terraform" {
  name                = "vm-terraform"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_B1s"
  admin_username      = "testeee"
  admin_password = "V@eeauo123333"
  network_interface_ids = [var.network_interface_id]
  disable_password_authentication = false
  
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}