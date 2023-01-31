resource "aws_security_group" "tfer--aws-cloud9-blogtest2-e8ab0a6f64114a0e9ed7cb75168ee110-InstanceSecurityGroup-QJFMLTA1U9Z9_sg-058b688409d9a1e14" {
  description = "Security group for AWS Cloud9 environment aws-cloud9-blogtest2-e8ab0a6f64114a0e9ed7cb75168ee110"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  name = "aws-cloud9-blogtest2-e8ab0a6f64114a0e9ed7cb75168ee110-InstanceSecurityGroup-QJFMLTA1U9Z9"

  tags = {
    Name = "aws-cloud9-blogtest2-e8ab0a6f64114a0e9ed7cb75168ee110"
  }

  tags_all = {
    Name = "aws-cloud9-blogtest2-e8ab0a6f64114a0e9ed7cb75168ee110"
  }

  vpc_id = "vpc-05969b8cc3a694ea2"
}

resource "aws_security_group" "tfer--default_sg-007f8df04ef148f39" {
  description = "default VPC security group"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    from_port = "0"
    protocol  = "-1"
    self      = "true"
    to_port   = "0"
  }

  name   = "default"
  vpc_id = "vpc-05969b8cc3a694ea2"
}

resource "aws_security_group" "tfer--default_sg-0632013fb570c3b3f" {
  description = "default VPC security group"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    from_port = "0"
    protocol  = "-1"
    self      = "true"
    to_port   = "0"
  }

  name   = "default"
  vpc_id = "vpc-059891a253dc890a9"
}

resource "aws_security_group" "tfer--default_sg-0b113933449d06ce3" {
  description = "default VPC security group"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    from_port = "0"
    protocol  = "-1"
    self      = "true"
    to_port   = "0"
  }

  name   = "default"
  vpc_id = "vpc-0138d6dfeec6e6c66"
}

resource "aws_security_group" "tfer--eks-cluster-sg-dynamic-policy-saas-1549907501_sg-042cf2425dd6b9d0e" {
  description = "EKS created security group applied to ENI that is attached to EKS Control Plane master nodes, as well as any managed workloads."
  name        = "eks-cluster-sg-dynamic-policy-saas-1549907501"

  tags = {
    Name                                        = "eks-cluster-sg-dynamic-policy-saas-1549907501"
    "kubernetes.io/cluster/dynamic-policy-saas" = "owned"
  }

  tags_all = {
    Name                                        = "eks-cluster-sg-dynamic-policy-saas-1549907501"
    "kubernetes.io/cluster/dynamic-policy-saas" = "owned"
  }

  vpc_id = "vpc-0138d6dfeec6e6c66"
}

resource "aws_security_group" "tfer--eksctl-dynamic-policy-saas-cluster-ClusterSharedNodeSecurityGroup-VA4S21Y5D6LX_sg-0847ec4fa0e080c33" {
  description = "Communication between all nodes in the cluster"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    description     = "Allow managed and unmanaged nodes to communicate with each other (all ports)"
    from_port       = "0"
    protocol        = "-1"
    security_groups = ["${data.terraform_remote_state.sg.outputs.aws_security_group_tfer--eks-cluster-sg-dynamic-policy-saas-1549907501_sg-042cf2425dd6b9d0e_id}"]
    self            = "false"
    to_port         = "0"
  }

  ingress {
    description = "Allow nodes to communicate with each other (all ports)"
    from_port   = "0"
    protocol    = "-1"
    self        = "true"
    to_port     = "0"
  }

  name = "eksctl-dynamic-policy-saas-cluster-ClusterSharedNodeSecurityGroup-VA4S21Y5D6LX"

  tags = {
    Name                                          = "eksctl-dynamic-policy-saas-cluster/ClusterSharedNodeSecurityGroup"
    "alpha.eksctl.io/cluster-name"                = "dynamic-policy-saas"
    "alpha.eksctl.io/cluster-oidc-enabled"        = "true"
    "alpha.eksctl.io/eksctl-version"              = "0.127.0"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "dynamic-policy-saas"
  }

  tags_all = {
    Name                                          = "eksctl-dynamic-policy-saas-cluster/ClusterSharedNodeSecurityGroup"
    "alpha.eksctl.io/cluster-name"                = "dynamic-policy-saas"
    "alpha.eksctl.io/cluster-oidc-enabled"        = "true"
    "alpha.eksctl.io/eksctl-version"              = "0.127.0"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "dynamic-policy-saas"
  }

  vpc_id = "vpc-0138d6dfeec6e6c66"
}

resource "aws_security_group" "tfer--eksctl-dynamic-policy-saas-cluster-ControlPlaneSecurityGroup-CT1XKPO69BLM_sg-0b8d0c02ca96ef3e4" {
  description = "Communication between the control plane and worker nodegroups"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["10.0.0.27/32"]
    from_port   = "443"
    protocol    = "tcp"
    self        = "false"
    to_port     = "443"
  }

  name = "eksctl-dynamic-policy-saas-cluster-ControlPlaneSecurityGroup-CT1XKPO69BLM"

  tags = {
    Name                                          = "eksctl-dynamic-policy-saas-cluster/ControlPlaneSecurityGroup"
    "alpha.eksctl.io/cluster-name"                = "dynamic-policy-saas"
    "alpha.eksctl.io/cluster-oidc-enabled"        = "true"
    "alpha.eksctl.io/eksctl-version"              = "0.127.0"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "dynamic-policy-saas"
  }

  tags_all = {
    Name                                          = "eksctl-dynamic-policy-saas-cluster/ControlPlaneSecurityGroup"
    "alpha.eksctl.io/cluster-name"                = "dynamic-policy-saas"
    "alpha.eksctl.io/cluster-oidc-enabled"        = "true"
    "alpha.eksctl.io/eksctl-version"              = "0.127.0"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "dynamic-policy-saas"
  }

  vpc_id = "vpc-0138d6dfeec6e6c66"
}

resource "aws_security_group" "tfer--tempsg_sg-037c5f7c95727638e" {
  description = "ssh"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["73.191.115.146/32"]
    from_port   = "22"
    protocol    = "tcp"
    self        = "false"
    to_port     = "22"
  }

  name   = "tempsg"
  vpc_id = "vpc-059891a253dc890a9"
}
