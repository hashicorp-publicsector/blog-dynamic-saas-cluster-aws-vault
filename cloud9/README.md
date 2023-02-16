# cloud9

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.51.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.51.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.4.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloud9_environment_ec2.saas_cloud9](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloud9_environment_ec2) | resource |
| [aws_iam_instance_profile.cloud9_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.cloud9_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [random_string.random_string](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [aws_iam_policy.admin_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy_document.cloud9_assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_subnets.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud9_auto_stop_minutes"></a> [cloud9\_auto\_stop\_minutes](#input\_cloud9\_auto\_stop\_minutes) | Minutes to automatically shut down Cloud9 if idle | `number` | n/a | yes |
| <a name="input_cloud9_instance_size"></a> [cloud9\_instance\_size](#input\_cloud9\_instance\_size) | Instance size for Cloud9 environment | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region for Cloud9 Instance.  Ensure this matches the region used for the root folder | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloud9_arn"></a> [cloud9\_arn](#output\_cloud9\_arn) | n/a |
| <a name="output_cloud9_id"></a> [cloud9\_id](#output\_cloud9\_id) | n/a |
| <a name="output_cloud9_subnet"></a> [cloud9\_subnet](#output\_cloud9\_subnet) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
