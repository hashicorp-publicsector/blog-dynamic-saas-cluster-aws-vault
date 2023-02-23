# infra

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.51.0 |
| <a name="requirement_docker"></a> [docker](#requirement\_docker) | 3.0.1 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.9.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.18.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.4.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.51.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.9.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.4.3 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks"></a> [eks](#module\_eks) | terraform-aws-modules/eks/aws | 19.6.0 |
| <a name="module_kms_key"></a> [kms\_key](#module\_kms\_key) | terraform-aws-modules/kms/aws | ~> 1.1 |
| <a name="module_push_aws_cli_image_ecr"></a> [push\_aws\_cli\_image\_ecr](#module\_push\_aws\_cli\_image\_ecr) | ./container | n/a |
| <a name="module_push_vault_image_ecr"></a> [push\_vault\_image\_ecr](#module\_push\_vault\_image\_ecr) | ./container | n/a |
| <a name="module_push_vault_k8s_image_ecr"></a> [push\_vault\_k8s\_image\_ecr](#module\_push\_vault\_k8s\_image\_ecr) | ./container | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 3.19.0 |
| <a name="module_vpc_cni_irsa"></a> [vpc\_cni\_irsa](#module\_vpc\_cni\_irsa) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | ~> 5.0 |
| <a name="module_vpc_endpoints"></a> [vpc\_endpoints](#module\_vpc\_endpoints) | terraform-aws-modules/vpc/aws//modules/vpc-endpoints | 3.19.0 |

## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_table.product_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |
| [aws_dynamodb_table_item.insert_items](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table_item) | resource |
| [aws_iam_policy.dynamodb_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.s3_access_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.vault_sa_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.s3_access_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.vault_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.vault_sa_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.s3_access_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.vault_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.vault_sa_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_kms_key.vault_autounseal_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_route.peer_to_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.vpc_to_peer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
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
| [aws_security_group_rule.vault_webhook_nodes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_vpc_peering_connection.vpc_peering](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection) | resource |
| [helm_release.vault](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [random_pet.random_pet](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_canonical_user_id.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/canonical_user_id) | data source |
| [aws_ecr_image.aws_image](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ecr_image) | data source |
| [aws_ecr_image.vault_image](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ecr_image) | data source |
| [aws_ecr_image.vaultk8s_image](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ecr_image) | data source |
| [aws_iam_policy_document.dynamodb_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.s3_access_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.s3_bucket_logs_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.s3_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.vault_sa_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_route_table.cloud9_rtb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route_table) | data source |
| [aws_vpc.cloud9_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |
| [terraform_remote_state.cloud9](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_cli_image"></a> [aws\_cli\_image](#input\_aws\_cli\_image) | Image name and tag for aws\_cli | `string` | `"public.ecr.aws/aws-cli/aws-cli:latest"` | no |
| <a name="input_ddb_items"></a> [ddb\_items](#input\_ddb\_items) | Items to add to DDB table | <pre>map(object({<br>    shard_id     = string<br>    product_id   = string<br>    product_name = string<br>  }))</pre> | <pre>{<br>  "item1": {<br>    "product_id": "1",<br>    "product_name": "SmartWatch",<br>    "shard_id": "tenanta"<br>  },<br>  "item2": {<br>    "product_id": "2",<br>    "product_name": "PowerBank",<br>    "shard_id": "tenanta"<br>  },<br>  "item3": {<br>    "product_id": "3",<br>    "product_name": "AirFreshner",<br>    "shard_id": "tenantb"<br>  },<br>  "item4": {<br>    "product_id": "4",<br>    "product_name": "BabyFormula",<br>    "shard_id": "tenantb"<br>  },<br>  "item5": {<br>    "product_id": "5",<br>    "product_name": "Book",<br>    "shard_id": "tenantc-1"<br>  },<br>  "item6": {<br>    "product_id": "6",<br>    "product_name": "SmartPhone",<br>    "shard_id": "tenantc-2"<br>  },<br>  "item7": {<br>    "product_id": "7",<br>    "product_name": "RingLight",<br>    "shard_id": "tenantd-1"<br>  },<br>  "item8": {<br>    "product_id": "8",<br>    "product_name": "Laptop",<br>    "shard_id": "tenantd-2"<br>  }<br>}</pre> | no |
| <a name="input_eks_data"></a> [eks\_data](#input\_eks\_data) | Map of data relevant to the EKS Cluster | <pre>object({<br>    version          = string<br>    ami_type_default = string<br>    instance_types   = list(string)<br>    volume_size      = string<br>    volume_type      = string<br>    min_size         = number<br>    max_size         = number<br>    desired_size     = number<br>  })</pre> | <pre>{<br>  "ami_type_default": "AL2_x86_64",<br>  "desired_size": 2,<br>  "instance_types": [<br>    "t3.medium",<br>    "t3a.medium"<br>  ],<br>  "max_size": 2,<br>  "min_size": 2,<br>  "version": "1.24",<br>  "volume_size": 80,<br>  "volume_type": "gp2"<br>}</pre> | no |
| <a name="input_helm_config"></a> [helm\_config](#input\_helm\_config) | Object to hold helm values | <pre>object({<br>    name             = string<br>    namespace        = string<br>    create_namespace = bool<br>    description      = string<br>    version          = string<br>    repository       = string<br>  })</pre> | <pre>{<br>  "create_namespace": true,<br>  "description": "Vault on EKS",<br>  "name": "vault",<br>  "namespace": "vault",<br>  "repository": "https://helm.releases.hashicorp.com",<br>  "version": "0.23.0"<br>}</pre> | no |
| <a name="input_tag_prefix"></a> [tag\_prefix](#input\_tag\_prefix) | Prefix tag for VPCs | `string` | `"dynamic-policy-saas-cluster"` | no |
| <a name="input_vault_image"></a> [vault\_image](#input\_vault\_image) | Image name and tag for Vault | `string` | `"hashicorp/vault:1.12.2"` | no |
| <a name="input_vault_k8s_image"></a> [vault\_k8s\_image](#input\_vault\_k8s\_image) | Image name and tag for Vault-K8S | `string` | `"hashicorp/vault-k8s:1.1"` | no |
| <a name="input_vpc_data"></a> [vpc\_data](#input\_vpc\_data) | Data required to be passed to VPC module | <pre>object({<br>    cidr                 = string<br>    public_subnet_cidrs  = list(string)<br>    private_subnet_cidrs = list(string)<br>    availability_zones   = list(string)<br>  })</pre> | <pre>{<br>  "availability_zones": [<br>    "us-east-2a",<br>    "us-east-2b"<br>  ],<br>  "cidr": "10.0.0.0/16",<br>  "private_subnet_cidrs": [<br>    "10.0.100.0/24",<br>    "10.0.101.0/24"<br>  ],<br>  "public_subnet_cidrs": [<br>    "10.0.0.0/24",<br>    "10.0.1.0/24"<br>  ]<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ACCOUNT_ID"></a> [ACCOUNT\_ID](#output\_ACCOUNT\_ID) | n/a |
| <a name="output_AWSCLI_IMAGE_TAG"></a> [AWSCLI\_IMAGE\_TAG](#output\_AWSCLI\_IMAGE\_TAG) | n/a |
| <a name="output_AWSCLI_REPO_NAME"></a> [AWSCLI\_REPO\_NAME](#output\_AWSCLI\_REPO\_NAME) | n/a |
| <a name="output_AWS_REGION"></a> [AWS\_REGION](#output\_AWS\_REGION) | n/a |
| <a name="output_EKS_CLUSTER_NAME"></a> [EKS\_CLUSTER\_NAME](#output\_EKS\_CLUSTER\_NAME) | n/a |
| <a name="output_RANDOM_STRING"></a> [RANDOM\_STRING](#output\_RANDOM\_STRING) | n/a |
| <a name="output_REPO_URI_AWSCLI"></a> [REPO\_URI\_AWSCLI](#output\_REPO\_URI\_AWSCLI) | n/a |
| <a name="output_REPO_URI_VAULT"></a> [REPO\_URI\_VAULT](#output\_REPO\_URI\_VAULT) | n/a |
| <a name="output_TENANT_SA_ROLE_ARN"></a> [TENANT\_SA\_ROLE\_ARN](#output\_TENANT\_SA\_ROLE\_ARN) | n/a |
| <a name="output_VAULT_AGENT_TEMPLATES_BUCKET"></a> [VAULT\_AGENT\_TEMPLATES\_BUCKET](#output\_VAULT\_AGENT\_TEMPLATES\_BUCKET) | n/a |
| <a name="output_VAULT_IMAGE_TAG"></a> [VAULT\_IMAGE\_TAG](#output\_VAULT\_IMAGE\_TAG) | n/a |
| <a name="output_VAULT_K8S_ECR_URI"></a> [VAULT\_K8S\_ECR\_URI](#output\_VAULT\_K8S\_ECR\_URI) | n/a |
| <a name="output_VAULT_K8S_IMAGE_TAG"></a> [VAULT\_K8S\_IMAGE\_TAG](#output\_VAULT\_K8S\_IMAGE\_TAG) | n/a |
| <a name="output_VAULT_NS"></a> [VAULT\_NS](#output\_VAULT\_NS) | n/a |
| <a name="output_VAULT_REPO_NAME"></a> [VAULT\_REPO\_NAME](#output\_VAULT\_REPO\_NAME) | n/a |
| <a name="output_VAULT_ROLE"></a> [VAULT\_ROLE](#output\_VAULT\_ROLE) | n/a |
| <a name="output_VAULT_SA_ROLE_ARN"></a> [VAULT\_SA\_ROLE\_ARN](#output\_VAULT\_SA\_ROLE\_ARN) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
