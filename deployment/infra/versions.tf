terraform {
  required_version = ">=1.2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.51.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.9.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.18.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.4.3"
    }
  }
  ####  UPDATE this with your TFC organization name ####
  cloud {
    organization = "<your org name>"

    workspaces {
      name = "dynamic-saas-cluster-aws-infra"
    }
  }
}
