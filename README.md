# k8s-helm-microservices-deployment
🚀 Kubernetes and Helm-based Deployment for Microservices

## Introduction
This project demonstrates the deployment and management of microservices (details, reviews, productpage, and MongoDB) using Kubernetes and Helm. It includes environments for UAT and Production and highlights advanced Helm configurations.

## Features
- 🛠 **Helm-based Deployment**: Easily deploy microservices with Helm Charts.
- 🌐 **Kubernetes Configurations**: UAT and Production environments configured for scalability.
- 🔒 **Secure Secrets Management**: ConfigMaps and Secrets used to manage sensitive data.
- 🔄 **MongoDB Upgrades**: Seamlessly upgrade MongoDB from `bitnami/mongodb:4.4.4` to `bitnami/mongodb:8.0.4`.
- 🚀 **NGINX Ingress**: Configured for external access with `nip.io` wildcard DNS.

## Prerequisites
- Kubernetes Cluster (GKE or any other provider)
- Helm 3.x
- Docker
- kubectl
- Access to Bitnami MongoDB images

## Setup Instructions

### Clone the Repository - EXAMPLE
```bash
git clone https://github.com/yourusername/k8s-helm-microservices-deployment.git
cd k8s-helm-microservices-deployment

## Configure Helm Values

**1.Navigate to the values/ directory.
**2.Update the environment-specific values (uat-values.yaml, prod-values.yaml).

## Deploy to UAT
```bash
kubectl config use-context uat-context
helm install mongodb-release -f values/uat-values.yaml charts/mongodb
helm install ratings-release -f values/uat-values.yaml charts/ratings

## Deploy to Production
```bash
kubectl config use-context prod-context
helm install mongodb-release -f values/prod-values.yaml charts/mongodb
helm install ratings-release -f values/prod-values.yaml charts/ratings




