
# Launch EC2 server and install docker on it

# Install jenkins
https://github.com/jenkinsci/docker/blob/master/README.md

docker run -d -v jenkins_home:/var/jenkins_home -p 8080:8080 -p 50000:50000 --restart=on-failure jenkins/jenkins:lts-jdk17

Directly print the initial admin password using:

docker exec <jenkins_container_id_or_name> cat /var/jenkins_home/secrets/initialAdminPassword


# Java Download
https://www.oracle.com/in/java/technologies/downloads/

wget https://download.oracle.com/java/24/latest/jdk-24_linux-x64_bin.rpm

yum install <jdk_package>

