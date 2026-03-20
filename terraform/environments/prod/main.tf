
//resource "azurerm_resource_group" "test_rg" {
//  name     = "terraform-demo-rg"
//  location = "West Europe"
//}


resource "azurerm_resource_group" "rg" {

  name     = "pumpkin-prod-rg"
  location = var.location

  tags = var.tags

}

resource "azurerm_public_ip" "example" {
  name = "my-public-ip"
}

module "network" {

  source = "../../modules/network"

  resource_group = azurerm_resource_group.rg.name
  location       = var.location
  vnet_name      = "pumpkin-prod-vnet"

  tags = var.tags

}

module "acr" {

  source = "../../modules/acr"

  resource_group = azurerm_resource_group.rg.name
  location       = var.location
  acr_name       = "pumpkinprodacr"

  tags = var.tags

}

module "aks" {

  source = "../../modules/aks"

  resource_group = azurerm_resource_group.rg.name
  location       = var.location
  cluster_name   = "pumpkin-prod-aks"

  tags = var.tags

}