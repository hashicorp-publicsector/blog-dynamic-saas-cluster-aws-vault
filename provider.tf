provider "aws" {
  region = var.region
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

provider "docker" {
  alias = "vault_ecr"
  registry_auth {
    address  = data.aws_ecr_authorization_token.ecr-vault-token.proxy_endpoint
    username = data.aws_ecr_authorization_token.ecr-vault-token.user_name
    password = data.aws_ecr_authorization_token.ecr-vault-token.password
  }
}

provider "docker" {
  alias = "vault_k8s_ecr"
  registry_auth {
    address  = data.aws_ecr_authorization_token.ecr-vault-k8s-token.proxy_endpoint
    username = data.aws_ecr_authorization_token.ecr-vault-k8s-token.user_name
    password = data.aws_ecr_authorization_token.ecr-vault-k8s-token.password
  }
}

provider "docker" {
  alias = "aws_cli_ecr"
  registry_auth {
    address  = data.aws_ecr_authorization_token.ecr-cli-token.proxy_endpoint
    username = data.aws_ecr_authorization_token.ecr-cli-token.user_name
    password = data.aws_ecr_authorization_token.ecr-cli-token.password
  }
}
