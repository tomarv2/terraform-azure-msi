resource "azurerm_user_assigned_identity" "identity" {
  for_each = var.config

  resource_group_name = each.value.resource_group
  location            = each.value.location
  name                = each.key
  tags                = merge(local.shared_tags, var.extra_tags)
}


