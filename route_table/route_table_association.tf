resource "aws_route_table_association" "tfer--subnet-09112b61ede365b83" {
  route_table_id = "${data.terraform_remote_state.route_table.outputs.aws_route_table_tfer--rtb-0e6932a7d31dfc077_id}"
  subnet_id      = "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-09112b61ede365b83_id}"
}

resource "aws_route_table_association" "tfer--subnet-0c0b89179c3b96ab5" {
  route_table_id = "${data.terraform_remote_state.route_table.outputs.aws_route_table_tfer--rtb-0860d87d495dab704_id}"
  subnet_id      = "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-0c0b89179c3b96ab5_id}"
}

resource "aws_route_table_association" "tfer--subnet-0c67377d6c70a419c" {
  route_table_id = "${data.terraform_remote_state.route_table.outputs.aws_route_table_tfer--rtb-0996f33e41287b6ce_id}"
  subnet_id      = "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-0c67377d6c70a419c_id}"
}

resource "aws_route_table_association" "tfer--subnet-0d873fbb6f8dcb783" {
  route_table_id = "${data.terraform_remote_state.route_table.outputs.aws_route_table_tfer--rtb-0e6932a7d31dfc077_id}"
  subnet_id      = "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-0d873fbb6f8dcb783_id}"
}
