provider "tfe" {
  token = "<TFE-TOKEN-HERE>"
}

resource "tfe_variable_set" "example" {
  name         = "example-variable-set"
  organization = "<TFE-ORGANIZATION-HERE>"
  global       = false
}

module "tfe_project" {
  source = "../../"

  organization = "<TFE-ORGANIZATION-HERE>"
  name         = "Example Project"

  variable_sets = [
    {
      name = "Var-Set-Example-1"
      variables = [
        {
          key   = "terraform-variable"
          value = "value-of-terraform-variable"
        },
        {
          key      = "ENV_VARIABLE"
          value    = "value-of-env-variable"
          category = "env"
        }
      ]
    },
    {
      name = "Var-Set-Example-2"
      variables = [
        {
          key   = "terraform-variable"
          value = "value-of-terraform-variable"
        },
        {
          key      = "ENV_VARIABLE"
          value    = "value-of-env-variable"
          category = "env"
        }
      ]
    }
  ]

  additional_variable_sets = {
    example = tfe_variable_set.example.id
  }
}
