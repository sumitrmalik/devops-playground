# This file defines the outputs of the Terraform configuration.
# Outputs are used to export values from your infrastructure,
# such as IP addresses, IDs, and other resource attributes.

# Output the public IP of the first EC2 instance
output "ec2_public_ip" {
  description = "The public IP address of the first EC2 instance"
  value       = aws_instance.web[0].public_ip
}

# Output the ID of the S3 bucket
output "s3_bucket_id" {
  description = "The ID of the S3 bucket created by the module"
  value       = module.s3-bucket.s3_bucket_id
}

# Output the ID of the AMI used for the EC2 instance
output "ami_id" {
  description = "The ID of the Amazon Machine Image used for the EC2 instances"
  value       = data.aws_ami.amiIDname.id
}