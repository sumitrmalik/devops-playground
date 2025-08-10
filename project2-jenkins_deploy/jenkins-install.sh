#!/bin/bash

# Update all installed packages to their latest versions.
sudo yum update -y

# Install Docker. Jenkins will be run as a Docker container.
sudo yum install docker -y

# Start the Docker service.
sudo systemctl start docker

# Add the current user (ec2-user) to the 'docker' group.
# This allows the user to run Docker commands without using 'sudo'.
# Note: The user may need to log out and log back in for this change to take effect.
sudo usermod -aG docker ec2-user

# Run the Jenkins container in detached mode (-d).
sudo docker run -d \
  -v jenkins_home:/var/jenkins_home \
  -p 8080:8080 \
  -p 50000:50000 \
  --restart=on-failure \
  --name jenkins-server \
  jenkins/jenkins:lts-jdk17
