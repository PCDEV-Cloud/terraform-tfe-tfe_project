# Terraform Cloud/Enterprise Project module

## Features
1. Create a Terraform Cloud/Enterprise project.
2. Create variable sets applied to the project along with variables.
3. Apply additional variable sets to the project.

## Usage

```hcl
module "tfe_project" {
  source = "github.com/PCDEV-Cloud/terraform-tfe-tfe_project"

  organization = "my-organization"
  name         = "example-project"
}
```

## Examples

- [complete](https://github.com/PCDEV-Cloud/terraform-tfe-tfe_project/tree/main/examples/complete) - Creates a project with variable sets
