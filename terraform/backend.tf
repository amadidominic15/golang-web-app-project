terraform {
  backend "s3" {
    region       = "eu-north-1"
    bucket       = "online-boutique-2025"
    key          = "eks_cluster/terrafom.tfstate"
    use_lockfile = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.96.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.12"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.30"
    }
  }
}

