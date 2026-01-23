# n8n on Local Kubernetes (Docker Desktop)

This project provides a lightweight Kubernetes manifest to run **n8n** locally using **Docker Desktop**. It includes persistent storage to ensure your workflows and credentials survive pod restarts.

## 🚀 Getting Started

### Prerequisites

* **Docker Desktop** installed.
* **Kubernetes** enabled in Docker Desktop settings.
* `kubectl` command-line tool installed.

### Installation

1. **Clone the repository:**
```bash
git clone https://github.com/your-username/n8n-kubernetes-local.git
cd n8n-kubernetes-local

```


2. **Deploy to Kubernetes:**
Apply the manifest file to create the namespace, storage, and deployment:
```bash
kubectl apply -f n8n-local.yaml

```


3. **Access the App:**
Once the pod is running, access n8n at:
👉 **[http://localhost:30001](https://www.google.com/search?q=http://localhost:30001)**

---

## 🛠 Management Commands

### Stop n8n (Pause)

To free up system resources without deleting your configuration:

```bash
kubectl scale deployment n8n --replicas=0 -n n8n

```

### Start n8n (Resume)

To bring n8n back online:

```bash
kubectl scale deployment n8n --replicas=1 -n n8n

```

### Check Status

```bash
kubectl get pods -n n8n

```

### View Logs

If you need to troubleshoot:

```bash
kubectl logs -f deployment/n8n -n n8n

```

---

## 📂 Project Structure

* `n8n-local.yaml`: The unified Kubernetes manifest containing:
* **Namespace**: `n8n` (keeps things organized).
* **PersistentVolumeClaim**: Local storage for the SQLite database and settings.
* **Deployment**: The n8n container logic.
* **Service**: A NodePort service to expose the UI on port `30001`.



## ⚠️ Notes

* **Data Persistence**: Data is stored in a local volume managed by Docker Desktop. Do not delete the `PersistentVolumeClaim` unless you want to wipe your workflows.
* **Auto-Start**: If Docker Desktop is running, Kubernetes will attempt to restart the n8n pod automatically upon system login unless scaled to 0.

---