# WordPress Deployment with Docker Compose

This project uses Docker Compose to set up a complete WordPress development environment with a single command. It includes two containers: one for the WordPress application and another for the MySQL database.

The entire setup is managed by the `docker-compose.yml` file, which defines the services, networks, and persistent volumes needed to run WordPress.

### Project Contents

  * **`docker-compose.yml`**: The main configuration file for Docker Compose. It defines and links the WordPress and MySQL services.

### Prerequisites

To run this project, you must have **Docker** and **Docker Compose** installed on your system.

  * [Install Docker](https://docs.docker.com/get-docker/)

  * Docker Compose is typically installed automatically with Docker Desktop, but you can check the [official documentation](https://docs.docker.com/compose/install/) if needed.

### Usage

Follow these simple steps to get your WordPress site up and running.

1.  **Navigate to the project directory**
    Open your terminal and go to the `project1-wordpress-deploy` directory.

    ```bash
    cd project1-wordpress-deploy
    ```

2.  **Start the services**
    Run the following command to start both the WordPress and database containers in the background (`-d` for detached mode).

    ```bash
    docker-compose up -d
    ```

    This command will download the necessary Docker images and create the containers, networks, and volumes.

3.  **Access your WordPress site**
    Once the containers are running, open your web browser and navigate to:

    ```
    http://localhost:8080
    ```

    You will see the standard WordPress installation page. Follow the on-screen instructions to complete the setup.

4.  **Stop and remove the services**
    To stop the containers and remove the network, run the following command in the same directory:

    ```bash
    docker-compose down
    ```

    This will stop the containers but preserve your data in the named volumes (`wordpress` and `db`), so your site will be in the same state if you start it again.