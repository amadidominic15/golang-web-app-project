# 🌐 Golang Web Application — Cloud-Native Deployment with Terraform, Helm & GitHub Actions

## 📖 Overview
This project is a **cloud-native web application** built using **Golang** and deployed to **AWS Elastic Kubernetes Service (EKS)**.  
It demonstrates **modern DevOps practices** such as **Infrastructure as Code (IaC)**, **Continuous Integration and Continuous Deployment (CI/CD)**, and **Kubernetes orchestration**.

DevOps practices include the following:

- Creating Dockerfile (Multi-stage build)
- Containerization
- Continuous Integration (CI)
- Continuous Deployment (CD)

## ⚙️ Tech Stack  
  | Layer                     | Tool                 | Purpose                                    |
| ------------------------- | -------------------- | ------------------------------------------ |
| **Application**           | Go                   | Web application                            |
| **Containerization**      | Docker               | Build & package the Go app                 |
| **Orchestration**         | Kubernetes (EKS)     | Manage application workload                |
| **Provisioning**          | Terraform            | Create EKS cluster & AWS resources         |
| **Packaging**             | Helm                 | Simplify and manage Kubernetes deployments |
| **CI/CD**                 | GitHub Actions       | Automate build, test, deploy               |

## Creating Dockerfile (Multi-stage build)

The Dockerfile is used to build a Docker image. The Docker image contains the Go web application and its dependencies. The Docker image is then used to create a Docker container.

We will use a Multi-stage build to create the Docker image. The Multi-stage build is a feature of Docker that allows you to use multiple build stages in a single Dockerfile. This will reduce the size of the final Docker image and also secure the image by removing unnecessary files and packages.

## 🏗️ Infrastructure Setup with Terraform (AWS EKS)

Terraform automates provisioning of:
- VPC and subnets
- IAM roles/policies
- EKS Cluster
- Node groups

## Continuous Integration (CI)

Continuous Integration (CI) is the practice of automating the integration of code changes into a shared repository. CI helps to catch bugs early in the development process and ensures that the code is always in a deployable state.

We will use GitHub Actions to implement CI for the Go web application. GitHub Actions is a feature of GitHub that allows you to automate workflows, such as building, testing, and deploying code.

The GitHub Actions workflow will run the following jobs:

- Build and test the applictaion
- Scan the code
- Build and push the Docker image
- Update image tag

## Continuous Deployment (CD)

Continuous Deployment (CD) is the practice of automatically deploying code changes to a production environment. CD helps to reduce the time between code changes and deployment, allowing you to deliver new features and fixes to users faster.

We will use GitHub Actions to implement CD for the Go web application. This will run on a trigger event when the CI pipeine is successful. The Helm application will deploy the Go web application to a Kubernetes cluster.

The GitHub Actions workflow will run the following jobs:

- Infrastructure deployment
- application deployment





