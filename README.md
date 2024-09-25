# Terragrunt Multi-Env Infrastructure

<img src=imgs/cover.png>

This project establishes a comprehensive infrastructure using Terragrunt to manage reusable Terraform modules across two environments: **dev** and **prod**. The setup includes deploying critical AWS resources and services to ensure high availability, scalability, and monitoring.

### Key Resources:

- **EKS Clusters**: Kubernetes clusters for container orchestration and management.
- **RDS Instances**: Managed relational databases tailored for each environment.
- **VPCs & Subnets**: Custom Virtual Private Clouds with public and private subnets for network isolation.
- **Security Groups**: Network security configurations for controlling traffic.
- **Monitoring Stack**: Integration of **Prometheus**, **Alert Manager**, and **Grafana** for observability, alerting, and monitoring.
- **ArgoCD**: Continuous Delivery solution for automated Kubernetes deployments in both environments.

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

<img src=imgs/plan.png>

This command generates an execution plan for both the **dev** and **prod** environments, showing what changes will be made to your infrastructure.

### 4. Apply the infrastructure changes

```bash
terragrunt run-all apply
```

This command applies the infrastructure changes in both environments, provisioning the necessary resources such as EC2 instances, S3 buckets, and VPCs.

### Switching Between Environments

To switch between the **dev** and **prod** EKS clusters, run the following commands:

- For **dev** cluster:

  ```bash
  aws eks update-kubeconfig --name cluster-1-dev --region eu-central-1
  ```

- Using **k9s**

  <img src=imgs/dev.png>

- For **prod** cluster:

  ```bash
  aws eks update-kubeconfig --name cluster-1-prod --region eu-central-1
  ```

- Using **k9s**

  <img src=imgs/prod.png>

These commands update your kubeconfig file, allowing you to interact with the desired Kubernetes cluster.

### Connecting to RDS Databases

To connect to your **dev** or **prod** RDS clusters, follow these steps:

1. **Find the RDS Endpoint**:

   - You can find the RDS endpoint in the **AWS Management Console** by navigating to:
     - **RDS > Databases > [Your RDS Cluster] > Connectivity & Security**.
   - Alternatively, it will be shown in the Terraform outputs, you can retrieve it directly from the output variables.

    <img src=imgs/rds-endpoint.png>

2. **Retrieve RDS Username and Password from Secrets Manager**:

   - The RDS credentials (username and password) are stored in AWS Secrets Manager.
   - Go to **AWS Secrets Manager** and look for the secret named something like `dev-rds-credentials` or `prod-rds-credentials` (depending on your environment).
   - Inside the secret, you’ll find the RDS **username** and **password** for your connection.

    <img src=imgs/sm.png>

3. **Connect to the RDS Instance Using MySQL**:

   - For **dev** environment:

     ```bash
     mysql -h dev-rds-cluster.cluster-cxzadf8nmshb.eu-central-1.rds.amazonaws.com -u <username-from-secret-manager> -P 3306 -p
     ```

     (Replace `<username-from-secret-manager>` with the actual username retrieved from Secrets Manager. You will be prompted to enter the password.)

   - For **prod** environment:
     ```bash
     mysql -h prod-rds-cluster.cluster-cxzadf8nmshb.eu-central-1.rds.amazonaws.com -u <username-from-secret-manager> -P 3306 -p
     ```
     (Replace `<username-from-secret-manager>` with the actual username retrieved from Secrets Manager. You will be prompted to enter the password.)

## Notes

- Each environment (dev/prod) has its own `terragrunt.hcl` file, which points to the shared Terraform modules located in the `modules/` directory.
- Changes applied will be specific to the environment (either dev or prod), but running `terragrunt run-all` ensures that both environments are handled simultaneously.

---
