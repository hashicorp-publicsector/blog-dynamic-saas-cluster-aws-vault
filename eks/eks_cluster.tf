resource "aws_eks_cluster" "tfer--dynamic-policy-saas" {
  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  encryption_config {
    provider {
      key_arn = "arn:aws:kms:us-east-2:591976937045:key/1e9f165b-cfec-4ca5-8a25-fbbb923c12f0"
    }

    resources = ["secrets"]
  }

  kubernetes_network_config {
    ip_family         = "ipv4"
    service_ipv4_cidr = "172.20.0.0/16"
  }

  name     = "dynamic-policy-saas"
  role_arn = "arn:aws:iam::591976937045:role/eksctl-dynamic-policy-saas-cluster-ServiceRole-1KY0S2H79QNW0"

  tags = {
    Name                                          = "eksctl-dynamic-policy-saas-cluster/ControlPlane"
    "alpha.eksctl.io/cluster-name"                = "dynamic-policy-saas"
    "alpha.eksctl.io/cluster-oidc-enabled"        = "true"
    "alpha.eksctl.io/eksctl-version"              = "0.127.0"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "dynamic-policy-saas"
  }

  tags_all = {
    Name                                          = "eksctl-dynamic-policy-saas-cluster/ControlPlane"
    "alpha.eksctl.io/cluster-name"                = "dynamic-policy-saas"
    "alpha.eksctl.io/cluster-oidc-enabled"        = "true"
    "alpha.eksctl.io/eksctl-version"              = "0.127.0"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "dynamic-policy-saas"
  }

  version = "1.24"

  vpc_config {
    endpoint_private_access = "true"
    endpoint_public_access  = "false"
    public_access_cidrs     = ["0.0.0.0/0"]
    security_group_ids      = ["${data.terraform_remote_state.sg.outputs.aws_security_group_tfer--eksctl-dynamic-policy-saas-cluster-ControlPlaneSecurityGroup-CT1XKPO69BLM_sg-0b8d0c02ca96ef3e4_id}"]
    subnet_ids              = ["${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-0c0b89179c3b96ab5_id}", "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-0c67377d6c70a419c_id}"]
  }
}
