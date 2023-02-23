terraform {
  required_version = ">=1.2.0"
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~>0.42.0"
    }
  }
}
