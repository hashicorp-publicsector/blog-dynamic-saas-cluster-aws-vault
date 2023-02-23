variable "tfe" {
  type = object({
    org        = string
    project    = string
    workspaces = map(string)
  })
  default = {
    org     = "<org_name>"
    project = "dynamic-saas-cluster-aws-vault"
    workspaces = {
      cloud9 = "dynamic-saas-cluster-aws-cloud9",
      infra  = "dynamic-saas-cluster-aws-infra"
    }
  }
}

variable "tfc_tier" {
  type    = string
  default = "free"

  validation {
    condition = contains(
      ["free", "enterprise"],
      var.tfc_tier
    )
    error_message = "Error: TFC Tier is not valid."
  }

}
