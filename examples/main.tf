module "msi" {
  source = "../"

  add_msi         = true
  rg_name         = "demo-rg"
  email           = 'demo@demo.com'
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  # ------------------------------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
