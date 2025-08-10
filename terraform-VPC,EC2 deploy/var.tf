# This file defines all the variables for the Terraform project.
# Using variables allows you to customize your configuration without
# changing the main code.

# Name for the VPC
variable "vpc_name" {
  type        = string
  default     = "my-vpc"
  description = "Name for the VPC."
}

# The availability zone for the subnet
variable "availability_zone" {
  type        = string
  default     = "ap-south-1a"
  description = "Availability zone for the subnet."
}

# Name for the subnet
variable "Subnet1Name" {
  type        = string
  default     = "my-subnet1"
  description = "Name for the subnet."
}

# Name for the Internet Gateway
variable "InternetGatewayName" {
  type        = string
  default     = "myigw"
  description = "Name for the Internet Gateway."
}

# Instance type for the EC2 instances
variable "instanceType" {
  type        = string
  default     = "t2.micro"
  description = "The EC2 instance type to use."
}

# Determines if a public IP address is assigned on launch
variable "mapIPaddressOnLaunch" {
  type        = bool
  default     = true
  description = "Whether to assign a public IP address on instance launch."
}

# A list of ports to be allowed in the security group
variable "allowPorts" {
  type        = list(number)
  default     = [80, 8080, 90, 82, 9090, 3000, 83, 22, 9000]
  description = "A list of ports to open for inbound traffic in the security group."
}

# Name for the S3 bucket
variable "bucketName" {
  type        = string
  default     = "mys3bucketviaterraform"
  description = "Name for the S3 bucket."
}