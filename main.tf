terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.43.0"
    }
  }
  cloud {

    organization = "VDoddamani"

    workspaces {
      name = "Hands-on_with_Terraform_On_Azure"
    }
  }
}

provider "azurerm" {
  features {

  }
  subscription_id = "28e1e42a-4438-4c30-9a5f-7d7b488fd883"
  resource_provider_registrations = "none"
}

resource "azurerm_resource_group" "rg" {
  name     = "813-552e5416-hands-on-with-terraform-on-azure"
  location = "East US"
}

module "securestorage" {
  source  = "app.terraform.io/VDoddamani/securestorage/azurerm"
  version = "1.0.0"
  # insert required variables here
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "handsontfstorage"
}
