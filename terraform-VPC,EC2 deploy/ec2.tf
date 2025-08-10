resource "aws_instance" "web" {
  ami           = var.amiID
  instance_type = var.instanceType
  key_name = aws_key_pair.gfgkey.key_name
  subnet_id = aws_subnet.mysubnet.id

  tags = {
    Name = "HelloWorld"
  }
  vpc_security_group_ids = [aws_security_group.mysg.id]
  count = 2
}

resource "aws_key_pair" "gfgkey" {
  key_name   = "gfgkeydevops"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
}

resource "aws_security_group" "mysg" {
  vpc_id = aws_vpc.myvpc.id
  name = "mysg"
  dynamic ingress {
    for_each = var.allowPorts
    content {
        from_port      = ingress.value
        to_port        = ingress.value
        protocol       = "tcp"
        cidr_blocks    = ["0.0.0.0/0"]
    }
  }
  egress {    
    from_port      = 0
    to_port        = 0
    protocol       = "-1"
    cidr_blocks    = ["0.0.0.0/0"]
  }
}