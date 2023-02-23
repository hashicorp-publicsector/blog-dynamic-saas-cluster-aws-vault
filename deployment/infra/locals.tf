locals {
  region           = data.terraform_remote_state.cloud9.outputs.cloud9_region
  cloud9_vpc_id    = data.terraform_remote_state.cloud9.outputs.cloud9_vpc
  cloud9_subnet_id = data.terraform_remote_state.cloud9.outputs.cloud9_subnet
}
