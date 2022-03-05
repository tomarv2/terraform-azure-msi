module "msi" {
  source = "../"

  rg_name = "demo-rg"

  # ------------------------------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
