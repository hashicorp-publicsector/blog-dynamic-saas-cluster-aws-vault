data "terraform_remote_state" "cloud9" {
  backend = "remote"

  config = {
    ####  UPDATE this with your TFC organization name ####
    organization = "<your org name>"
    workspaces = {
      name = "dynamic-saas-cluster-aws-cloud9"
    }
  }
}
