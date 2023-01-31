resource "aws_vpc_peering_connection" "tfer--pcx-0a4b5a82f9e30d23f" {
  accepter {
    allow_classic_link_to_remote_vpc = "false"
    allow_remote_vpc_dns_resolution  = "true"
    allow_vpc_to_remote_classic_link = "false"
  }

  peer_owner_id = "591976937045"
  peer_region   = "us-east-2"
  peer_vpc_id   = "vpc-0138d6dfeec6e6c66"

  requester {
    allow_classic_link_to_remote_vpc = "false"
    allow_remote_vpc_dns_resolution  = "true"
    allow_vpc_to_remote_classic_link = "false"
  }

  vpc_id = "vpc-05969b8cc3a694ea2"
}
