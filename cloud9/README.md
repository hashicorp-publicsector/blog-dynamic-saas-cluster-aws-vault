# Cloud 9 Instance Creation

This sub terraform workspace will be used to create a Cloud 9 Instance and a VPC specifically dedicated to Cloud9.  Cloud9 will be deployed with a no ingress policy, utilizing AWS SSM to connect to the cloud9 instance.  This means that the instance will be provisioned with no ingress rules on the security group, and utilize AWS SSM to broker the connection to Cloud9.  

AWS will create a service-role for Cloud9 and an instance profile for the EC2 that is utilizing cloud9.  This will create a role called `AWSCloud9SSMAccessRole` and an Instance Profile of `AWSCloud9SSMInstanceProfile` automatically **if you do or have previously deployed Cloud9 via the GUI**.  

If you have not deployed Cloud9 via the GUI, terraform will create these resources for you.  Prior to running `terraform apply`, verify that these two IAM resources do or do not exist in your account first.  

``` bash
aws iam get-instance-profile --instance-profile AWSCloud9SSMInstanceProfile
aws iam get-role --role-name AWSCloud9SSMAccessRole
```

If you get errors for both of these commands, and in particular if the AWSCloud9SSMInstanceProfile does not show `AWSCloud9SSMAccessRole` in it's role arn list, then open the `.auto.tfvars` file and change the `cloud9_default_role_exists` to **false**.  This will cause Terraform to create these resources for you for use with Cloud9.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.51.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.4.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.51.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.4.3 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 3.19.0 |

## Resources

| Name | Type |
|------|------|
| [aws_cloud9_environment_ec2.saas_cloud9](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloud9_environment_ec2) | resource |
| [aws_iam_instance_profile.cloud9_ssm_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.cloud9_ssm_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [random_pet.random_pet](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |
| [aws_iam_policy_document.cloud9_ssm_assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud9_auto_stop_minutes"></a> [cloud9\_auto\_stop\_minutes](#input\_cloud9\_auto\_stop\_minutes) | The number of minutes until the running instance is shut down after the environment has last been used | `number` | `1800` | no |
| <a name="input_cloud9_default_role_exists"></a> [cloud9\_default\_role\_exists](#input\_cloud9\_default\_role\_exists) | Flag to create instance profile and role if they dont exist | `bool` | `false` | no |
| <a name="input_cloud9_instance_size"></a> [cloud9\_instance\_size](#input\_cloud9\_instance\_size) | Instance size for Cloud9 environment | `string` | `"t3.medium"` | no |
| <a name="input_cloud9_vpc"></a> [cloud9\_vpc](#input\_cloud9\_vpc) | Object to store VPC details for Cloud9 Environment | <pre>object({<br>    cidr                = string<br>    azs                 = list(string)<br>    public_subnet_cidrs = list(string)<br>  })</pre> | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region for Cloud9 Instance.  Ensure this matches the region used for the root folder | `string` | `"us-east-2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloud9_arn"></a> [cloud9\_arn](#output\_cloud9\_arn) | n/a |
| <a name="output_cloud9_id"></a> [cloud9\_id](#output\_cloud9\_id) | n/a |
| <a name="output_cloud9_subnet"></a> [cloud9\_subnet](#output\_cloud9\_subnet) | n/a |
| <a name="output_cloud9_url"></a> [cloud9\_url](#output\_cloud9\_url) | n/a |
| <a name="output_cloud9_vpc"></a> [cloud9\_vpc](#output\_cloud9\_vpc) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
