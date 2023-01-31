resource "aws_vpc" "tfer--vpc-0138d6dfeec6e6c66" {
  assign_generated_ipv6_cidr_block     = "false"
  cidr_block                           = "10.2.0.0/16"
  enable_classiclink                   = "false"
  enable_classiclink_dns_support       = "false"
  enable_dns_hostnames                 = "true"
  enable_dns_support                   = "true"
  enable_network_address_usage_metrics = "false"
  instance_tenancy                     = "default"
  ipv6_netmask_length                  = "0"

  tags = {
    Name                                          = "eksctl-dynamic-policy-saas-cluster/VPC"
    "alpha.eksctl.io/cluster-name"                = "dynamic-policy-saas"
    "alpha.eksctl.io/cluster-oidc-enabled"        = "true"
    "alpha.eksctl.io/eksctl-version"              = "0.127.0"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "dynamic-policy-saas"
  }

  tags_all = {
    Name                                          = "eksctl-dynamic-policy-saas-cluster/VPC"
    "alpha.eksctl.io/cluster-name"                = "dynamic-policy-saas"
    "alpha.eksctl.io/cluster-oidc-enabled"        = "true"
    "alpha.eksctl.io/eksctl-version"              = "0.127.0"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "dynamic-policy-saas"
  }
}

resource "aws_vpc" "tfer--vpc-05969b8cc3a694ea2" {
  assign_generated_ipv6_cidr_block     = "false"
  cidr_block                           = "10.0.0.0/16"
  enable_classiclink                   = "false"
  enable_classiclink_dns_support       = "false"
  enable_dns_hostnames                 = "true"
  enable_dns_support                   = "true"
  enable_network_address_usage_metrics = "false"
  instance_tenancy                     = "default"
  ipv6_netmask_length                  = "0"

  tags = {
    Name = "project-vpc"
  }

  tags_all = {
    Name = "project-vpc"
  }
}

resource "aws_vpc" "tfer--vpc-059891a253dc890a9" {
  assign_generated_ipv6_cidr_block     = "false"
  cidr_block                           = "172.31.0.0/16"
  enable_classiclink                   = "false"
  enable_classiclink_dns_support       = "false"
  enable_dns_hostnames                 = "true"
  enable_dns_support                   = "true"
  enable_network_address_usage_metrics = "false"
  instance_tenancy                     = "default"
  ipv6_netmask_length                  = "0"
}
