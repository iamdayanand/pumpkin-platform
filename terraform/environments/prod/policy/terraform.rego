package terraform.security

deny contains msg if {
  resource := input.resource_changes[_]
  resource.type == "azurerm_public_ip"
  msg := sprintf("Public IP is not allowed: %v", [resource.name])
}

# Enforce required tag
deny contains msg if {
  resource := input.resource_changes[_]
  not resource.change.after.tags.environment
  msg := sprintf("Missing required tag 'environment' for resource: %v", [resource.name])
}