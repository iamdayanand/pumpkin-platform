terraform {
  required_version = ">= 1.5.0"

  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "pumpkinterraformstate"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}