module "msi" {
  source = "../.."

  add_msi                                 = var.add_msi

  rg_name                                 = var.rg_name

  email                                   = var.email
  prjid                                   = var.prjid
  teamid                                  = var.teamid

  client_id                               = var.client_id
  client_secret                           = var.client_secret
  subscription_id                         = var.subscription_id
  tenant_id                               = var.tenant_id
}
