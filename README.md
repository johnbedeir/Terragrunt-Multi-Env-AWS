# Terragrunt Multi-Env Infrastructure

<img src=cover.png>

This project is a Terragrunt-based infrastructure deployment setup for two environments: **dev** and **prod**. It uses Terragrunt to manage and apply reusable Terraform modules for building resources such as EC2 instances, S3 buckets, and VPCs in AWS.

## Project Structure

- `environments/`: Contains the environment-specific Terragrunt configurations for **dev** and **prod** environments.
  - `dev/`: Contains the `terragrunt.hcl` file for the dev environment.
  - `prod/`: Contains the `terragrunt.hcl` file for the prod environment.
- `modules/`: Contains the reusable Terraform modules for resources such as EC2 instances, VPC, and S3.
  - `ec2.tf`: EC2 instance configuration.
  - `s3.tf`: S3 bucket configuration.
  - `vpc.tf`: VPC configuration.
  - `provider.tf`: AWS provider configuration.
  - `variables.tf`: Input variables used across modules.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed.
- [Terragrunt](https://terragrunt.gruntwork.io/) installed.
- AWS CLI configured with proper access to the required accounts and regions.

## Commands

To deploy the infrastructure for both **dev** and **prod** environments, navigate to the `environments` directory and run the following commands:

### 1. Initialize the Terraform backend

```bash
cd environment
terragrunt run-all init --reconfigure
```

This command initializes the backend configuration for all modules in both the **dev** and **prod** environments.

### 2. Upgrade the Terraform providers and modules

```bash
terragrunt run-all init --upgrade
```

This command upgrades the Terraform providers and modules to the latest versions in both environments.

### 3. Plan the infrastructure changes

```bash
terragrunt run-all plan
```

This command generates an execution plan for both the **dev** and **prod** environments, showing what changes will be made to your infrastructure.

### 4. Apply the infrastructure changes

```bash
terragrunt run-all apply
```

This command applies the infrastructure changes in both environments, provisioning the necessary resources such as EC2 instances, S3 buckets, and VPCs.

## Notes

- Each environment (dev/prod) has its own `terragrunt.hcl` file, which points to the shared Terraform modules located in the `modules/` directory.
- Changes applied will be specific to the environment (either dev or prod), but running `terragrunt run-all` ensures that both environments are handled simultaneously.

---
