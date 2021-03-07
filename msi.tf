resource "azurerm_user_assigned_identity" "identity" {
  count = var.add_msi ? 1 : 0

  resource_group_name = var.rg_name
  location            = var.msi_location
  name                = "${var.teamid}-${var.prjid}-identity"

  tags = merge(local.shared_tags)

  depends_on = [var.msi_depends_on]
}
