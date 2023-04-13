data "tfe_organization" "org" {
  name = var.tfe.org
}

resource "tfe_project" "main" {
  organization = data.tfe_organization.org.name
  name         = var.tfe.project
}


resource "tfe_workspace" "free-cloud9" {
  count                     = length(regexall("free", var.tfc_tier)) == 1 ? 1 : 0
  name                      = var.tfe.workspaces.cloud9
  organization              = data.tfe_organization.org.name
  project_id                = tfe_project.main.id
  execution_mode            = "local"
  remote_state_consumer_ids = [tfe_workspace.free-infra[0].id]
  global_remote_state = false
}

resource "tfe_workspace" "free-infra" {
  count          = length(regexall("free", var.tfc_tier)) == 1 ? 1 : 0
  name           = var.tfe.workspaces.infra
  organization   = data.tfe_organization.org.name
  project_id     = tfe_project.main.id
  execution_mode = "local"
}

resource "tfe_workspace" "enterprise-cloud9" {
  count                     = length(regexall("enterprise", var.tfc_tier)) == 1 ? 1 : 0
  name                      = var.tfe.workspaces.cloud9
  organization              = data.tfe_organization.org.name
  project_id                = tfe_project.main.id
  execution_mode            = "remote"
  remote_state_consumer_ids = [tfe_workspace.enterprise-infra[0].id]
  working_directory         = "${path.module}/deployment/cloud9/"
}

resource "tfe_workspace" "enterprise-infra" {
  count             = length(regexall("enterprise", var.tfc_tier)) == 1 ? 1 : 0
  name              = var.tfe.workspaces.infra
  organization      = data.tfe_organization.org.name
  project_id        = tfe_project.main.id
  execution_mode    = "agent"
  agent_pool_id     = tfe_agent_pool.enterprise-agent-pool[0].id
  working_directory = "${path.module}/deployment/infra/"
}

resource "tfe_agent_pool" "enterprise-agent-pool" {
  count        = length(regexall("enterprise", var.tfc_tier)) == 1 ? 1 : 0
  name         = "dynamic-saas-cluster-aws-infra-agent-pool"
  organization = data.tfe_organization.org.name
}

resource "tfe_agent_token" "enterprise-agent-pool-token" {
  count         = length(regexall("enterprise", var.tfc_tier)) == 1 ? 1 : 0
  agent_pool_id = tfe_agent_pool.enterprise-agent-pool[0].id
  description   = "agent-token"
}
