terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.0.0"
    }
  }
}
provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "rgs" {
  name     = "rg-1"
  location = "centralus"

}

resource "azurerm_virtual_network" "vnets" {
  name                = "vnet-1"
  location            = azurerm_resource_group.rgs.location
  resource_group_name = azurerm_resource_group.rgs.name
  address_space       = ["10.0.0.0/16"]

}

resource "azurerm_subnet" "snets" {
  name                 = "snte-1"
  resource_group_name  = azurerm_resource_group.rgs.name
  virtual_network_name = azurerm_virtual_network.vnets.name
  address_prefixes     = ["10.0.1.0/24"]

}

resource "azurerm_storage_account" "storage" {
  name                     = "storage623456"
  location                 = "centralus"
  resource_group_name      = azurerm_resource_group.rgs.name
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

resource "azurerm_network_interface" "nics" {
  name                = "nic-1"
  location            = azurerm_resource_group.rgs.location
  resource_group_name = azurerm_resource_group.rgs.name

  ip_configuration {
    name                          = "ip-1"
    subnet_id                     = azurerm_subnet.snets.id
    private_ip_address_allocation = "Dynamic"

  }

}
