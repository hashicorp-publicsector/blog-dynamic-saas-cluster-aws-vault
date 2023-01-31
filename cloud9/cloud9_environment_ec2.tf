resource "aws_cloud9_environment_ec2" "tfer--e8ab0a6f64114a0e9ed7cb75168ee110" {
  connection_type = "CONNECT_SSM"
  name            = "blogtest2"
  owner_arn       = "arn:aws:sts::591976937045:assumed-role/aws_jay.aware_test-developer/jay.aware@hashicorp.com"
}
