
# Kubernetes Static Website Deployment

## 1. Project Overview

This project demonstrates how to deploy an existing Dockerized static website on a local Kubernetes cluster using Minikube.

The website was previously containerized using Docker and Nginx. In this project, the same Docker image is reused to deploy multiple application replicas and expose the application through a Kubernetes NodePort Service.

This is a hands-on Cloud and DevOps learning project.

## 2. Project Objectives

- Deploy a Dockerized website on Kubernetes.
- Understand Kubernetes Namespaces, Deployments, ReplicaSets, Pods and Services.
- Deploy three replicas of an Nginx application.
- Configure CPU and memory requests and limits.
- Understand Kubernetes rolling update strategy.
- Use imagePullPolicy to run a locally loaded Docker image.
- Expose the application using a NodePort Service.
- Verify application connectivity using a browser and curl.

## 3. Architecture

```text
                  Browser
                     |
                     v
             Minikube Service URL
                     |
                     v
              NodePort Service
                 Port 30080
                     |
                     v
           static-website-service
                     |
          +----------+----------+
          |          |          |
          v          v          v
        Pod 1      Pod 2      Pod 3
        Nginx      Nginx      Nginx
        Port 80    Port 80    Port 80
          |          |          |
          +----------+----------+
                     |
                     v
             Kubernetes Deployment
                     |
                  ReplicaSet
```

## 4. Technologies Used

- Ubuntu 22.04 / WSL2
- Docker
- Kubernetes
- Minikube
- kubectl
- Nginx
- YAML
- Git and GitHub

## 5. Prerequisites

- Docker installed and working.
- Minikube installed.
- kubectl available.
- Existing Docker image: `dockerized-static-website:v1`.

Verify the tools:

```bash
docker --version
minikube version
kubectl version --client
```

## 6. Project Structure

```text
01-kubernetes-static-website/
├── README.md
└── k8s/
    ├── namespace.yaml
    ├── deployment.yaml
    └── service.yaml
```

## 7. Docker Image Preparation

The Docker image was created in the preceding Docker project.

Load the image into Minikube:

```bash
minikube image load dockerized-static-website:v1
```

Verify:

```bash
minikube image ls | grep dockerized-static-website
```

The Deployment uses:

```yaml
image: dockerized-static-website:v1
imagePullPolicy: Never
```

This instructs Kubernetes to use the image already available in Minikube rather than attempting to pull it from a registry.

## 8. Create Kubernetes Namespace

Apply the Namespace manifest:

```bash
kubectl apply -f k8s/namespace.yaml
```

Verify:

```bash
kubectl get namespaces
```

Namespace used:

```text
static-website
```

## 9. Deploy the Application

Apply the Deployment:

```bash
kubectl apply -f k8s/deployment.yaml
```

The Deployment configuration includes:

- Three application replicas.
- RollingUpdate deployment strategy.
- maxSurge: 1.
- maxUnavailable: 0.
- CPU and memory requests and limits.
- Nginx container listening on port 80.

Verify the Deployment:

```bash
kubectl get deployments -n static-website
```

Check the ReplicaSet:

```bash
kubectl get replicasets -n static-website
```

Check Pods:

```bash
kubectl get pods -n static-website -o wide
```

## 10. Expose the Application Using NodePort

Apply the Service:

```bash
kubectl apply -f k8s/service.yaml
```

The Service configuration uses:

- Type: NodePort
- Service port: 80
- Target port: 80
- NodePort: 30080

Verify:

```bash
kubectl get services -n static-website
```

Check Service endpoints:

```bash
kubectl get endpoints -n static-website
```

For newer Kubernetes versions, EndpointSlices can also be inspected:

```bash
kubectl get endpointslices -n static-website
```

## 11. Access the Website

Run:

```bash
minikube service static-website-service -n static-website --url
```

Open the returned URL in a browser.

For the Docker driver on Linux, keep the terminal running the Minikube service tunnel open while accessing the URL.

## 12. Test Application Connectivity

From another terminal, test the website using curl with the URL returned by Minikube:

```bash
curl -I http://127.0.0.1:YOUR_RETURNED_PORT
```

Check the website response:

```bash
curl http://127.0.0.1:YOUR_RETURNED_PORT
```

Replace `YOUR_RETURNED_PORT` with the actual port in the returned URL.

## 13. Kubernetes Concepts Practised

- Namespaces
- Pods
- Deployments
- ReplicaSets
- Labels and selectors
- Container image management
- imagePullPolicy
- CPU and memory requests and limits
- RollingUpdate strategy
- NodePort Services
- Service endpoints
- Application access and HTTP testing

## 14. Current Project Scope and Future Improvements

The current implementation covers the basic deployment of three website replicas and external access through a NodePort Service.

Planned improvements:

- Practise horizontal scaling.
- Test Pod deletion and self-healing.
- Perform rolling updates and rollbacks.
- Learn readiness and liveness probes.
- Add ConfigMaps and Secrets.
- Explore Ingress.
- Integrate CI/CD using GitHub Actions.
- Explore deployment on AWS EKS.

## 15. Learning Outcome

This project provides hands-on experience deploying a Dockerized Nginx website on Kubernetes, managing multiple replicas, exposing an application through a Service and verifying application connectivity.

**Project Category:** Kubernetes and Container Orchestration

**Portfolio:** Cloud, DevOps, Multicloud, Python and AI Projects

