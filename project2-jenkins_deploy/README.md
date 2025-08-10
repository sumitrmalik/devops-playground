# Jenkins CI/CD Project

This repository contains materials for setting up a Jenkins CI/CD environment on an AWS EC2 instance using Docker. The goal is to demonstrate the fundamental concepts of CI/CD and the automation capabilities of Jenkins.

### Files

* `Jenkins.md`: A markdown document explaining the core concepts of CI/CD, the role of Jenkins, and a brief introduction to GitHub Actions as an alternative.
* `jenkins-install.sh`: A shell script to automate the installation of Docker and the deployment of a Jenkins container on a Linux-based system.

### Prerequisites

* An AWS account
* An EC2 instance with SSH access and a public IP address
* Familiarity with the command line

### Usage

1.  **Launch an EC2 Instance**: Use a Linux AMI (e.g., Amazon Linux 2023) and ensure that your security group allows inbound traffic on port `22` (for SSH), `8080` (for the Jenkins UI), and optionally `50000` (for Jenkins agents).
2.  **Copy the `jenkins-install.sh` script to your EC2 instance**.
3.  **Run the script**: Connect to your instance via SSH and execute the script.
    ```bash
    chmod +x jenkins-install.sh
    ./jenkins-install.sh
    ```
4.  **Access Jenkins**: After the script completes, you can access the Jenkins web interface by navigating to `http://YOUR_EC2_PUBLIC_IP:8080` in your browser. Follow the on-screen instructions to unlock and configure Jenkins.

### Important Notes

* For security, it is highly recommended to use a more secure method for SSH access than a hardcoded public key in a production environment.
* The `jenkins-install.sh` script adds the `ec2-user` to the `docker` group. You may need to log out and back in for this change to take effect.