resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group
  dns_prefix          = "pumpkin"

  private_cluster_enabled = true

  tags = var.tags

default_node_pool {
  name       = "default"
  node_count = 1
  vm_size    = "Standard_D2s_v3"
}

  identity {
    type = "SystemAssigned"
  }

}