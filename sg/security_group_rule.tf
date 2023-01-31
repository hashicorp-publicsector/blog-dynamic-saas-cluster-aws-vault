resource "aws_security_group_rule" "tfer--sg-042cf2425dd6b9d0e_egress_-1_-1_-1_0-002E-0-002E-0-002E-0-002F-0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = "0"
  protocol          = "-1"
  security_group_id = "${data.terraform_remote_state.sg.outputs.aws_security_group_tfer--eks-cluster-sg-dynamic-policy-saas-1549907501_sg-042cf2425dd6b9d0e_id}"
  to_port           = "0"
  type              = "egress"
}

resource "aws_security_group_rule" "tfer--sg-042cf2425dd6b9d0e_ingress_-1_-1_-1_sg-042cf2425dd6b9d0e" {
  from_port         = "0"
  protocol          = "-1"
  security_group_id = "${data.terraform_remote_state.sg.outputs.aws_security_group_tfer--eks-cluster-sg-dynamic-policy-saas-1549907501_sg-042cf2425dd6b9d0e_id}"
  self              = "true"
  to_port           = "0"
  type              = "ingress"
}

resource "aws_security_group_rule" "tfer--sg-042cf2425dd6b9d0e_ingress_-1_-1_-1_sg-0847ec4fa0e080c33" {
  description              = "Allow unmanaged nodes to communicate with control plane (all ports)"
  from_port                = "0"
  protocol                 = "-1"
  security_group_id        = "${data.terraform_remote_state.sg.outputs.aws_security_group_tfer--eks-cluster-sg-dynamic-policy-saas-1549907501_sg-042cf2425dd6b9d0e_id}"
  source_security_group_id = "${data.terraform_remote_state.sg.outputs.aws_security_group_tfer--eksctl-dynamic-policy-saas-cluster-ClusterSharedNodeSecurityGroup-VA4S21Y5D6LX_sg-0847ec4fa0e080c33_id}"
  to_port                  = "0"
  type                     = "ingress"
}
