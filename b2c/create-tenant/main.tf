terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "b2crg" {
  name     = "b2c-rg"
  location = "East Asia"
}

resource "azurerm_aadb2c_directory" "b2c-tenant" {
  country_code            = "US"
  data_residency_location = "United States"
  display_name            = "gojosdojo-dev-b2c-tenant"
  domain_name             = "gojosdojob2ctenantdev.onmicrosoft.com"
  resource_group_name     = azurerm_resource_group.b2crg.name
  sku_name                = "PremiumP1"
}

output "b2c-tenant_id" {
  value = azurerm_aadb2c_directory.b2c-tenant.tenant_id
}