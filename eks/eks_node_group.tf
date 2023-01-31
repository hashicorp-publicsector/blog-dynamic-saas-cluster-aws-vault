resource "aws_eks_node_group" "tfer--nodegroup" {
  ami_type       = "AL2_x86_64"
  capacity_type  = "ON_DEMAND"
  cluster_name   = "${aws_eks_cluster.tfer--dynamic-policy-saas.name}"
  disk_size      = "0"
  instance_types = ["t3.medium", "t3a.medium"]

  labels = {
    "alpha.eksctl.io/cluster-name"   = "dynamic-policy-saas"
    "alpha.eksctl.io/nodegroup-name" = "nodegroup"
  }

  launch_template {
    name    = "eksctl-dynamic-policy-saas-nodegroup-nodegroup"
    version = "1"
  }

  node_group_name = "nodegroup"
  node_role_arn   = "arn:aws:iam::591976937045:role/eksctl-dynamic-policy-saas-nodegr-NodeInstanceRole-1IV221YYCCQET"
  release_version = "1.24.7-20230105"

  scaling_config {
    desired_size = "2"
    max_size     = "2"
    min_size     = "2"
  }

  subnet_ids = ["subnet-0c0b89179c3b96ab5", "subnet-0c67377d6c70a419c"]

  tags = {
    "alpha.eksctl.io/cluster-name"                = "dynamic-policy-saas"
    "alpha.eksctl.io/eksctl-version"              = "0.127.0"
    "alpha.eksctl.io/nodegroup-name"              = "nodegroup"
    "alpha.eksctl.io/nodegroup-type"              = "managed"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "dynamic-policy-saas"
  }

  tags_all = {
    "alpha.eksctl.io/cluster-name"                = "dynamic-policy-saas"
    "alpha.eksctl.io/eksctl-version"              = "0.127.0"
    "alpha.eksctl.io/nodegroup-name"              = "nodegroup"
    "alpha.eksctl.io/nodegroup-type"              = "managed"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "dynamic-policy-saas"
  }

  update_config {
    max_unavailable = "1"
  }

  version = "1.24"
}
