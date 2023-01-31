resource "aws_route_table" "tfer--rtb-00d588d14a7c717ae" {
  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-05969b8cc3a694ea2_id}"
}

resource "aws_route_table" "tfer--rtb-03a08a60385a25f08" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-040a85d3eba854b61"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-059891a253dc890a9_id}"
}

resource "aws_route_table" "tfer--rtb-03d025da90708f5c6" {
  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-0138d6dfeec6e6c66_id}"
}

resource "aws_route_table" "tfer--rtb-0860d87d495dab704" {
  route {
    cidr_block                = "10.0.0.27/32"
    vpc_peering_connection_id = "pcx-0a4b5a82f9e30d23f"
  }

  tags = {
    Name                                          = "eksctl-dynamic-policy-saas-cluster/PrivateRouteTableUSEAST2B"
    "alpha.eksctl.io/cluster-name"                = "dynamic-policy-saas"
    "alpha.eksctl.io/cluster-oidc-enabled"        = "true"
    "alpha.eksctl.io/eksctl-version"              = "0.127.0"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "dynamic-policy-saas"
  }

  tags_all = {
    Name                                          = "eksctl-dynamic-policy-saas-cluster/PrivateRouteTableUSEAST2B"
    "alpha.eksctl.io/cluster-name"                = "dynamic-policy-saas"
    "alpha.eksctl.io/cluster-oidc-enabled"        = "true"
    "alpha.eksctl.io/eksctl-version"              = "0.127.0"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "dynamic-policy-saas"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-0138d6dfeec6e6c66_id}"
}

resource "aws_route_table" "tfer--rtb-0996f33e41287b6ce" {
  route {
    cidr_block                = "10.0.0.27/32"
    vpc_peering_connection_id = "pcx-0a4b5a82f9e30d23f"
  }

  tags = {
    Name                                          = "eksctl-dynamic-policy-saas-cluster/PrivateRouteTableUSEAST2A"
    "alpha.eksctl.io/cluster-name"                = "dynamic-policy-saas"
    "alpha.eksctl.io/cluster-oidc-enabled"        = "true"
    "alpha.eksctl.io/eksctl-version"              = "0.127.0"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "dynamic-policy-saas"
  }

  tags_all = {
    Name                                          = "eksctl-dynamic-policy-saas-cluster/PrivateRouteTableUSEAST2A"
    "alpha.eksctl.io/cluster-name"                = "dynamic-policy-saas"
    "alpha.eksctl.io/cluster-oidc-enabled"        = "true"
    "alpha.eksctl.io/eksctl-version"              = "0.127.0"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "dynamic-policy-saas"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-0138d6dfeec6e6c66_id}"
}

resource "aws_route_table" "tfer--rtb-0e6932a7d31dfc077" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-0e6139e7bf31c95b0"
  }

  route {
    cidr_block                = "10.2.0.0/16"
    vpc_peering_connection_id = "pcx-0a4b5a82f9e30d23f"
  }

  tags = {
    Name = "project-rtb-public"
  }

  tags_all = {
    Name = "project-rtb-public"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-05969b8cc3a694ea2_id}"
}
