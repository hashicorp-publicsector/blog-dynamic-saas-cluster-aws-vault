tfe = {
  ####  UPDATE this with your TFC organization name ####
  org     = "<your org name>"
  project = "dynamic-saas-cluster-aws-vault"
  workspaces = {
    cloud9 = "dynamic-saas-cluster-aws-cloud9",
    infra  = "dynamic-saas-cluster-aws-infra"
  }
}
