# SaaS Data Isolation with Dynamic Credentials Using Hashicorp Vault in Amazon EKS

The code shared here is intended to provide a sample implementation of SaaS Data Isolation with Dynamic Credentials Using HashiCorp Vault in Amazon EKS. The goal is to provide SaaS developers and architects with working code that will illustrate how multi-tenant SaaS applications can be design and delivered on AWS using HashiCorp Vault and Amazon EKS. The solution implements an identity model that simplifies the management of data access policies and credentials in isolated tenant environments. The focus here is more on giving developers a view into the working elements of the solution without going to the extent of making a full, production-ready solution.  

This is a repository utilizing [HashiCorp Terraform](https://www.hashicorp.com/products/terraform) and it's [providers](https://registry.terraform.io/providers/) to configure the architecture provided in the blog post [insert-valid-link](http://0)  

## Prerequisites
<details>
<summary>click to expand</summary>

1. Terraform OSS (it's free!)
2. git CLI (if using Terraform OSS)
3. An AWS account

</details>

## Usage
<details>
<summary>click to expand</summary>

### Terraform OSS
1. Clone the git repository and navigate to the cloud9 directory:  

    ```bash
    git clone [url]  
    cd [repo-name]/cloud9/  
    ```

    Note that prior to running the commands in step 2, you will need to validate if the default AWSCloud9SSMAccessRole and AWSCloud9SSMInstanceProfile are in your AWS Account.  They will be if you've ever launched an SSM_Connect Cloud9 instance previously **via the GUI**.  If this is the case, set the `var.cloud9_default_role_exists` to true to prevent Terraform from attempting to create these.  You can set this value in the `auto.tfvars` file.  

    To check if the Instance Profile or Role already exist in your account, run the following commands

    ```bash  
    aws iam get-instance-profile --instance-profile AWSCloud9SSMInstanceProfile
    aws iam get-role --role-name AWSCloud9SSMAccessRole
    ```  

2. Run these Terraform commands:  

    ```hcl  
    terraform init [press enter]
    terraform plan [press enter]
    terraform apply --auto-approve [press enter]
    ```

3. Once complete, Terraform will output the ARN for Cloud9.  Log into your AWS account and access the provisioned Cloud9 instance.  **All the other cli based steps will be performed on the Cloud9 Instance**.  

4. Create EC2 Instance Role via the AWS Console

    - Follow [this deep link](https://console.aws.amazon.com/iam/home#/roles$new?step=review&commonUseCase=EC2%2BEC2&selectedUseCase=EC2&policies=arn:aws:iam::aws:policy%2FAdministratorAccess) to create an IAM role with Administrator access.
    - Confirm that AWS service and EC2 are selected, then click Next to view permissions.
    - Confirm that `AdministratorAccess` is checked, then click **Next: Tags** to assign tags.
    - Take the defaults, and click **Next: Review** to review.
    - Enter `dynamic-policy-ref-arch-admin` for the Name, and click **Create role**.

5. Remove managed credentials and attach EC2 Instance Role to Cloud9 Instance

    - Click the gear in the upper right-hand corner of the IDE which opens settings. Click the `AWS Settings` on the left and under `Credentials` slide the button to the left for `AWS managed temporary credentials`. The button should be greyed out when done, indicating it's off.
    - Click the round button with an alphabet in the upper right-hand corner of the IDE and click `Manage EC2 Instance`. This will take you to the EC2 portion of the AWS Console
    - Right-click the EC2 instance and in the fly-out menu, click `Security` -> `Modify IAM Role`
    - Choose the Role you created in the step above. It should be titled `dynamic-policy-ref-arch-admin` and click  `Save`.

6. In the Cloud9 IDE, clone the repo and resume provisioning with Terraform:
    - Click `Window` -> `New Terminal` and enter the following commands:
    - `cd [repo-name]/ [press enter]`
    -  Open the `terraform.example.auto.tfvars` file and update the **cloud9_vpc_id** field with the output of the cloud9 vpc id from the previous local terraform run, replacing the VPC id with the one provided in the outputs.  Save the file, and then run the following:

    ```hcl  
    terraform init [press enter]
    terraform plan [press enter]
    terraform apply --auto-approve [press enter]
    ```

    Note that this deployment will take roughly 20 minutes to complete.  Now would be a great time to grab a cup of coffee or tea.  

    We've now provisioned and configured the EKS cluster, a vault deployment with the Vault Helm Chart, copied the vault, vault-k8s, and awscli images to ECR, provisioned a DynamoDB Table, and created all associated networking/security resources! Let's continue with the rest of the deployment.

7. Install k8s dependencies:
    - Click `Window` -> `New Terminal` and enter the following commands:
    ```bash
    cd [repo-name]/scripts/ [press enter]
    chmod +x install-k8s-tools.sh
    ./install-k8s-tools.sh
    ```  

    This will install kubectl on the Cloud9 instance and set the alias k for kubectl, if you would like a shorthand method of invoking kubectl.

8. Initialized Vault:
    - In the same window as Step 7, cd into the vault directory
    ```bash
    cd [repo-name]/scripts/vault/ [press enter]
    chmod +x init-vault.sh
    ./init-vault.sh
    ```  

    This will initialize Vault.  Vault has been configured with Auto-Unseal utilizing AWS KMS.  This allows Vault to automatically unseal for operations.  We store the Recovery Keys and Root token in AWS Secrets Manager.  

9. Deploy Sample Silo Tenants:
    - Click `Window` -> `New Terminal` and enter the following commands:
    ```bash
    cd [repo-name]/scripts/silo/ [press enter]
    chmod +x deploy-siloed-tenants.sh
    ./deploy-siloed-tenants.sh
    ```
    This [script](./scripts/silo/deploy-siloed-tenants.sh) creates the following, for each tenant (tenanta & tenantb):

    a. Vault role along with the tenant-scoped IAM session policy  
    b. Vault policy that allows access to tenant-scoped credentials  
    c. Vault credentials access endpoint  
    d. AppRole for the Vault Agent sidecar, bound to the tenant-specific Vault policy  
    e. AppRole credentials (role_id / secret_id) for the Vault Agent sidecar  
    f. Kubernetes namespace for the tenant  
    g. Kubernetes secret containing the Vault Agent's AppRole credentials  
    h. Kubernetes configmap containing the Vault Agent configuration  
    i. Application pods  

10. Test Silo Tenant Deployments:  
    a. In the Cloud9 test editor, open [test-cases/shell-into-tenant-container.sh](./scripts/test-cases/shell-into-tenant-container.sh)  
    b. Modify the value of environment variable APPLICATION_NS to "tenanta" or "tenantb"  
    c. Save the file, then run  

      ```bash  
      cd [repo-name]/scripts/test-cases/  
      chmod +x shell-into-tenant-container.sh  
      ./shell-into-tenant-container.sh  
      ```  
    e. You would now be in a shell within the tenant-specific application (myapp) container  
    f. In the Cloud9 test editor, open [test-cases/test-dynamodb-access.sh](./scripts/test-cases/test-dynamodb-access.sh)  
    g. Modify the value of environment variable TENANT to "tenanta" or "tenantb", matching the APPLICATION_NS value set in step (b)  
    h. Select all the contents of `test-cases/test-dynamodb-access.sh`  
    i. Paste the contents into the shell that was started on the tenant-specific application container  
    j. Data items will be pulled from the DynamoDB table Products only where the ShardID matches the tenant ID set by the environment variable AWS_PROFILE. AWS CLI uses the AWS credentials file   to use the credentials for the tenant-specific profile.  
    k. Data items where the ShardID doesn't match the tenant ID will not be retrieved and the following error will be generated.  

    ```sh
    An error occurred (AccessDeniedException) when calling the GetItem operation: User: arn:aws:sts::ACCOUNT_ID:federated-user/vault-xxxxxxxxxx-yyyyyyyyyyyyyyy is not authorized to perform: dynamodb:GetItem on resource: arn:aws:dynamodb:AWS_REGION:ACCOUNT_ID:table/Products_xxxxxxxx because no session policy allows the dynamodb:GetItem action
    ```

11. Deploy Sample Pooled Tenants  
    - Click `Window` -> `New Terminal` and enter the following commands:  

    ```bash  
    cd [repo-name]/scripts/pool  
    chmod +x deploy-pooled-tenants.sh  
    ./deploy-pooled-tenants.sh  
    ```

    This [script](./scripts/pool/deploy-pooled-tenants.sh) creates the following, for each tenant (tenantc & tenantd):  
    a. A Vault role with tenant-scoped IAM session policy  
    b. Vault policy that allows access to credentials for all sub-tenant (tenantc-* / tenantd-*)  
    c. A Vault credentials endpoint  
    d. AppRole for the Vault Agent bound to the tenant-specific Vault policy  
    e. AppRole credentials (role_id / secret_id) for the Vault Agent sidecar  
    f. Kubernetes namespace for the tenant  
    g. Kubernetes secret containing the Vault Agent's AppRole credentials  
    h. Kubernetes configmap containing the Vault Agent configuration  
    i. Application pods  


12. Deploy Sample Pooled Sub-Tenants
    - Run the following command in the "Pooled Tenants" shell window  

    ```bash  
    cd [repo-name]/scripts/pool  
    chmod +x deploy-pool-sub-tenants.sh  
    ./deploy-pool-sub-tenants.sh  
    ```

    This [script](./scripts/pool/deploy-pool-sub-tenants.sh) completes the following, for each tenant (tenantc & tenantd):  

    a. For each sub-tenant, creates a Vault role along with the sub-tenant-scoped IAM session policy  
    b. For each sub-tenant, creates a Vault credentials endpoint  
    c. Updates tenant-specific Vault Agent configmap with a template to generate sub-tenant credentials in the mapped secrets volume  
    d. Restarts the Vault Agent process with a kill -SIGHUP, for the process to re-read the configmap  

13. Test Pooled Tenant Deployments  
    a. In the Cloud9 test editor, open [test-cases/shell-into-tenant-container.sh](./scripts/test-cases/shell-into-tenant-container.sh)  
    b. Modify the value of environment variable APPLICATION_NS to "tenantc" or "tenantd"  
    c. Save the file, then run  

    ```bash  
    cd [repo-name]/scripts/test-cases/  
    chmod +x shell-into-tenant-container.sh  
    ./shell-into-tenant-container.sh  
    ```  
    d. You would now be in a shell within the sub-tenant-specific application (myapp) container  
    e. In the Cloud9 test editor, open [test-cases/test-dynamodb-access.sh](./scripts/test-cases/test-dynamodb-access.sh)  
    f. Modify the value of environment variable TENANT to "tenantc-1", "tenantc-2", "tenantd-1", or "tenantd-2", corresponding to the APPLICATION_NS value set in step (b)  
    g. Select all the contents of test-cases/test-dynamodb-access.sh  
    h. Paste the contents into the shell that was started on the sub-tenant-specific application container  
    i. Data items will be pulled from the DynamoDB table Products only where the ShardID matches the sub-tenant ID set by the environment variable AWS_PROFILE. AWS CLI uses the AWS credentials file to use the credentials for the sub-tenant-specific profile.  
    j. Data items where the ShardID doesn't match the tenant ID will not be retrieved and the following error will be generated.  

    ```
    An error occurred (AccessDeniedException) when calling the GetItem operation: User: arn:aws:sts::ACCOUNT_ID:federated-user/vault-xxxxxxxxxx-yyyyyyyyyyyyyyy is not authorized to perform: dynamodb:GetItem on resource: arn:aws:dynamodb:AWS_REGION:ACCOUNT_ID:table/Products_xxxxxxxx because no session policy allows the dynamodb:GetItem action
    ```  

</details>

## Cleanup
<details>
<summary>click to expand</summary>


The deployed components can be cleaned up via the following procedure.  

### Cloud9 IDE

1. Run the cleanup script via a new terminal window  
    - Click `Window` -> `New Terminal` and enter the following commands:  
    ```bash  
    cd [repo-name]/scripts/cleanup/ [press enter]  
    chmod +x cleanup.sh  
    ./cleanup.sh  
    ```  

2. Destroy the infrastructure and resources created by Terraform  
    - In the same terminal window, run these commands:  
    ```hcl  
    terraform init [press enter]  
    terraform plan [press enter]  
    terraform destroy --auto-approve [press enter]  
    ```  

   **NOTE:** EKS may not completely delete the ENI associated with the Node Group upon deletion.  This will cause terraform to hang while attempting to destroy the Security Group attached to the ENI.  If you see that terraform is alternating between deleting the following two resource addresses:  

   ```bash
   module.eks.aws_security_group.node[0]: Still destroying... [id=sg-034a27861feee7258, 1m20s elapsed]
   module.vpc.aws_subnet.private[0]: Still destroying... [id=subnet-037ae0981f4d7f14b, 1m30s elapsed]
   ```  

   Then run the following commands:  
   `aws ec2 describe-network-interfaces --filters Name=group-id,Values=<security-group-id> --region <region> --output json | jq -r '.NetworkInterfaces[] | .NetworkInterfaceId, .Description'`  

   If the Description states that the ENI is related to the EKS Cluster created by Terraform for this example, and the interface status is "Available", this indicates that EKS did not properly delete the network interface.  

   Delete the network interface via the GUI, or via the CLI with  

   `aws ec2 delete-network-interface --network-interface-id <network interface ID from above command> --region <region>`  

   If you do this while Terraform is still running, it should unblock the ability to remove the security group and complete the destruction of resources.  If not, you may have to run `terraform destroy` again to clean up the VPC.  

### Local Workstation  
1. On your local workstation, destroy the Cloud9 environment created by Terraform:  
    `cd [repo-name]/cloud9 [press enter]`  

    ```hcl  
    terraform init [press enter]  
    terraform plan [press enter]  
    terraform destroy --auto-approve [press enter]  
    ```
</details>


## Requirements
<details>
<summary>click to expand</summary>


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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_cli_image"></a> [aws\_cli\_image](#input\_aws\_cli\_image) | Image name and tag for aws\_cli | `string` | n/a | yes |
| <a name="input_cloud9_subnet_id"></a> [cloud9\_subnet\_id](#input\_cloud9\_subnet\_id) | Subnet ID of Cloud9 Instance | `string` | n/a | yes |
| <a name="input_cloud9_vpc_id"></a> [cloud9\_vpc\_id](#input\_cloud9\_vpc\_id) | VPC ID of Cloud9 Subnet | `string` | n/a | yes |
| <a name="input_ddb_items"></a> [ddb\_items](#input\_ddb\_items) | Items to add to DDB table | <pre>map(object({<br>    shard_id     = string<br>    product_id   = string<br>    product_name = string<br>  }))</pre> | n/a | yes |
| <a name="input_eks_data"></a> [eks\_data](#input\_eks\_data) | Map of data relevant to the EKS Cluster | <pre>object({<br>    version          = string<br>    ami_type_default = string<br>    instance_types   = list(string)<br>    volume_size      = string<br>    volume_type      = string<br>    min_size         = number<br>    max_size         = number<br>    desired_size     = number<br>  })</pre> | n/a | yes |
| <a name="input_helm_config"></a> [helm\_config](#input\_helm\_config) | Object to hold helm values | <pre>object({<br>    name             = string<br>    namespace        = string<br>    create_namespace = bool<br>    description      = string<br>    version          = string<br>    repository       = string<br>  })</pre> | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region for deploying resources | `string` | n/a | yes |
| <a name="input_tag_prefix"></a> [tag\_prefix](#input\_tag\_prefix) | Prefix tag for VPCs | `string` | n/a | yes |
| <a name="input_vault_image"></a> [vault\_image](#input\_vault\_image) | Image name and tag for Vault | `string` | n/a | yes |
| <a name="input_vault_k8s_image"></a> [vault\_k8s\_image](#input\_vault\_k8s\_image) | Image name and tag for Vault-K8S | `string` | n/a | yes |
| <a name="input_vpc_data"></a> [vpc\_data](#input\_vpc\_data) | Data required to be passed to VPC module | <pre>object({<br>    cidr                 = string<br>    public_subnet_cidrs  = list(string)<br>    private_subnet_cidrs = list(string)<br>    availability_zones   = list(string)<br>  })</pre> | n/a | yes |

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
</details>
