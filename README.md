# SaaS Data Isolation with Dynamic Credentials Using Hashicorp Vault in Amazon EKS

The code shared here is intended to provide a sample implementation of SaaS Data Isolation with Dynamic Credentials Using HashiCorp Vault in Amazon EKS. The goal is to provide SaaS developers and architects with working code that will illustrate how multi-tenant SaaS applications can be design and delivered on AWS using HashiCorp Vault and Amazon EKS. The solution implements an identity model that simplifies the management of data access policies and credentials in isolated tenant environments. The focus here is more on giving developers a view into the working elements of the solution without going to the extent of making a full, production-ready solution.  

This is a repository utilizing [HashiCorp Terraform](https://www.hashicorp.com/products/terraform) and it's [providers](https://registry.terraform.io/providers/) to configure the architecture provided in the blog post [SaaS Data Isolation with Dynamic Credentials Using HashiCorp Vault in Amazon EKS](https://aws.amazon.com/blogs/apn/saas-data-isolation-with-dynamic-credentials-using-hashicorp-vault-in-amazon-eks/).

We will be using Terraform Cloud's free tier only to host the remote state, but instructions are provided for Terraform Cloud For Business/Enterprise customers as well in order to take advantage of Terraform Agents and automated deployment workflows.

## Prerequisites
<details>
<summary>click to expand</summary>

### Terraform CLI + Terraform Cloud
1. Download & Install Terraform CLI
1. Sign up for [Terraform Cloud](https://app.terraform.io) (it's free!):
    - Select "Start From Scratch"
    - Create an Organization Name
    - Paste your org name in `variables.auto.tfvars` and save
    - Run these commands

2. Download & Install git CLI
3. An AWS account

</details>

## Usage

<details>
<summary>Terraform Cloud Free Tier</summary>

This method uses the CLI-driven Workflow to provision a Cloud9 instance in AWS from your local workstation, and the remaining components of the deployment from the Cloud9 instance.

1. Clone the git repository to your local computer and navigate to the repository directory:  

    ```bash
    git clone [url]  
    cd blog-dynamic-saas-cluster-aws-vault/  
    ```

1. Authenticate With Terraform Cloud:
    - Run `terraform login`
    - Enter `yes` and create a new token from the GUI when prompted.  Save this token to a scratch file for later use.  DO NOT CHECK THIS TOKEN INTO SOURCE CONTROL.  
    - Update `variables.auto.tfvars` with the name of your Terraform Cloud Organization

1. Configure Terraform Cloud via these Terraform commands:  

    ```hcl  
    terraform init [press enter]
    terraform plan [press enter]
    terraform apply --auto-approve [press enter]
    ```

    We've now just created the required Terraform Cloud Workspaces to house our state files.

1. Navigate to the `deployment/cloud9` directory:
   - Edit `versions.tf` with your TFC Org Name and save
   - Ensure you have valid AWS credentials loaded in your Terminal where you will run Terraform for the next two steps.  

    **Note**:  Prior to running the commands in the next step, you will need to validate if the default AWSCloud9SSMAccessRole and AWSCloud9SSMInstanceProfile are in your AWS Account.  They will be if you've ever launched an SSM_Connect Cloud9 instance previously **via the GUI**.  If this is the case, set the `var.cloud9_default_role_exists` to true to prevent Terraform from attempting to create these.  You can set this value in the `variables.tf` file.  

    To check if the Instance Profile or Role already exist in your account, run the following commands

    ```bash  
    aws iam get-instance-profile --instance-profile AWSCloud9SSMInstanceProfile
    aws iam get-role --role-name AWSCloud9SSMAccessRole
    ```  

2. Run these Terraform commands in the cloud9 directory:  

    ```hcl  
    terraform init [press enter]
    terraform plan [press enter]
    terraform apply --auto-approve [press enter]
    ```

3. Once complete, Terraform will output the URL for Cloud9.  Paste this URL into your browser to access the newly-created Cloud9 instance.  **All the other cli based steps will be performed on the Cloud9 Instance**.  

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

6. In the Cloud9 IDE, **clone the repo** and resume provisioning with Terraform:
    - Click `Window` -> `New Terminal` and enter the following commands:
    - `cd blog-dynamic-saas-cluster-aws-vault/deployment/infra [press enter]`

1. Authenticate/Configure Terraform Cloud:
    - Run `terraform login`
    - Enter `yes` and on the second prompt, etner the Terraform Cloud API token from above when prompted
    - Edit `deployment/infra/versions.tf` with your TFC Org Name and save
    - Edit `deployment/infra/remote_state.tf` with your TFC Org Name and save.  This will reference the state of the previous run to get variables needed for this run.  We can utilize the state of other workspaces as data input for the current workspace!

1. Run the following:

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
    cd blog-dynamic-saas-cluster-aws-vault/scripts/ [press enter]
    chmod +x install-k8s-tools.sh
    ./install-k8s-tools.sh
    ```  

    This will install kubectl on the Cloud9 instance and set the alias k for kubectl, if you would like a shorthand method of invoking kubectl.

8. Initialize Vault:
    - In the same window as Step 7, cd into the vault directory
    ```bash
    cd blog-dynamic-saas-cluster-aws-vault/scripts/vault/ [press enter]
    chmod +x init-vault.sh
    ./init-vault.sh
    ```  

    This will initialize Vault.  Vault has been configured with Auto-Unseal utilizing AWS KMS.  This allows Vault to automatically unseal for operations.  We store the Recovery Keys and Root token in AWS Secrets Manager.  

9. Deploy Sample Silo Tenants:
    - Click `Window` -> `New Terminal` and enter the following commands:
    ```bash
    cd blog-dynamic-saas-cluster-aws-vault/scripts/silo/ [press enter]
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
      cd blog-dynamic-saas-cluster-aws-vault/scripts/test-cases/  
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
    cd blog-dynamic-saas-cluster-aws-vault/scripts/pool  
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
    cd blog-dynamic-saas-cluster-aws-vault/scripts/pool  
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
    cd blog-dynamic-saas-cluster-aws-vault/scripts/test-cases/  
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

<details>
<summary>Terraform Cloud For Business/Enterprise</summary>

This method uses the Terraform Agents + VCS-driven Workflow to automatically provision all of the infrastructure programmatically.

</details>

## Cleanup
<details>
<summary>click to expand</summary>


The deployed components can be cleaned up via the following procedure. We'll work in backwards order, destroying resources that were created most recently.  

### Cloud9 IDE

1. Run the cleanup script via a new terminal window  
    - Click `Window` -> `New Terminal` and enter the following commands:  
    ```bash  
    cd blog-dynamic-saas-cluster-aws-vault/scripts/cleanup/ [press enter]  
    chmod +x cleanup.sh  
    ./cleanup.sh  
    ```  

2. Destroy the infrastructure and resources created by Terraform  
    - In the same terminal window, navigate to `dynamic-saas-cluster-aws-vault/deployment/infra/` and run these commands:  
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
1. On your local workstation, destroy the Cloud9 environment created by Terraform Cloud:  
    `cd blog-dynamic-saas-cluster-aws-vault/deployment/cloud9 [press enter]`  

    ```hcl  
    terraform init [press enter]  
    terraform plan [press enter]  
    terraform destroy --auto-approve [press enter]  
    ```

1. Destroy the Terraform Cloud created by Terraform CLI:  
    `cd ../../ [press enter]`  (you should now be in the dynamic-saas-cluster-aws-vault/ directory)

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
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | ~>0.42.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.42.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_agent_pool.enterprise-agent-pool](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/agent_pool) | resource |
| [tfe_agent_token.enterprise-agent-pool-token](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/agent_token) | resource |
| [tfe_project.main](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/project) | resource |
| [tfe_workspace.enterprise-cloud9](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |
| [tfe_workspace.enterprise-infra](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |
| [tfe_workspace.free-cloud9](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |
| [tfe_workspace.free-infra](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |
| [tfe_organization.org](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tfc_tier"></a> [tfc\_tier](#input\_tfc\_tier) | n/a | `string` | `"free"` | no |
| <a name="input_tfe"></a> [tfe](#input\_tfe) | n/a | <pre>object({<br>    org        = string<br>    project    = string<br>    workspaces = map(string)<br>  })</pre> | <pre>{<br>  "org": "<org_name>",<br>  "project": "dynamic-saas-cluster-aws-vault",<br>  "workspaces": {<br>    "cloud9": "dynamic-saas-cluster-aws-cloud9",<br>    "infra": "dynamic-saas-cluster-aws-infra"<br>  }<br>}</pre> | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
</details>
