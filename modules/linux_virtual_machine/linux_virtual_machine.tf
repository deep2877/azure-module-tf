# Create Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "linux_virtual_machine" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.size
  admin_username      = var.admin_username
  # used for running custom script inside virtual machine post comissioning
  # custom_data         = filebase64("scripts/apache-install.sh")
  network_interface_ids = [
    var.network_interface_id,
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  // Need to take offer, and sku from azure website else it will not work
  source_image_reference {
    publisher = var.source_image_publisher
    offer     = var.source_image_offer
    sku       = var.source_image_sku
    version   = "latest"
  }
}

resource "azurerm_network_interface_security_group_association" "network_interface_security_group_association" {
  network_interface_id      = var.network_interface_id
  network_security_group_id = var.network_security_group_id
}