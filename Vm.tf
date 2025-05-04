resource "azurerm_network_interface" "demo_nic" {
  name                = "${var.prefix}-nic"
  location            = azurerm_resource_group.demo_rg.location
  resource_group_name = azurerm_resource_group.demo_rg.name

  ip_configuration {
    name                          = "democonfiguration1"
    subnet_id                     = azurerm_subnet.demo_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "demo_vm" {
  name                  = "${var.prefix}-vm"
  location              = azurerm_resource_group.demo_rg.location
  resource_group_name   = azurerm_resource_group.demo_rg.name
  network_interface_ids = [azurerm_network_interface.demo_nic.id]
  admin_username = "adminuser"
  size               = "Standard_B1s"

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("./id_rsa.pub")
  }
  
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}