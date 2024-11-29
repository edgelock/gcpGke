
# Terraform GCP GKE Setup and Deployment Guide

This guide outlines the steps taken to set up Terraform CLI with Google Cloud, deploy infrastructure, and use Helm and Kustomize to manage applications on a GKE cluster.

---

## Steps to Set Up and Deploy

### 1. Install `kubectl`
Install `kubectl` using the Google Cloud CLI:
```bash
gcloud components install kubectl
```
Verify installation:
```bash
kubectl version --client
```

---

### 2. Connect to the GKE Cluster
Configure `kubectl` to connect to the GKE cluster:
```bash
gcloud container clusters get-credentials my-gke-cluster --region us-central1 --project midyear-mason-301002
```
Verify the connection:
```bash
kubectl get nodes
```

---

### 3. Install Helm
Install Helm, the Kubernetes package manager:
```bash
brew install helm
```
Add the Bitnami Helm repository and update the local cache:
```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
```
Deploy an example NGINX application:
```bash
helm install nginx bitnami/nginx
```
Verify the deployment:
```bash
helm list
kubectl get all
```

---

### 4. Install Kustomize
Install Kustomize to manage Kubernetes configurations:
```bash
brew install kustomize
```
Create a directory with the following files for deployment:
- `kustomization.yaml`
- `deployment.yaml`
- `service.yaml`

Apply the configuration using:
```bash
kubectl apply -k .
```
Verify the deployment:
```bash
kubectl get all
```

---

### 5. Verify All Deployments
After deploying with Helm and Kustomize, verify the resources are running:
```bash
kubectl get all
```

Example output:
- **NGINX LoadBalancer Service**: External IP is available for access.
- **Kustomize `my-app` Service**: ClusterIP is available for in-cluster communication.

---

## Next Steps
- Access the deployed services using their respective IPs.
- Customize the configurations further as needed.
