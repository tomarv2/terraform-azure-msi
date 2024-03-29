output "id" {
  description = "The ID of the MSI created"
  value       = module.msi.id
}

output "principal_id" {
  description = "The ID of the Principal (User, Group or Service Principal) to assign the Role Definition"
  value       = module.msi.principal_id
}
