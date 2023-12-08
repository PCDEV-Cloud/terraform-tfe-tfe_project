output "project_id" {
  value = module.tfe_project.id
}

output "name" {
  value = module.tfe_project.name
}

output "variable_sets" {
  value = module.tfe_project.variable_sets
}

output "project_variable_sets" {
  value = module.tfe_project.project_variable_sets
}
