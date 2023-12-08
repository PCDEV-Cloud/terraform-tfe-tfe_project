data "tfe_organization" "this" {
  name = var.organization
}

resource "tfe_project" "this" {
  organization = data.tfe_organization.this.name
  name         = var.name
}

################################################################################
# Variable Sets & Variables
################################################################################

locals {
  variable_sets = { for i in var.variable_sets : i.name => i }
}

resource "tfe_variable_set" "this" {
  for_each = local.variable_sets

  name         = each.value["name"]
  description  = each.value["description"]
  priority     = each.value["priority"]
  organization = data.tfe_organization.this.name
  global       = false
}

locals {
  variable_set_vars_list = flatten([for i in local.variable_sets : [for j in i.variables : merge(j, { variable_set_name = i.name })]])
  variable_set_vars      = { for i in local.variable_set_vars_list : "${i.variable_set_name}/${i.key}" => i }
}

resource "tfe_variable" "this" {
  for_each = local.variable_set_vars

  variable_set_id = tfe_variable_set.this[each.value["variable_set_name"]].id
  key             = each.value["key"]
  value           = each.value["value"]
  category        = each.value["category"]
  hcl             = each.value["hcl"]
  sensitive       = each.value["sensitive"]
  description     = each.value["description"]
}

resource "tfe_project_variable_set" "this" {
  for_each = local.variable_sets

  variable_set_id = tfe_variable_set.this[each.key].id
  project_id      = tfe_project.this.id
}

resource "tfe_project_variable_set" "additional" {
  for_each = var.additional_variable_sets

  variable_set_id = each.value
  project_id      = tfe_project.this.id
}
