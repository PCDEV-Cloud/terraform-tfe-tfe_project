# Terraform Cloud/Enterprise Project module

## Features
1. Create a Terraform Cloud/Enterprise project.

## Usage

```hcl
module "tfe_project" {
  source = "github.com/PCDEV-Cloud/terraform-tfe-tfe_project"

  organization = "my-organization"
  name         = "example-project"
}
```