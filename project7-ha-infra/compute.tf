# Load Balancer Target Group
resource "aws_lb_target_group" "tg" {
  name     = "web-targets"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

# The Load Balancer itself
resource "aws_lb" "alb" {
  name               = "web-alb"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [aws_subnet.public_1.id, aws_subnet.public_2.id]
}

# Listener to redirect traffic to the targets
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

# Automatically find the latest Amazon Linux 2023 AMI in Mumbai
data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

# Launch Template (EC2 Blueprint)
resource "aws_launch_template" "web" {
  name_prefix   = "web-server-"
  image_id      = data.aws_ami.latest_amazon_linux.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>Healthy from $(hostname) in Mumbai</h1>" > /var/www/html/index.html
  EOF
  )
}

# Auto Scaling Group (Creates 2 instances)
resource "aws_autoscaling_group" "asg" {
  desired_capacity    = 2
  max_size            = 3
  min_size            = 2
  target_group_arns   = [aws_lb_target_group.tg.arn]
  vpc_zone_identifier = [aws_subnet.public_1.id, aws_subnet.public_2.id]

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }
}

# Output the DNS URL
output "website_url" {
  value = aws_lb.alb.dns_name
}