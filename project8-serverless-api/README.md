## Serverless REST API for User Management

**Goal:** Build a cost-efficient, event-driven API performing full CRUD operations without managing underlying servers.

* **Tech Stack:** AWS Lambda (Python), API Gateway, DynamoDB.

* **Key Features:**
* **On-Demand Scaling:** Utilized DynamoDB with PAY_PER_REQUEST billing for zero-cost idle time.

* **Security:** Enforced IAM execution roles with the Principle of Least Privilege for Lambda-to-DynamoDB access.

* **Logic:** Developed a single-entry Python handler to process `GET`, `POST`, `PUT`, and `DELETE` requests.

* **API Testing:**
```bash
curl -X POST <api_url>/users -d '{"id":"123", "name":"Sumit Malik"}'

```

---

## Prerequisites

* AWS CLI configured with appropriate IAM permissions.

* Terraform installed.

* Basic understanding of Python for Lambda logic.

---

### Sample Output:

* **API Gateway Endpoint & Stage (The Entry Point):**

![alt text](./images/image.png)
![alt text](./images/image-1.png)

* **DynamoDB Table "Explore Items" (The Data Layer):**

![alt text](./images/image-2.png)
![alt text](./images/image-3.png)

* **Lambda Function Configuration (The Logic):**

![alt text](./images/image-4.png)
![alt text](./images/image-5.png)

* **Successful cURL Response (The Validation):**

![alt text](./images/image-6.png)

* **CloudWatch Metrics / Logs (The Observability):**

![alt text](./images/image-7.png)

---