# k8s-helm-microservices-deployment
🚀 Kubernetes and Helm-based Deployment for Microservices

This project demonstrates the deployment and management of microservices (details, reviews, productpage, and MongoDB) using Kubernetes and Helm. It includes environments for UAT and Production and highlights advanced Helm configurations.

---

## Features
- 🛠 Helm-based Deployment for scalable microservices.
- 🌐 Kubernetes configurations for UAT and Production environments.
- 🔒 ConfigMaps and Secrets for secure application management.
- 🔄 MongoDB upgrade from `bitnami/mongodb:4.4.4` to `bitnami/mongodb:8.0.4`.
- 🚀 External access through NGINX Ingress with `nip.io`.

---

## Prerequisites
- Kubernetes Cluster (e.g., GKE)
- Helm 3.x
- Docker
- kubectl
- Access to Bitnami MongoDB images

---

## Setup Instructions -- EXAMPLE

### Configure Helm Values
- Navigate to the `values/` directory.
- Update environment-specific values (`uat-values.yaml` and `prod-values.yaml`).

### Deploy to UAT
```bash
kubectl config use-context uat-context
helm install mongodb-release -f values/uat-values.yaml charts/mongodb
helm install ratings-release -f values/uat-values.yaml charts/ratings
