# SaaS Data Isolation with Dynamic Credentials Using Hashicorp Vault in Amazon EKS

The code shared here is intended to provide a sample implementation of SaaS Data Isolation with Dynamic Credentials Using HashiCorp Vault in Amazon EKS. The goal is to provide SaaS developers and architects with working code that will illustrate how multi-tenant SaaS applications can be design and delivered on AWS using HashiCorp Vault and Amazon EKS. The solution implements an identity model that simplifies the management of data access policies and credentials in isolated tenant environments. The focus here is more on giving developers a view into the working elements of the solution without going to the extent of making a full, production-ready solution.  

This is a repository utilizing [HashiCorp Terraform](https://www.hashicorp.com/products/terraform) and it's [providers](https://registry.terraform.io/providers/) to configure the architecture provided in the blog post [insert-valid-link](http://0)  

TODO: refactor logical resource names to use snake case across codebase  
TODO: Get terraform up past step8  


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.51.0 |
| <a name="requirement_docker"></a> [docker](#requirement\_docker) | 3.0.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.51.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.4.3 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks"></a> [eks](#module\_eks) | terraform-aws-modules/eks/aws | 19.6.0 |
| <a name="module_kms_key"></a> [kms\_key](#module\_kms\_key) | terraform-aws-modules/kms/aws | ~> 1.1 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 3.19.0 |
| <a name="module_vpc_cni_irsa"></a> [vpc\_cni\_irsa](#module\_vpc\_cni\_irsa) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | ~> 5.0 |
| <a name="module_vpc_endpoints"></a> [vpc\_endpoints](#module\_vpc\_endpoints) | terraform-aws-modules/vpc/aws//modules/vpc-endpoints | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_table.product_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |
| [aws_ecr_repository.cli](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository.vault](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository.vault-k8s](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_s3_bucket.access_logs_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket.vault_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.access_logs_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_logging.vault_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_logging) | resource |
| [aws_s3_bucket_policy.access_logs_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_policy.vault_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.access_logs_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_public_access_block.vault_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.access_logs_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.vault_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_security_group.vpc_eks_node_to_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.vpc_tls](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [random_string.random_string](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_canonical_user_id.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/canonical_user_id) | data source |
| [aws_iam_policy_document.generic_endpoint_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.s3_bucket_logs_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.s3_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_cli_image"></a> [aws\_cli\_image](#input\_aws\_cli\_image) | Image name and tag for aws\_cli | `string` | n/a | yes |
| <a name="input_eks_data"></a> [eks\_data](#input\_eks\_data) | Map of data relevant to the EKS Cluster | <pre>object({<br>    version          = string<br>    ami_type_default = string<br>    instance_types   = list(string)<br>    volume_details   = map(string)<br>    min_size         = number<br>    max_size         = number<br>    desired_size     = number<br>  })</pre> | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region for deploying resources | `string` | n/a | yes |
| <a name="input_tag_prefix"></a> [tag\_prefix](#input\_tag\_prefix) | Prefix tag for VPCs | `string` | n/a | yes |
| <a name="input_vault_image"></a> [vault\_image](#input\_vault\_image) | Image name and tag for Vault | `string` | n/a | yes |
| <a name="input_vault_k8s_image"></a> [vault\_k8s\_image](#input\_vault\_k8s\_image) | Image name and tag for Vault-K8S | `string` | n/a | yes |
| <a name="input_vpc_data"></a> [vpc\_data](#input\_vpc\_data) | Data required to be passed to VPC module | <pre>object({<br>    cidr                 = string<br>    public_subnet_cidrs  = list(string)<br>    private_subnet_cidrs = list(string)<br>    availability_zones   = list(string)<br>  })</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
