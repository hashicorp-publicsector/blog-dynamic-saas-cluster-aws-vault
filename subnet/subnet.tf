resource "aws_subnet" "tfer--subnet-064df4607d2ab5033" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.31.16.0/20"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"
  vpc_id                                         = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-059891a253dc890a9_id}"
}

resource "aws_subnet" "tfer--subnet-06cdafe8b8b7e6136" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.31.0.0/20"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"
  vpc_id                                         = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-059891a253dc890a9_id}"
}

resource "aws_subnet" "tfer--subnet-08246d15d42ea7df4" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.31.32.0/20"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"
  vpc_id                                         = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-059891a253dc890a9_id}"
}

resource "aws_subnet" "tfer--subnet-09112b61ede365b83" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.0.16.0/27"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "project-subnet-public2-us-east-2b"
  }

  tags_all = {
    Name = "project-subnet-public2-us-east-2b"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-05969b8cc3a694ea2_id}"
}

resource "aws_subnet" "tfer--subnet-0c0b89179c3b96ab5" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.2.96.0/19"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                                          = "eksctl-dynamic-policy-saas-cluster/SubnetPrivateUSEAST2B"
    "alpha.eksctl.io/cluster-name"                = "dynamic-policy-saas"
    "alpha.eksctl.io/cluster-oidc-enabled"        = "true"
    "alpha.eksctl.io/eksctl-version"              = "0.127.0"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "dynamic-policy-saas"
    "kubernetes.io/role/internal-elb"             = "1"
  }

  tags_all = {
    Name                                          = "eksctl-dynamic-policy-saas-cluster/SubnetPrivateUSEAST2B"
    "alpha.eksctl.io/cluster-name"                = "dynamic-policy-saas"
    "alpha.eksctl.io/cluster-oidc-enabled"        = "true"
    "alpha.eksctl.io/eksctl-version"              = "0.127.0"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "dynamic-policy-saas"
    "kubernetes.io/role/internal-elb"             = "1"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-0138d6dfeec6e6c66_id}"
}

resource "aws_subnet" "tfer--subnet-0c67377d6c70a419c" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.2.64.0/19"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                                          = "eksctl-dynamic-policy-saas-cluster/SubnetPrivateUSEAST2A"
    "alpha.eksctl.io/cluster-name"                = "dynamic-policy-saas"
    "alpha.eksctl.io/cluster-oidc-enabled"        = "true"
    "alpha.eksctl.io/eksctl-version"              = "0.127.0"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "dynamic-policy-saas"
    "kubernetes.io/role/internal-elb"             = "1"
  }

  tags_all = {
    Name                                          = "eksctl-dynamic-policy-saas-cluster/SubnetPrivateUSEAST2A"
    "alpha.eksctl.io/cluster-name"                = "dynamic-policy-saas"
    "alpha.eksctl.io/cluster-oidc-enabled"        = "true"
    "alpha.eksctl.io/eksctl-version"              = "0.127.0"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "dynamic-policy-saas"
    "kubernetes.io/role/internal-elb"             = "1"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-0138d6dfeec6e6c66_id}"
}

resource "aws_subnet" "tfer--subnet-0d873fbb6f8dcb783" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.0.0.0/27"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "project-subnet-public1-us-east-2a"
  }

  tags_all = {
    Name = "project-subnet-public1-us-east-2a"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-05969b8cc3a694ea2_id}"
}
