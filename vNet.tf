resource "azurerm_resource_group" "demo_rg" {
  name     = "demo-rg"
  location = "East US"
}

resource "azurerm_virtual_network" "demo_vNet" {
  name                = "demo-network"
  resource_group_name = azurerm_resource_group.demo_rg.name
  location            = azurerm_resource_group.demo_rg.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "demo_subnet" {
  name                 = "demo-network"
  resource_group_name  = azurerm_resource_group.demo_rg.name
  virtual_network_name = azurerm_virtual_network.demo_vNet.name
  address_prefixes     = ["10.0.1.0/24"]
}
