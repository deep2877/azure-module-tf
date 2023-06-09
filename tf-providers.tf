// Adding Azure Provider Plugin from TF providers
# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
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
  # subscription_id = "2099acaf-d311-4d6c-bb2b-e30b6494919c"
  # tenant_id = "d3660f00-aa42-489d-b0f6-d8cf0af5abdc"
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}