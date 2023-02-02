terraform {
  required_version = ">=1.2.0"
  required_providers {
    aws = {
      version = "~> 4.51.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.1"
    }
  }
}
