variable "teamid" {
  description = "Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
}

variable "prjid" {
  description = "Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
}

variable "rg_name" {}



variable "add_msi" {
  description = "Do you want to add MSI(Note: this is a feature flag)"
  default     = false
}

variable "msi_depends_on" {
  default = null
}

variable "msi_location" {
  default = "eastus"
}
