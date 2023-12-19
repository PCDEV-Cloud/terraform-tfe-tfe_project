variable "organization" {
  type        = string
  description = "The name of the Terraform Cloud/Enterprise organization."
}

variable "name" {
  type        = string
  description = "Name of the project."

  validation {
    condition     = can(regex("^[a-zA-Z][a-zA-Z0-9_-]+[a-zA-Z0-9]$", var.name))
    error_message = "Name can only contain letters, numbers, hyphens (-) and underscores (_). Must start with a letter and end with a letter or number."
  }

  validation {
    condition     = !can(regex("^.*--.*$", var.name))
    error_message = "Hyphens cannot appear next to each other in a project name."
  }

  validation {
    condition     = !can(regex("^.*__.*$", var.name))
    error_message = "Underscores cannot appear next to each other in a project name."
  }

  validation {
    condition     = length(var.name) >= 3 && length(var.name) <= 36
    error_message = "Name must be 3 to 30 characters in length."
  }
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
