# Terraform Modules Integration Testing
Terraform configuration for creating and managing Harness users, user groups, and role assignments.

## Summary
These tests create a temporary organization and projects, then exercise the `users`, `user_groups`, and `roles` modules.

## Providers

```
terraform {
  required_providers {
    harness = {
      source  = "harness/harness"
      version = "~> 0.45"
    }
  }
}
```

## Variables

| Name | Description | Type | Default Value | Mandatory |
| --- | --- | --- | --- | --- |
| prefix | Adds a Prefix to the organization name prevent collisions. | string | | X |
| harness_platform_url | [Optional] Enter the Harness Platform URL.  Defaults to Harness SaaS URL | string | https://app.harness.io/gateway | |
| harness_platform_account | [Required] Enter the Harness Platform Account Number | string | | X |
| harness_platform_key | [Required] Enter the Harness Platform API Key for your account | string | | X |
| global_tags | [Optional] Provide a Map of Tags to associate with all organizations and resources create | map | {} | |

## Run

Copy `terraform.tfvars.example` to `terraform.tfvars`, fill in the required values, then:

```bash
terraform init
terraform apply
terraform destroy
```
