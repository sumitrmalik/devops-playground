# The main purpose of this file is to define modules.
# A module is a container for multiple resources that are used together.

# Module for creating an S3 bucket
# This module is sourced from the official Terraform registry
module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "5.3.1"
  bucket  = var.bucketName
}

# Module for creating an IAM user
# This module is also sourced from the official Terraform registry
module "iam_user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "5.60.0"
  name    = "testuser-sumit"
}