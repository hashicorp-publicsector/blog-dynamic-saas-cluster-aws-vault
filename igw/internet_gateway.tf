resource "aws_internet_gateway" "tfer--igw-040a85d3eba854b61" {
  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-059891a253dc890a9_id}"
}

resource "aws_internet_gateway" "tfer--igw-0e6139e7bf31c95b0" {
  tags = {
    Name = "project-igw"
  }

  tags_all = {
    Name = "project-igw"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-05969b8cc3a694ea2_id}"
}
