#!/bin/bash

sudo yum update -y
sudo yum install docker -y
sudo systemctl start docker
sudo usermod -aG docker ec2-user

sudo docker run -d \
  -v jenkins_home:/var/jenkins_home \
  -p 8080:8080 \
  -p 50000:50000 \
  --restart=on-failure \
  --name jenkins-server \
  jenkins/jenkins:lts-jdk17

echo "Docker and Jenkins container setup initiated."
echo "Remember to configure your EC2 Security Group to allow inbound traffic on port 8080 (and 50000 if using agents)."
echo "You may need to log out and log back in for 'docker' commands to work without 'sudo'."
echo "Access Jenkins at http://YOUR_EC2_PUBLIC_IP:8080"