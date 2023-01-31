provider "aws" {}

terraform {
	required_providers {
		aws = {
	    version = "~> 4.51.0"
		}
  }
}
