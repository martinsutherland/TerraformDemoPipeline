provider "azurerm" {
    features {}
}

variable "username" {
  type        = string
  description = "username"
}
variable "password" {
  type        = string
  description = "password"
}

# Create a resource group
resource "azurerm_resource_group" "resource_group" {
  name = "rg-terraform-2023"
  location = "uksouth"
}

resource "azurerm_container_registry" "acr" {
  name                = "terraformcontainer2023"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  sku                 = "Standard"
  admin_enabled       = true


}