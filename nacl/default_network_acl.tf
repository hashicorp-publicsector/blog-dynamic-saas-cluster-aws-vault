resource "aws_default_network_acl" "tfer--acl-02306b73ff9e2c975" {
  egress {
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = "0"
    icmp_code  = "0"
    icmp_type  = "0"
    protocol   = "-1"
    rule_no    = "100"
    to_port    = "0"
  }

  ingress {
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = "0"
    icmp_code  = "0"
    icmp_type  = "0"
    protocol   = "-1"
    rule_no    = "100"
    to_port    = "0"
  }

  subnet_ids = ["${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-09112b61ede365b83_id}", "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-0d873fbb6f8dcb783_id}"]
}

resource "aws_default_network_acl" "tfer--acl-068770194d5247fbf" {
  egress {
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = "0"
    icmp_code  = "0"
    icmp_type  = "0"
    protocol   = "-1"
    rule_no    = "100"
    to_port    = "0"
  }

  ingress {
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = "0"
    icmp_code  = "0"
    icmp_type  = "0"
    protocol   = "-1"
    rule_no    = "100"
    to_port    = "0"
  }

  subnet_ids = ["${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-064df4607d2ab5033_id}", "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-06cdafe8b8b7e6136_id}", "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-08246d15d42ea7df4_id}"]
}

resource "aws_default_network_acl" "tfer--acl-08730512dd3fd4a02" {
  egress {
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = "0"
    icmp_code  = "0"
    icmp_type  = "0"
    protocol   = "-1"
    rule_no    = "100"
    to_port    = "0"
  }

  ingress {
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = "0"
    icmp_code  = "0"
    icmp_type  = "0"
    protocol   = "-1"
    rule_no    = "100"
    to_port    = "0"
  }

  subnet_ids = ["${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-0c0b89179c3b96ab5_id}", "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-0c67377d6c70a419c_id}"]
}
