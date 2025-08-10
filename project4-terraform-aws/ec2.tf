# Define an AWS EC2 instance

resource "aws_instance" "web" {
  ami           = data.aws_ami.amiIDname.id   # Uses a data source to find the AMI [cite: 8]
  instance_type = var.instanceType            # Instance type is defined in var.tf [cite: 8]
  key_name      = aws_key_pair.mynewkey.key_name
  subnet_id     = aws_subnet.mysubnet.id
  count         = 2                           # The count parameter creates two instances

  vpc_security_group_ids = [aws_security_group.mysg.id]

  tags = {
    Name = "HelloWorld"
  }
}

# Create an SSH key pair
# The public key is hardcoded here for simplicity, but in a real-world scenario, you would use a file() function
resource "aws_key_pair" "mynewkey" {
  key_name   = "mynewkeydevops"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
}

# Define a security group
# The dynamic block creates ingress rules for each port in the 'allowPorts' variable
resource "aws_security_group" "mysg" {
  name   = "mysg"
  vpc_id = aws_vpc.myvpc.id

  dynamic "ingress" {
    for_each = var.allowPorts
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allows all outbound traffic [cite: 10]
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# A simple null resource that forces a re-run every time the file is changed
resource "null_resource" "my-null-resource" {
  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command = "echo Hi"
  }
}