# Terraform Harness Demo

This project demonstrates how to manage [Harness](https://harness.io/) platform resources and pipelines using [Terraform](https://www.terraform.io/).

## Project Structure

- `modules/roles/variables.tf`: Module inputs for managing roles, user groups, organizations, and projects within Harness.
- `terraform.tfstate` / `terraform.tfstate.backup`: Terraform state files (should not be versioned, see `.gitignore`).
- `.gitignore`: Ensures sensitive/state files are not committed to git.

## What Does This Do?

- Provisions and manages a demo Harness pipeline with the following properties:
  - **Organization:** `default`
  - **Project:** `scratch_project`
  - **Pipeline:** `Demo Pipeline` with a single stage executing a simple shell script.

The core pipeline, as specified in state, runs:

```bash
echo "Hello World!"
echo "Running from Harness"
```

## Getting Started

### Prerequisites

- Install [Terraform](https://www.terraform.io/downloads.html)
- An account and API key for [Harness](https://harness.io/)

### Setup Steps

1. **Clone this repository**

    ```bash
    git clone <repo-url>
    cd <repo-directory>
    ```

2. **Configure your Harness provider credentials**

    Fill in your `terraform.tfvars` or setup environment variables as required by [Harness Terraform Provider](https://registry.terraform.io/providers/harness/harness/latest/docs).

3. **Initialize Terraform**

    ```bash
    terraform init
    ```

4. **Plan and Apply**

    ```bash
    terraform plan
    terraform apply
    ```

    This will create or update the pipeline and relevant resources on Harness.

## Customization

You can edit the variables in `modules/roles/variables.tf` to control:

- `role_id`
- `user_group_id`
- `org_id`
- `project_id`

Modify them as needed for your use-case.

## Cleaning Up

To destroy all managed Harness resources:

```bash
terraform destroy
```

## Notes

- The pipeline YAML and resource states are managed via Terraform. Do not manually edit pipelines in Harness that are managed by Terraform.
- `.tfstate` and backup files are git-ignored to avoid sensitive state in source control.

## References

- [Harness Terraform Provider Docs](https://registry.terraform.io/providers/harness/harness/latest/docs)
- [Terraform Documentation](https://www.terraform.io/docs/)