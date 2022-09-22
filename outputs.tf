output "name" {
  description = "The name of the MSI created"
  value       = [for msi in azurerm_user_assigned_identity.identity : msi.name]
}

output "id" {
  description = "The ID of the MSI created"
  value       = [for msi in azurerm_user_assigned_identity.identity : msi.id]
}

output "principal_id" {
  description = "The ID of the Principal (User, Group or Service Principal) to assign the Role Definition"
  value       = [for msi in azurerm_user_assigned_identity.identity : msi.principal_id]
}

output "client_id" {
  description = "Client ID associated with the user assigned identity"
  value       = [for msi in azurerm_user_assigned_identity.identity : msi.client_id]
}

output "tenant_id" {
  description = "Tenant ID associated with the user assigned identity."
  value       = [for msi in azurerm_user_assigned_identity.identity : msi.tenant_id]
}
