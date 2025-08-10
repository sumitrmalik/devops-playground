# Terraform AWS Infrastructure

This project uses **Terraform** to deploy a foundational AWS infrastructure, including a custom VPC, EC2 instances, an S3 bucket, and an IAM user. The code is organized into separate files for clarity and maintainability.

-----

## Project Overview

The primary goal of this project is to provision a basic, working environment on AWS that can serve as a starting point for more complex applications. Key resources provisioned include:

  * **VPC & Networking**: A custom VPC with a public subnet, an Internet Gateway, and a route table.
  * **EC2 Instances**: Two EC2 instances launched into the public subnet. The AMI is dynamically selected.
  * **S3 Bucket**: A simple S3 bucket created using an official Terraform module.
  * **IAM User**: An IAM user for programmatic access, also created with an official module.

-----

## File Structure

The project is organized into several Terraform files, each with a specific purpose.

  * `provider.tf`

      * Defines the **Terraform** and **AWS provider** versions.
      * Configures the AWS region and profile to use for deployment.

  * `vpc.tf`

      * Defines the core networking components.
      * Creates the VPC (`aws_vpc`), a public subnet (`aws_subnet`), an Internet Gateway (`aws_internet_gateway`), a route table (`aws_route_table`), and the association between the subnet and the route table.

  * `ec2.tf`

      * Defines the **EC2 instances** (`aws_instance`) to be launched.
      * Creates an SSH key pair (`aws_key_pair`) for access.
      * Defines a security group (`aws_security_group`) to control inbound and outbound traffic.

  * `data-sources.tf`

      * Uses a `data` block to dynamically look up the **most recent Amazon Linux 2023 AMI**. This ensures the instances are always launched with an up-to-date image.

  * `gfg.tf`

      * This file uses **modules** from the Terraform Registry.
      * It creates a private S3 bucket and an IAM user.

  * `var.tf`

      * Contains all of the project's variables.
      * Using this file, you can easily customize resource names, instance types, and other parameters without changing the main configuration files.

  * `output.tf`

      * Defines the values that will be displayed in the terminal after a successful `terraform apply`.
      * It outputs the public IP address of the first EC2 instance, the S3 bucket ID, and the AMI ID used.

-----

## How to Use

Follow these steps to deploy and manage the infrastructure using the Terraform CLI.

1.  **Initialize Terraform**

    ```sh
    terraform init
    ```

    This command downloads the necessary provider plugins and modules.

2.  **Review the Plan**

    ```sh
    terraform plan
    ```

    This command creates an execution plan, showing you exactly which resources will be created, modified, or destroyed. Always review the plan before applying.

3.  **Apply the Configuration**

    ```sh
    terraform apply
    ```

    This command applies the changes required to reach the desired state of the configuration. You will be prompted to confirm before any changes are made.

4.  **Destroy Resources**

    ```sh
    terraform destroy
    ```

    ⚠️ **Warning**: This command will permanently delete all resources managed by this configuration. Use with caution.