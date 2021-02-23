output "msi_id" {
  description = "The ID of the MSI created."
  value = module.msi.*.msi_id
}
