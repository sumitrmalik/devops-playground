# SonarQube with Docker Compose

This project provides a simple and effective way to deploy **SonarQube**, a powerful code quality analysis tool, using Docker Compose. The setup includes both the SonarQube application and its required PostgreSQL database, allowing you to get a fully functional instance running with a single command.

### Project Files

* `SonarQube-DockerCompose.yml`: The Docker Compose file that defines the services for SonarQube and its PostgreSQL database, along with persistent volumes.
* `Sonarqube.md`: A markdown document that explains what SonarQube is, its key features, and step-by-step instructions for running the application.

### Prerequisites

To run this project, you need to have **Docker** and **Docker Compose** installed on your system.

* [Install Docker](https://docs.docker.com/get-docker/)
* Docker Compose is typically bundled with Docker Desktop.

### Usage

1.  **Navigate to the project directory**
    Open your terminal and go to the directory containing the project files.

2.  **Start the services**
    Use the following command to start the containers in detached mode.

    ```bash
    docker-compose -f SonarQube-DockerCompose.yml up -d
    ```

    Alternatively, you can rename `SonarQube-DockerCompose.yml` to `docker-compose.yml` and simply run `docker-compose up -d`.

3.  **Access SonarQube**
    Once the containers are running, you can access the SonarQube web interface in your browser at:

    ```
    http://localhost:9000
    ```

4.  **Log in with default credentials**
    The default credentials for the administrator account are `admin`/`admin`. You will be prompted to change the password upon first login.

### Stopping the Services

To stop and remove the containers, network, and volumes associated with this project, run:

```bash
docker-compose -f SonarQube-DockerCompose.yml down --volumes