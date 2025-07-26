# What is Jenkins?

Jenkins is an open-source automation tool written in Java. It is used to automate the CI/CD process.

# Jenkins Installation

    Install Java
    Install Libraries
    Install Jenkins

# Launch EC2 server and install docker on it

# Java Download
https://www.oracle.com/in/java/technologies/downloads/

```Copy
wget https://download.oracle.com/java/24/latest/jdk-24_linux-x64_bin.rpm
```

```Copy
yum install <jdk_package>
```

# Install jenkins
https://github.com/jenkinsci/docker/blob/master/README.md

```Copy
docker run -d -v jenkins_home:/var/jenkins_home -p 8080:8080 -p 50000:50000 --restart=on-failure jenkins/jenkins:lts-jdk17
```

# Now Jenkins is installed and running on port 8080. To access Jenkins, open the following URL in a browser:

```Copy
http://<ec2-instance-public-ip>:8080
```

To get the initial admin password, run the following command:

```Copy
docker exec <jenkins_container_id_or_name> cat /var/jenkins_home/secrets/initialAdminPassword
```
![alt text](285498031-a1074f73-208f-4dca-807c-72fc457942d0.png)

Install the suggested plugins.
![alt text](285498057-1581bdb7-f27b-478a-b621-75f42e399ddf.png)

Create an admin user. 
![alt text](285498082-0d423304-d815-48f2-bc8b-f86fbada4d6f.png)
![alt text](285498116-b953738a-dc3d-4ebb-9e2a-3b262a3e6191.png)

Jenkins is now ready to use. 
![alt text](285498306-be442fdc-7040-43c7-b0d7-c21bf7831d55.png)

