# This data source block finds the most recent Amazon Machine Image (AMI).
# It's a best practice to use a data source rather than a hardcoded AMI ID.
data "aws_ami" "amiIDname" {
  most_recent = true

  owners = ["amazon"]

  # Filter to find the correct AMI based on specific criteria
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*x86_64"]
  }
}