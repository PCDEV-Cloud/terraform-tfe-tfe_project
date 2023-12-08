output "id" {
  value       = tfe_project.this.id
  description = "The project ID."
}

output "name" {
  value       = tfe_project.this.name
  description = "Name of the project."
}

output "variable_sets" {
  value       = [for i in tfe_variable_set.this : i]
  description = "A list of variable sets with variables created by the module."
}

output "project_variable_sets" {
  value       = concat([for i in tfe_project_variable_set.this : i], [for i in tfe_project_variable_set.additional : i])
  description = "A list of variable sets applied to the project."
}
