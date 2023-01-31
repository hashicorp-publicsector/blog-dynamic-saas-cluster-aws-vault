resource "aws_network_interface" "tfer--eni-0034fd5feb10d6dde" {
  attachment {
    device_index = "2"
    instance     = "i-0494ad4d4f5fb818b"
  }

  description        = "aws-K8S-i-0494ad4d4f5fb818b"
  interface_type     = "interface"
  ipv4_prefix_count  = "0"
  ipv6_address_count = "0"
  ipv6_prefix_count  = "0"
  private_ip         = "10.2.76.59"
  private_ip_list    = ["10.2.76.59", "10.2.77.172", "10.2.84.161", "10.2.85.205", "10.2.86.122", "10.2.95.225"]
  private_ips        = ["10.2.76.59", "10.2.77.172", "10.2.84.161", "10.2.85.205", "10.2.86.122", "10.2.95.225"]
  private_ips_count  = "5"
  security_groups    = ["sg-042cf2425dd6b9d0e"]
  source_dest_check  = "true"
  subnet_id          = "subnet-0c67377d6c70a419c"

  tags = {
    "node.k8s.amazonaws.com/createdAt"   = "2023-01-28T11:31:12Z"
    "node.k8s.amazonaws.com/instance_id" = "i-0494ad4d4f5fb818b"
  }

  tags_all = {
    "node.k8s.amazonaws.com/createdAt"   = "2023-01-28T11:31:12Z"
    "node.k8s.amazonaws.com/instance_id" = "i-0494ad4d4f5fb818b"
  }
}

resource "aws_network_interface" "tfer--eni-0042248020e68e391" {
  description        = "VPC Endpoint Interface vpce-09bac9c04748eb7e1"
  interface_type     = "vpc_endpoint"
  ipv4_prefix_count  = "0"
  ipv6_address_count = "0"
  ipv6_prefix_count  = "0"
  private_ip         = "10.2.101.253"
  private_ip_list    = ["10.2.101.253"]
  private_ips        = ["10.2.101.253"]
  private_ips_count  = "0"
  security_groups    = ["sg-0847ec4fa0e080c33"]
  source_dest_check  = "true"
  subnet_id          = "subnet-0c0b89179c3b96ab5"
}

resource "aws_network_interface" "tfer--eni-007ed50192d62f4b9" {
  description        = "VPC Endpoint Interface vpce-0344c28ff4e1626a9"
  interface_type     = "vpc_endpoint"
  ipv4_prefix_count  = "0"
  ipv6_address_count = "0"
  ipv6_prefix_count  = "0"
  private_ip         = "10.2.98.15"
  private_ip_list    = ["10.2.98.15"]
  private_ips        = ["10.2.98.15"]
  private_ips_count  = "0"
  security_groups    = ["sg-0847ec4fa0e080c33"]
  source_dest_check  = "true"
  subnet_id          = "subnet-0c0b89179c3b96ab5"
}

resource "aws_network_interface" "tfer--eni-030ee98fdc114ef94" {
  attachment {
    device_index = "0"
    instance     = "i-0494ad4d4f5fb818b"
  }

  interface_type     = "interface"
  ipv4_prefix_count  = "0"
  ipv6_address_count = "0"
  ipv6_prefix_count  = "0"
  private_ip         = "10.2.87.65"
  private_ip_list    = ["10.2.72.88", "10.2.73.208", "10.2.87.19", "10.2.87.65", "10.2.88.103", "10.2.89.2"]
  private_ips        = ["10.2.72.88", "10.2.73.208", "10.2.87.19", "10.2.87.65", "10.2.88.103", "10.2.89.2"]
  private_ips_count  = "5"
  security_groups    = ["sg-042cf2425dd6b9d0e"]
  source_dest_check  = "true"
  subnet_id          = "subnet-0c67377d6c70a419c"

  tags = {
    "node.k8s.amazonaws.com/instance_id" = "i-0494ad4d4f5fb818b"
  }

  tags_all = {
    "node.k8s.amazonaws.com/instance_id" = "i-0494ad4d4f5fb818b"
  }
}

resource "aws_network_interface" "tfer--eni-03802f721968118ba" {
  description        = "VPC Endpoint Interface vpce-0b3f02aace8e6ac8e"
  interface_type     = "vpc_endpoint"
  ipv4_prefix_count  = "0"
  ipv6_address_count = "0"
  ipv6_prefix_count  = "0"
  private_ip         = "10.2.78.47"
  private_ip_list    = ["10.2.78.47"]
  private_ips        = ["10.2.78.47"]
  private_ips_count  = "0"
  security_groups    = ["sg-0b113933449d06ce3"]
  source_dest_check  = "true"
  subnet_id          = "subnet-0c67377d6c70a419c"
}

resource "aws_network_interface" "tfer--eni-04a8d1504f4655b79" {
  description        = "VPC Endpoint Interface vpce-015de89f0b7080625"
  interface_type     = "vpc_endpoint"
  ipv4_prefix_count  = "0"
  ipv6_address_count = "0"
  ipv6_prefix_count  = "0"
  private_ip         = "10.2.116.106"
  private_ip_list    = ["10.2.116.106"]
  private_ips        = ["10.2.116.106"]
  private_ips_count  = "0"
  security_groups    = ["sg-0847ec4fa0e080c33"]
  source_dest_check  = "true"
  subnet_id          = "subnet-0c0b89179c3b96ab5"
}

resource "aws_network_interface" "tfer--eni-0553edd4ecbff0968" {
  description        = "VPC Endpoint Interface vpce-0c5e58e4b4dcc26ec"
  interface_type     = "vpc_endpoint"
  ipv4_prefix_count  = "0"
  ipv6_address_count = "0"
  ipv6_prefix_count  = "0"
  private_ip         = "10.2.97.137"
  private_ip_list    = ["10.2.97.137"]
  private_ips        = ["10.2.97.137"]
  private_ips_count  = "0"
  security_groups    = ["sg-0847ec4fa0e080c33"]
  source_dest_check  = "true"
  subnet_id          = "subnet-0c0b89179c3b96ab5"
}

resource "aws_network_interface" "tfer--eni-05c7184368c87643b" {
  description        = "VPC Endpoint Interface vpce-015de89f0b7080625"
  interface_type     = "vpc_endpoint"
  ipv4_prefix_count  = "0"
  ipv6_address_count = "0"
  ipv6_prefix_count  = "0"
  private_ip         = "10.2.72.93"
  private_ip_list    = ["10.2.72.93"]
  private_ips        = ["10.2.72.93"]
  private_ips_count  = "0"
  security_groups    = ["sg-0847ec4fa0e080c33"]
  source_dest_check  = "true"
  subnet_id          = "subnet-0c67377d6c70a419c"
}

resource "aws_network_interface" "tfer--eni-0791a8771015756f6" {
  description        = "VPC Endpoint Interface vpce-0c5e58e4b4dcc26ec"
  interface_type     = "vpc_endpoint"
  ipv4_prefix_count  = "0"
  ipv6_address_count = "0"
  ipv6_prefix_count  = "0"
  private_ip         = "10.2.74.84"
  private_ip_list    = ["10.2.74.84"]
  private_ips        = ["10.2.74.84"]
  private_ips_count  = "0"
  security_groups    = ["sg-0847ec4fa0e080c33"]
  source_dest_check  = "true"
  subnet_id          = "subnet-0c67377d6c70a419c"
}

resource "aws_network_interface" "tfer--eni-0794d780e55f9579a" {
  attachment {
    device_index = "1"
    instance     = "i-023e25e6ce7e85ca8"
  }

  description        = "aws-K8S-i-023e25e6ce7e85ca8"
  interface_type     = "interface"
  ipv4_prefix_count  = "0"
  ipv6_address_count = "0"
  ipv6_prefix_count  = "0"
  private_ip         = "10.2.98.242"
  private_ip_list    = ["10.2.100.119", "10.2.102.122", "10.2.103.137", "10.2.122.202", "10.2.127.62", "10.2.98.242"]
  private_ips        = ["10.2.100.119", "10.2.102.122", "10.2.103.137", "10.2.122.202", "10.2.127.62", "10.2.98.242"]
  private_ips_count  = "5"
  security_groups    = ["sg-042cf2425dd6b9d0e"]
  source_dest_check  = "true"
  subnet_id          = "subnet-0c0b89179c3b96ab5"

  tags = {
    "node.k8s.amazonaws.com/createdAt"   = "2023-01-28T08:00:55Z"
    "node.k8s.amazonaws.com/instance_id" = "i-023e25e6ce7e85ca8"
  }

  tags_all = {
    "node.k8s.amazonaws.com/createdAt"   = "2023-01-28T08:00:55Z"
    "node.k8s.amazonaws.com/instance_id" = "i-023e25e6ce7e85ca8"
  }
}

resource "aws_network_interface" "tfer--eni-08aa391197bba45a2" {
  attachment {
    device_index = "1"
    instance     = "i-0494ad4d4f5fb818b"
  }

  description        = "aws-K8S-i-0494ad4d4f5fb818b"
  interface_type     = "interface"
  ipv4_prefix_count  = "0"
  ipv6_address_count = "0"
  ipv6_prefix_count  = "0"
  private_ip         = "10.2.87.117"
  private_ip_list    = ["10.2.64.92", "10.2.68.124", "10.2.74.169", "10.2.83.164", "10.2.87.117", "10.2.94.163"]
  private_ips        = ["10.2.64.92", "10.2.68.124", "10.2.74.169", "10.2.83.164", "10.2.87.117", "10.2.94.163"]
  private_ips_count  = "5"
  security_groups    = ["sg-042cf2425dd6b9d0e"]
  source_dest_check  = "true"
  subnet_id          = "subnet-0c67377d6c70a419c"

  tags = {
    "node.k8s.amazonaws.com/createdAt"   = "2023-01-28T07:58:22Z"
    "node.k8s.amazonaws.com/instance_id" = "i-0494ad4d4f5fb818b"
  }

  tags_all = {
    "node.k8s.amazonaws.com/createdAt"   = "2023-01-28T07:58:22Z"
    "node.k8s.amazonaws.com/instance_id" = "i-0494ad4d4f5fb818b"
  }
}

resource "aws_network_interface" "tfer--eni-08edf6c4214d1f90a" {
  description        = "Amazon EKS dynamic-policy-saas"
  interface_type     = "interface"
  ipv4_prefix_count  = "0"
  ipv6_address_count = "0"
  ipv6_prefix_count  = "0"
  private_ip         = "10.2.83.195"
  private_ip_list    = ["10.2.83.195"]
  private_ips        = ["10.2.83.195"]
  private_ips_count  = "0"
  security_groups    = ["sg-042cf2425dd6b9d0e", "sg-0b8d0c02ca96ef3e4"]
  source_dest_check  = "true"
  subnet_id          = "subnet-0c67377d6c70a419c"
}

resource "aws_network_interface" "tfer--eni-095c08ff42b0f541e" {
  description        = "VPC Endpoint Interface vpce-05a4d422b34dba36f"
  interface_type     = "vpc_endpoint"
  ipv4_prefix_count  = "0"
  ipv6_address_count = "0"
  ipv6_prefix_count  = "0"
  private_ip         = "10.2.126.155"
  private_ip_list    = ["10.2.126.155"]
  private_ips        = ["10.2.126.155"]
  private_ips_count  = "0"
  security_groups    = ["sg-0847ec4fa0e080c33"]
  source_dest_check  = "true"
  subnet_id          = "subnet-0c0b89179c3b96ab5"
}

resource "aws_network_interface" "tfer--eni-0a3944d6126f24eb0" {
  description        = "VPC Endpoint Interface vpce-05a4d422b34dba36f"
  interface_type     = "vpc_endpoint"
  ipv4_prefix_count  = "0"
  ipv6_address_count = "0"
  ipv6_prefix_count  = "0"
  private_ip         = "10.2.89.59"
  private_ip_list    = ["10.2.89.59"]
  private_ips        = ["10.2.89.59"]
  private_ips_count  = "0"
  security_groups    = ["sg-0847ec4fa0e080c33"]
  source_dest_check  = "true"
  subnet_id          = "subnet-0c67377d6c70a419c"
}

resource "aws_network_interface" "tfer--eni-0a45299b13b24f688" {
  attachment {
    device_index = "0"
    instance     = "i-0ce2e18fb31c47343"
  }

  description        = "ENI for AWS Cloud9 environment aws-cloud9-blogtest2-e8ab0a6f64114a0e9ed7cb75168ee110"
  interface_type     = "interface"
  ipv4_prefix_count  = "0"
  ipv6_address_count = "0"
  ipv6_prefix_count  = "0"
  private_ip         = "10.0.0.27"
  private_ip_list    = ["10.0.0.27"]
  private_ips        = ["10.0.0.27"]
  private_ips_count  = "0"
  security_groups    = ["sg-058b688409d9a1e14"]
  source_dest_check  = "true"
  subnet_id          = "subnet-0d873fbb6f8dcb783"
}

resource "aws_network_interface" "tfer--eni-0a4732dadefa12528" {
  description        = "Amazon EKS dynamic-policy-saas"
  interface_type     = "interface"
  ipv4_prefix_count  = "0"
  ipv6_address_count = "0"
  ipv6_prefix_count  = "0"
  private_ip         = "10.2.109.50"
  private_ip_list    = ["10.2.109.50"]
  private_ips        = ["10.2.109.50"]
  private_ips_count  = "0"
  security_groups    = ["sg-042cf2425dd6b9d0e", "sg-0b8d0c02ca96ef3e4"]
  source_dest_check  = "true"
  subnet_id          = "subnet-0c0b89179c3b96ab5"
}

resource "aws_network_interface" "tfer--eni-0d484bb030fbc5c0a" {
  attachment {
    device_index = "2"
    instance     = "i-023e25e6ce7e85ca8"
  }

  description        = "aws-K8S-i-023e25e6ce7e85ca8"
  interface_type     = "interface"
  ipv4_prefix_count  = "0"
  ipv6_address_count = "0"
  ipv6_prefix_count  = "0"
  private_ip         = "10.2.124.158"
  private_ip_list    = ["10.2.102.47", "10.2.112.165", "10.2.113.87", "10.2.116.95", "10.2.124.158", "10.2.99.95"]
  private_ips        = ["10.2.102.47", "10.2.112.165", "10.2.113.87", "10.2.116.95", "10.2.124.158", "10.2.99.95"]
  private_ips_count  = "5"
  security_groups    = ["sg-042cf2425dd6b9d0e"]
  source_dest_check  = "true"
  subnet_id          = "subnet-0c0b89179c3b96ab5"

  tags = {
    "node.k8s.amazonaws.com/createdAt"   = "2023-01-28T11:31:30Z"
    "node.k8s.amazonaws.com/instance_id" = "i-023e25e6ce7e85ca8"
  }

  tags_all = {
    "node.k8s.amazonaws.com/createdAt"   = "2023-01-28T11:31:30Z"
    "node.k8s.amazonaws.com/instance_id" = "i-023e25e6ce7e85ca8"
  }
}

resource "aws_network_interface" "tfer--eni-0d489f7faa50f1eae" {
  attachment {
    device_index = "0"
    instance     = "i-023e25e6ce7e85ca8"
  }

  interface_type     = "interface"
  ipv4_prefix_count  = "0"
  ipv6_address_count = "0"
  ipv6_prefix_count  = "0"
  private_ip         = "10.2.112.104"
  private_ip_list    = ["10.2.101.4", "10.2.112.104", "10.2.112.245", "10.2.120.107", "10.2.126.2", "10.2.96.11"]
  private_ips        = ["10.2.101.4", "10.2.112.104", "10.2.112.245", "10.2.120.107", "10.2.126.2", "10.2.96.11"]
  private_ips_count  = "5"
  security_groups    = ["sg-042cf2425dd6b9d0e"]
  source_dest_check  = "true"
  subnet_id          = "subnet-0c0b89179c3b96ab5"

  tags = {
    "node.k8s.amazonaws.com/instance_id" = "i-023e25e6ce7e85ca8"
  }

  tags_all = {
    "node.k8s.amazonaws.com/instance_id" = "i-023e25e6ce7e85ca8"
  }
}

resource "aws_network_interface" "tfer--eni-0dbfac03ab8509798" {
  description        = "VPC Endpoint Interface vpce-09bac9c04748eb7e1"
  interface_type     = "vpc_endpoint"
  ipv4_prefix_count  = "0"
  ipv6_address_count = "0"
  ipv6_prefix_count  = "0"
  private_ip         = "10.2.88.86"
  private_ip_list    = ["10.2.88.86"]
  private_ips        = ["10.2.88.86"]
  private_ips_count  = "0"
  security_groups    = ["sg-0847ec4fa0e080c33"]
  source_dest_check  = "true"
  subnet_id          = "subnet-0c67377d6c70a419c"
}

resource "aws_network_interface" "tfer--eni-0e67ef9d6f125d1aa" {
  description        = "VPC Endpoint Interface vpce-0b3f02aace8e6ac8e"
  interface_type     = "vpc_endpoint"
  ipv4_prefix_count  = "0"
  ipv6_address_count = "0"
  ipv6_prefix_count  = "0"
  private_ip         = "10.2.123.130"
  private_ip_list    = ["10.2.123.130"]
  private_ips        = ["10.2.123.130"]
  private_ips_count  = "0"
  security_groups    = ["sg-0b113933449d06ce3"]
  source_dest_check  = "true"
  subnet_id          = "subnet-0c0b89179c3b96ab5"
}

resource "aws_network_interface" "tfer--eni-0f88f395c08b05374" {
  description        = "VPC Endpoint Interface vpce-0344c28ff4e1626a9"
  interface_type     = "vpc_endpoint"
  ipv4_prefix_count  = "0"
  ipv6_address_count = "0"
  ipv6_prefix_count  = "0"
  private_ip         = "10.2.74.65"
  private_ip_list    = ["10.2.74.65"]
  private_ips        = ["10.2.74.65"]
  private_ips_count  = "0"
  security_groups    = ["sg-0847ec4fa0e080c33"]
  source_dest_check  = "true"
  subnet_id          = "subnet-0c67377d6c70a419c"
}
