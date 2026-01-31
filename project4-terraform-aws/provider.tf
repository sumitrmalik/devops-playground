# Define the required Terraform and provider versions
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS provider
provider "aws" {
  region  = "ap-south-1"
  profile = "default"
  # Other configuration options can be added here
}