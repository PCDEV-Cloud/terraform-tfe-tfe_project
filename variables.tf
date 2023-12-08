variable "organization" {
  type        = string
  description = "The name of the Terraform Cloud/Enterprise organization."
}

variable "name" {
  type        = string
  description = "Name of the project."
}

variable "variable_sets" {
  type = list(object({
    name        = string
    description = optional(string, null)
    priority    = optional(bool, false)

    variables = list(object({
      key         = string
      value       = any
      category    = optional(string, "terraform") # terraform, env
      hcl         = optional(bool, false)
      sensitive   = optional(bool, false)
      description = optional(string, null)
    }))
  }))
  default     = []
  description = "A list of variable sets with variables to be created and applied to the project."
}

variable "additional_variable_sets" {
  type        = map(string)
  default     = {}
  description = "A key/value map with identifiers of the variable sets to be applied to the project. The variable set's scope cannot be 'global'."
}
