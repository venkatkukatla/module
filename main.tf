provider "azurerm" {
  features {}

  client_id       = "25217e30-f125-45d4-b0d7-07209690eec2"
  client_secret   = "Jgc8Q~HB2lZTSNkIVdjTYKOcfgPXsYNID7N5_cWf"
  tenant_id       = "db397e3a-7e55-4d5d-be3f-184eec4b876a"
  subscription_id = "e65c6cc1-0337-499f-a9be-33c5335dc0a3"
}

resource "azurerm_resource_group" "rg" {
  name     = var.azurerm_resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.azurerm_virtual_network_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.azurerm_resource_group_name
  depends_on = [azurerm_resource_group.rg]
}

resource "azurerm_subnet" "subnet01" {
  name                 = var.azurerm_subnet01
  resource_group_name  = var.azurerm_resource_group_name
  virtual_network_name = var.azurerm_virtual_network_name
  address_prefixes     = var.address_prefixes01 
  depends_on = [azurerm_virtual_network.vnet]
}

resource "azurerm_subnet" "subnet02" {
  name                 = var.azurerm_subnet02
  resource_group_name  = var.azurerm_resource_group_name
  virtual_network_name = var.azurerm_virtual_network_name
  address_prefixes     = var.address_prefixes02 
  depends_on = [azurerm_virtual_network.vnet]
}

resource "azurerm_subnet" "subnet03" {
  name                 = var.azurerm_subnet03
  resource_group_name  = var.azurerm_resource_group_name
  virtual_network_name = var.azurerm_virtual_network_name
  address_prefixes     = var.address_prefixes03 
  depends_on = [azurerm_virtual_network.vnet]
}
