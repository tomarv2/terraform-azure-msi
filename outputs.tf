output "msi_id" {
  description = "The ID of the MSI created"
  value       = azurerm_user_assigned_identity.identity.*.id
}

output "msi_principal_id" {
  description = "The ID of the Principal (User, Group or Service Principal) to assign the Role Definition"
  value       = azurerm_user_assigned_identity.identity.*.principal_id
}

output "msi_name" {
  description = "MSI name"
  value       = azurerm_user_assigned_identity.identity.*.name
}
