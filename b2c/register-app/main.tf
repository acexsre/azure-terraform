terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.15.0"
    }
  }
}

# Configure the Azure Active Directory Provider
provider "azuread" {
  tenant_id = "c6b0393e-c26a-49b2-8e72-06c0b0c263fb"
}

# Retrieve domain information
data "azuread_domains" "example" {
  only_initial = true
}

# https://marketplace.visualstudio.com/items?itemName=stephane-eyskens.aadv1appprovisioning << place 
# https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application#example-usage