resource "aws_main_route_table_association" "tfer--vpc-0138d6dfeec6e6c66" {
  route_table_id = "${data.terraform_remote_state.route_table.outputs.aws_route_table_tfer--rtb-03d025da90708f5c6_id}"
  vpc_id         = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-0138d6dfeec6e6c66_id}"
}

resource "aws_main_route_table_association" "tfer--vpc-05969b8cc3a694ea2" {
  route_table_id = "${data.terraform_remote_state.route_table.outputs.aws_route_table_tfer--rtb-00d588d14a7c717ae_id}"
  vpc_id         = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-05969b8cc3a694ea2_id}"
}

resource "aws_main_route_table_association" "tfer--vpc-059891a253dc890a9" {
  route_table_id = "${data.terraform_remote_state.route_table.outputs.aws_route_table_tfer--rtb-03a08a60385a25f08_id}"
  vpc_id         = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-059891a253dc890a9_id}"
}
