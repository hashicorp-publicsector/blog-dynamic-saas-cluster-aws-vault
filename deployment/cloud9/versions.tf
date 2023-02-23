terraform {
  required_version = ">=1.2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.51.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.4.3"
    }
  }
  ####  UPDATE this with your TFC organization name ####
  cloud {
    organization = "<your-org-name>"

    workspaces {
      name = "dynamic-saas-cluster-aws-cloud9"
    }
  }
}
