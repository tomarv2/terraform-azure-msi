resource "azurerm_user_assigned_identity" "identity" {
  count = var.add_msi ? 1 : 0

  resource_group_name = var.resource_group_name
  location            = var.location
  name                = "${var.teamid}-${var.prjid}-identity"

  tags = merge(local.shared_tags, var.extra_tags)
}
