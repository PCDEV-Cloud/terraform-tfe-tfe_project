data "tfe_organization" "this" {
  name = var.organization
}

resource "tfe_project" "this" {
  organization = data.tfe_organization.this.name
  name         = var.name
}