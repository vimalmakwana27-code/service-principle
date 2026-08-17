variable "rg_names" {}
resource "azurerm_resource_group" "rgs" {
  for_each = var.rg_names
  name     = each.value.name
  location = each.value.location

}

variable "vnet_names" {}
resource "azurerm_virtual_network" "vnets" {
  depends_on          = [azurerm_resource_group.rgs]
  for_each            = var.vnet_names
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
}
variable "sub_names" {}
resource "azurerm_subnet" "subnets" {
  depends_on           = [azurerm_virtual_network.vnets]
  for_each             = var.sub_names
  name                 = each.value.name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
  address_prefixes     = each.value.address_prefixes

}