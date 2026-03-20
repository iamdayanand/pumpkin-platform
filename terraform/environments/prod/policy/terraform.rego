package terraform.security

deny[msg] {
  resource := input.resource_changes[_]
  resource.type == "azurerm_public_ip"
  msg := sprintf("Public IP is not allowed: %v", [resource.name])
}