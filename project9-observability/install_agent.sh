#!/bin/bash
# Download and Install the Agent for Mumbai (ap-south-1)
sudo yum update -y
sudo wget https://s3.ap-south-1.amazonaws.com/amazoncloudwatch-agent-ap-south-1/amazon_linux/amd64/latest/amazon-cloudwatch-agent.rpm
sudo rpm -U ./amazon-cloudwatch-agent.rpm

# Move your config file (assuming it's uploaded to the server)
# sudo mv /tmp/amazon-cloudwatch-agent.json /opt/aws/amazon-cloudwatch-agent/bin/config.json

# Start the agent
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
-a fetch-config -m ec2 -s -c file:/opt/aws/amazon-cloudwatch-agent/bin/config.json