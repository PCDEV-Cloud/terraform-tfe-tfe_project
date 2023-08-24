provider "tfe" {
  token = "<TFE_TOKEN_HERE>"
}

module "tfe_project" {
  source = "../../"

  organization = "my-organization"
  name         = "example-project"
}