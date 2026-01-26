## Example Voting App (Kubernetes Version)

This project contains a multi-tier microservices application designed to run on a Kubernetes cluster. It consists of a voting interface, a message broker, a background worker, a database, and a results dashboard.

---

### ## Project Architecture

The application is composed of the following five components:

* **Vote**: A front-end web app in Python which lets you vote between two options.
* **Redis**: A temporary storage (message queue) that collects new votes.
* **Worker**: A .NET worker which consumes votes from Redis and stores them in a Postgres database.
* **DB**: A PostgreSQL database backed by a Docker volume to store vote data.
* **Result**: A Node.js web app which shows the results of the voting in real-time.

---

### ## Deployment Configuration

The following table summarizes the networking and service configuration for each component:

| Component | Service Type | Internal Port | External (NodePort) |
| --- | --- | --- | --- |
| **Vote** | `NodePort` | 8080 | 31000 |
| **Result** | `NodePort` | 8081 | 31001 |
| **Redis** | `ClusterIP` | 6379 | N/A |
| **Postgres** | `ClusterIP` | 5432 | N/A |

---

### ## How to Run

1. **Apply the configurations**:
Ensure you have `kubectl` configured and run the following command in your terminal:
```bash
kubectl apply -f .

```


2. **Access the Applications**:
* **Voting App**: Open your browser and go to `http://localhost:31000`.
* **Results App**: Open your browser and go to `http://localhost:31001`.



> **Note for Docker Desktop users**: While the node's internal IP may show as `192.168.x.x`, the NodePorts are mapped directly to your **localhost**.

---

### ## Resource Details

* **Database**: Uses `postgres:15-alpine` with an `emptyDir` volume for storage.
* **Redis**: Uses `redis:alpine` for a lightweight footprint.
* **Scaling**: All deployments are currently set to a default of `1` replica.

---