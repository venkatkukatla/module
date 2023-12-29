provider "azurerm" {
  features {}

  client_id       = "6033e208-4686-4723-b5d0-5c8b0dcca493"
  client_secret   = "gos8Q~MjjrSA1FUbsPFp5gaDUDV4fqOzKZSYlc46"
  tenant_id       = "7268d215-713e-4297-8e2a-67dae624ebc6"
  subscription_id = "2f61b9e9-e380-4ba3-a68e-10a4f0718bce"
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