resource "aws_instance" "tfer--i-023e25e6ce7e85ca8_dynamic-policy-saas-nodegroup-Node" {
  ami                         = "ami-0af5eb518f7616978"
  associate_public_ip_address = "false"
  availability_zone           = "us-east-2b"

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  cpu_core_count       = "1"
  cpu_threads_per_core = "2"

  credit_specification {
    cpu_credits = "unlimited"
  }

  disable_api_stop        = "false"
  disable_api_termination = "false"

  ebs_block_device {
    delete_on_termination = "false"
    device_name           = "/dev/xvdba"
    encrypted             = "false"
    iops                  = "100"

    tags = {
      CSIVolumeName                               = "pvc-7cc307db-65a4-40f6-a8a9-70885e8a67f4"
      KubernetesCluster                           = "dynamic-policy-saas"
      Name                                        = "dynamic-policy-saas-dynamic-pvc-7cc307db-65a4-40f6-a8a9-70885e8a67f4"
      "ebs.csi.aws.com/cluster"                   = "true"
      "kubernetes.io/cluster/dynamic-policy-saas" = "owned"
      "kubernetes.io/created-for/pv/name"         = "pvc-7cc307db-65a4-40f6-a8a9-70885e8a67f4"
      "kubernetes.io/created-for/pvc/name"        = "data-vault-0"
      "kubernetes.io/created-for/pvc/namespace"   = "vault"
    }

    throughput  = "0"
    volume_size = "10"
    volume_type = "gp2"
  }

  ebs_optimized = "false"

  enclave_options {
    enabled = "false"
  }

  get_password_data                    = "false"
  hibernation                          = "false"
  iam_instance_profile                 = "eks-bcc2fbb0-5cc6-aa1f-af64-7baec72beb86"
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t3a.medium"
  ipv6_address_count                   = "0"

  launch_template {
    id      = "lt-0100c24d2395f20d4"
    name    = "eks-bcc2fbb0-5cc6-aa1f-af64-7baec72beb86"
    version = "1"
  }

  maintenance_options {
    auto_recovery = "default"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = "2"
    http_tokens                 = "optional"
    instance_metadata_tags      = "disabled"
  }

  monitoring                 = "false"
  placement_partition_number = "0"

  private_dns_name_options {
    enable_resource_name_dns_a_record    = "false"
    enable_resource_name_dns_aaaa_record = "false"
    hostname_type                        = "ip-name"
  }

  private_ip = "10.2.112.104"

  root_block_device {
    delete_on_termination = "true"
    encrypted             = "true"
    iops                  = "3000"
    kms_key_id            = "arn:aws:kms:us-east-2:591976937045:key/ce1c382e-c5f0-462d-8ea2-3de05cc5512d"

    tags = {
      Name                             = "dynamic-policy-saas-nodegroup-Node"
      "alpha.eksctl.io/nodegroup-name" = "nodegroup"
      "alpha.eksctl.io/nodegroup-type" = "managed"
      "eks:cluster-name"               = "dynamic-policy-saas"
      "eks:nodegroup-name"             = "nodegroup"
    }

    throughput  = "125"
    volume_size = "80"
    volume_type = "gp3"
  }

  secondary_private_ips = ["10.2.101.4", "10.2.112.245", "10.2.120.107", "10.2.126.2", "10.2.96.11"]
  source_dest_check     = "true"
  subnet_id             = "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-0c0b89179c3b96ab5_id}"

  tags = {
    Name                                            = "dynamic-policy-saas-nodegroup-Node"
    "alpha.eksctl.io/nodegroup-name"                = "nodegroup"
    "alpha.eksctl.io/nodegroup-type"                = "managed"
    "eks:cluster-name"                              = "dynamic-policy-saas"
    "eks:nodegroup-name"                            = "nodegroup"
    "k8s.io/cluster-autoscaler/dynamic-policy-saas" = "owned"
    "k8s.io/cluster-autoscaler/enabled"             = "true"
    "kubernetes.io/cluster/dynamic-policy-saas"     = "owned"
  }

  tags_all = {
    Name                                            = "dynamic-policy-saas-nodegroup-Node"
    "alpha.eksctl.io/nodegroup-name"                = "nodegroup"
    "alpha.eksctl.io/nodegroup-type"                = "managed"
    "eks:cluster-name"                              = "dynamic-policy-saas"
    "eks:nodegroup-name"                            = "nodegroup"
    "k8s.io/cluster-autoscaler/dynamic-policy-saas" = "owned"
    "k8s.io/cluster-autoscaler/enabled"             = "true"
    "kubernetes.io/cluster/dynamic-policy-saas"     = "owned"
  }

  tenancy                = "default"
  user_data_base64       = "TUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBlOiBtdWx0aXBhcnQvbWl4ZWQ7IGJvdW5kYXJ5PSIvLyIKCi0tLy8KQ29udGVudC1UeXBlOiB0ZXh0L3gtc2hlbGxzY3JpcHQ7IGNoYXJzZXQ9InVzLWFzY2lpIgojIS9iaW4vYmFzaApzZXQgLWV4CkI2NF9DTFVTVEVSX0NBPUxTMHRMUzFDUlVkSlRpQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENrMUpTVU12YWtORFFXVmhaMEYzU1VKQlowbENRVVJCVGtKbmEzRm9hMmxIT1hjd1FrRlJjMFpCUkVGV1RWSk5kMFZSV1VSV1VWRkVSWGR3Y21SWFNtd0tZMjAxYkdSSFZucE5RalJZUkZSSmVrMUVSWGxQUkVFelRrUm5NRTlXYjFoRVZFMTZUVVJGZVU1VVFUTk9SR2N3VDFadmQwWlVSVlJOUWtWSFFURlZSUXBCZUUxTFlUTldhVnBZU25WYVdGSnNZM3BEUTBGVFNYZEVVVmxLUzI5YVNXaDJZMDVCVVVWQ1FsRkJSR2RuUlZCQlJFTkRRVkZ2UTJkblJVSkJTbVJKQ2t4NVRIbFZlRkpOYTJweVR6aDNVVTA0UjBGdGVqWlNURWREUWtONlluVkJUV3BCU3k5a1NVcFlRbXBNTUU1UVFVRTJhR2hsWlVRM2FqQk1aSEZCUmtNS056UnFNM1J0VHpWSVYycHpiM2hCT1V4aVFXRlRRVFpIZFhaT1ZscHRLelpUWWpGSVVWbDBRbGRzZDFWaGFtTmFNbGd4TXpkRmJFWklURTVhTUVKc1dncFBjbk5IVTNKeUsyWjJNRVJCZVRCWlNFaExXa2R0Wldka1UwOWpSMVl5UlRsNmIwbHZjMHhFTXk5c2FTdG1lRXMxZEZoUVFuaHVOUzl0VURkM1NWUklDbVFyUjBKWGFFeDVlSFJUZWpOak5FbFFhemxIZWtjMFVUQnVjRnAxVUVoNFExZDFNV3BTWTFSS2NsTk1VSEZxZFdwMmIySnNhMjVhYUVSelF6ZE9XazBLVG01RE0wNXRTbWxIWWxSSFdVbGhRVXhoVEVZMGFuSlFZVU54WXpSeVRHSXlRM0YzYlZJelpVbGxXa1VyWTBFNE9WQk5TMDkzZWxZemRsUlNOV3BLV2dvdlFtOWpTSFJ3VWxsbFRUQjBOM0JuVTFaclEwRjNSVUZCWVU1YVRVWmpkMFJuV1VSV1VqQlFRVkZJTDBKQlVVUkJaMHRyVFVFNFIwRXhWV1JGZDBWQ0NpOTNVVVpOUVUxQ1FXWTRkMGhSV1VSV1VqQlBRa0paUlVaQ2VtVlNSRU13YlhGWWFGcDRabWRZVkc1VEwwRXJVV2RsUkROTlFsVkhRVEZWWkVWUlVVOEtUVUY1UTBOdGRERlpiVlo1WW0xV01GcFlUWGRFVVZsS1MyOWFTV2gyWTA1QlVVVk1RbEZCUkdkblJVSkJSalo2ZWpWU04zaDZSazFRTVdkNlRGbE1Td28zTTFORGFteE9iVmxKTWtvd2FVVmxObWh4UWpWRVIyZ3JPVWRJY0dSdlRWaDJWVEpWT0RGRFVVTkhhRVZaYVZadU5VNDBUbGhUV1VwVFduRklObTFUQ2s1VkwzQjFjVmw1TjFaVlFUSmFUVWRhUWt0TFJsYzBlbFIzTm1kVlpsSTRMMU16VEhZd09GaHJhekl6Y2xKd1EzTldWa1U1Tm1oMVQyMW5RWFpQY0ZRS2EzRldSVEEwYjBGM1dreE9WMGhOVWswM2NIRnZkVTlOYVZkSlZIbExMek5QV0RGbmQwb3ZaMFZoZVZrMFVXOVNUbEZwVVVoNmMzTnhWMHRKVTJaeVJncGFiakZxUjFaa1UwdzNWR040UW5Rd05XSXdkamRoVUdkeFpXdDRZV1phUlV0eVNsZzJjek01ZFZKYVJtMHdiM0ozWjFkbGRGaFpTM1J0VkVwTlQxcE9DbkU1ZGtZNVpYaEZZbEJCZDNKc1NuaDNSbmxSYVN0blV6bHFZMnhKYUZwVUswNWpWbTkxYVVSaVJXNUZSMGhqWVhCaVRHNUdhMGQwZWtoWVJVdERPRVlLTlhaM1BRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0KQVBJX1NFUlZFUl9VUkw9aHR0cHM6Ly9EQUNEODdFMjhERTE2Rjc5QjBEN0U5OEZCRTM5NDlDQS5ncjcudXMtZWFzdC0yLmVrcy5hbWF6b25hd3MuY29tCks4U19DTFVTVEVSX0ROU19JUD0xNzIuMjAuMC4xMAovZXRjL2Vrcy9ib290c3RyYXAuc2ggZHluYW1pYy1wb2xpY3ktc2FhcyAtLWt1YmVsZXQtZXh0cmEtYXJncyAnLS1ub2RlLWxhYmVscz1la3MuYW1hem9uYXdzLmNvbS9zb3VyY2VMYXVuY2hUZW1wbGF0ZVZlcnNpb249MSxhbHBoYS5la3NjdGwuaW8vY2x1c3Rlci1uYW1lPWR5bmFtaWMtcG9saWN5LXNhYXMsYWxwaGEuZWtzY3RsLmlvL25vZGVncm91cC1uYW1lPW5vZGVncm91cCxla3MuYW1hem9uYXdzLmNvbS9ub2RlZ3JvdXAtaW1hZ2U9YW1pLTBhZjVlYjUxOGY3NjE2OTc4LGVrcy5hbWF6b25hd3MuY29tL2NhcGFjaXR5VHlwZT1PTl9ERU1BTkQsZWtzLmFtYXpvbmF3cy5jb20vbm9kZWdyb3VwPW5vZGVncm91cCxla3MuYW1hem9uYXdzLmNvbS9zb3VyY2VMYXVuY2hUZW1wbGF0ZUlkPWx0LTAyZGM0Y2FmNjExNmM3NzQ0IC0tbWF4LXBvZHM9MTcnIC0tYjY0LWNsdXN0ZXItY2EgJEI2NF9DTFVTVEVSX0NBIC0tYXBpc2VydmVyLWVuZHBvaW50ICRBUElfU0VSVkVSX1VSTCAtLWRucy1jbHVzdGVyLWlwICRLOFNfQ0xVU1RFUl9ETlNfSVAgLS11c2UtbWF4LXBvZHMgZmFsc2UKCi0tLy8tLQ=="
  vpc_security_group_ids = ["${data.terraform_remote_state.sg.outputs.aws_security_group_tfer--eks-cluster-sg-dynamic-policy-saas-1549907501_sg-042cf2425dd6b9d0e_id}"]
}

resource "aws_instance" "tfer--i-0494ad4d4f5fb818b_dynamic-policy-saas-nodegroup-Node" {
  ami                         = "ami-0af5eb518f7616978"
  associate_public_ip_address = "false"
  availability_zone           = "us-east-2a"

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  cpu_core_count       = "1"
  cpu_threads_per_core = "2"

  credit_specification {
    cpu_credits = "unlimited"
  }

  disable_api_stop        = "false"
  disable_api_termination = "false"
  ebs_optimized           = "false"

  enclave_options {
    enabled = "false"
  }

  get_password_data                    = "false"
  hibernation                          = "false"
  iam_instance_profile                 = "eks-bcc2fbb0-5cc6-aa1f-af64-7baec72beb86"
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t3a.medium"
  ipv6_address_count                   = "0"

  launch_template {
    id      = "lt-0100c24d2395f20d4"
    name    = "eks-bcc2fbb0-5cc6-aa1f-af64-7baec72beb86"
    version = "1"
  }

  maintenance_options {
    auto_recovery = "default"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = "2"
    http_tokens                 = "optional"
    instance_metadata_tags      = "disabled"
  }

  monitoring                 = "false"
  placement_partition_number = "0"

  private_dns_name_options {
    enable_resource_name_dns_a_record    = "false"
    enable_resource_name_dns_aaaa_record = "false"
    hostname_type                        = "ip-name"
  }

  private_ip = "10.2.87.65"

  root_block_device {
    delete_on_termination = "true"
    encrypted             = "true"
    iops                  = "3000"
    kms_key_id            = "arn:aws:kms:us-east-2:591976937045:key/ce1c382e-c5f0-462d-8ea2-3de05cc5512d"

    tags = {
      Name                             = "dynamic-policy-saas-nodegroup-Node"
      "alpha.eksctl.io/nodegroup-name" = "nodegroup"
      "alpha.eksctl.io/nodegroup-type" = "managed"
      "eks:cluster-name"               = "dynamic-policy-saas"
      "eks:nodegroup-name"             = "nodegroup"
    }

    throughput  = "125"
    volume_size = "80"
    volume_type = "gp3"
  }

  secondary_private_ips = ["10.2.72.88", "10.2.73.208", "10.2.87.19", "10.2.88.103", "10.2.89.2"]
  source_dest_check     = "true"
  subnet_id             = "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-0c67377d6c70a419c_id}"

  tags = {
    Name                                            = "dynamic-policy-saas-nodegroup-Node"
    "alpha.eksctl.io/nodegroup-name"                = "nodegroup"
    "alpha.eksctl.io/nodegroup-type"                = "managed"
    "eks:cluster-name"                              = "dynamic-policy-saas"
    "eks:nodegroup-name"                            = "nodegroup"
    "k8s.io/cluster-autoscaler/dynamic-policy-saas" = "owned"
    "k8s.io/cluster-autoscaler/enabled"             = "true"
    "kubernetes.io/cluster/dynamic-policy-saas"     = "owned"
  }

  tags_all = {
    Name                                            = "dynamic-policy-saas-nodegroup-Node"
    "alpha.eksctl.io/nodegroup-name"                = "nodegroup"
    "alpha.eksctl.io/nodegroup-type"                = "managed"
    "eks:cluster-name"                              = "dynamic-policy-saas"
    "eks:nodegroup-name"                            = "nodegroup"
    "k8s.io/cluster-autoscaler/dynamic-policy-saas" = "owned"
    "k8s.io/cluster-autoscaler/enabled"             = "true"
    "kubernetes.io/cluster/dynamic-policy-saas"     = "owned"
  }

  tenancy                = "default"
  user_data_base64       = "TUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBlOiBtdWx0aXBhcnQvbWl4ZWQ7IGJvdW5kYXJ5PSIvLyIKCi0tLy8KQ29udGVudC1UeXBlOiB0ZXh0L3gtc2hlbGxzY3JpcHQ7IGNoYXJzZXQ9InVzLWFzY2lpIgojIS9iaW4vYmFzaApzZXQgLWV4CkI2NF9DTFVTVEVSX0NBPUxTMHRMUzFDUlVkSlRpQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENrMUpTVU12YWtORFFXVmhaMEYzU1VKQlowbENRVVJCVGtKbmEzRm9hMmxIT1hjd1FrRlJjMFpCUkVGV1RWSk5kMFZSV1VSV1VWRkVSWGR3Y21SWFNtd0tZMjAxYkdSSFZucE5RalJZUkZSSmVrMUVSWGxQUkVFelRrUm5NRTlXYjFoRVZFMTZUVVJGZVU1VVFUTk9SR2N3VDFadmQwWlVSVlJOUWtWSFFURlZSUXBCZUUxTFlUTldhVnBZU25WYVdGSnNZM3BEUTBGVFNYZEVVVmxLUzI5YVNXaDJZMDVCVVVWQ1FsRkJSR2RuUlZCQlJFTkRRVkZ2UTJkblJVSkJTbVJKQ2t4NVRIbFZlRkpOYTJweVR6aDNVVTA0UjBGdGVqWlNURWREUWtONlluVkJUV3BCU3k5a1NVcFlRbXBNTUU1UVFVRTJhR2hsWlVRM2FqQk1aSEZCUmtNS056UnFNM1J0VHpWSVYycHpiM2hCT1V4aVFXRlRRVFpIZFhaT1ZscHRLelpUWWpGSVVWbDBRbGRzZDFWaGFtTmFNbGd4TXpkRmJFWklURTVhTUVKc1dncFBjbk5IVTNKeUsyWjJNRVJCZVRCWlNFaExXa2R0Wldka1UwOWpSMVl5UlRsNmIwbHZjMHhFTXk5c2FTdG1lRXMxZEZoUVFuaHVOUzl0VURkM1NWUklDbVFyUjBKWGFFeDVlSFJUZWpOak5FbFFhemxIZWtjMFVUQnVjRnAxVUVoNFExZDFNV3BTWTFSS2NsTk1VSEZxZFdwMmIySnNhMjVhYUVSelF6ZE9XazBLVG01RE0wNXRTbWxIWWxSSFdVbGhRVXhoVEVZMGFuSlFZVU54WXpSeVRHSXlRM0YzYlZJelpVbGxXa1VyWTBFNE9WQk5TMDkzZWxZemRsUlNOV3BLV2dvdlFtOWpTSFJ3VWxsbFRUQjBOM0JuVTFaclEwRjNSVUZCWVU1YVRVWmpkMFJuV1VSV1VqQlFRVkZJTDBKQlVVUkJaMHRyVFVFNFIwRXhWV1JGZDBWQ0NpOTNVVVpOUVUxQ1FXWTRkMGhSV1VSV1VqQlBRa0paUlVaQ2VtVlNSRU13YlhGWWFGcDRabWRZVkc1VEwwRXJVV2RsUkROTlFsVkhRVEZWWkVWUlVVOEtUVUY1UTBOdGRERlpiVlo1WW0xV01GcFlUWGRFVVZsS1MyOWFTV2gyWTA1QlVVVk1RbEZCUkdkblJVSkJSalo2ZWpWU04zaDZSazFRTVdkNlRGbE1Td28zTTFORGFteE9iVmxKTWtvd2FVVmxObWh4UWpWRVIyZ3JPVWRJY0dSdlRWaDJWVEpWT0RGRFVVTkhhRVZaYVZadU5VNDBUbGhUV1VwVFduRklObTFUQ2s1VkwzQjFjVmw1TjFaVlFUSmFUVWRhUWt0TFJsYzBlbFIzTm1kVlpsSTRMMU16VEhZd09GaHJhekl6Y2xKd1EzTldWa1U1Tm1oMVQyMW5RWFpQY0ZRS2EzRldSVEEwYjBGM1dreE9WMGhOVWswM2NIRnZkVTlOYVZkSlZIbExMek5QV0RGbmQwb3ZaMFZoZVZrMFVXOVNUbEZwVVVoNmMzTnhWMHRKVTJaeVJncGFiakZxUjFaa1UwdzNWR040UW5Rd05XSXdkamRoVUdkeFpXdDRZV1phUlV0eVNsZzJjek01ZFZKYVJtMHdiM0ozWjFkbGRGaFpTM1J0VkVwTlQxcE9DbkU1ZGtZNVpYaEZZbEJCZDNKc1NuaDNSbmxSYVN0blV6bHFZMnhKYUZwVUswNWpWbTkxYVVSaVJXNUZSMGhqWVhCaVRHNUdhMGQwZWtoWVJVdERPRVlLTlhaM1BRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0KQVBJX1NFUlZFUl9VUkw9aHR0cHM6Ly9EQUNEODdFMjhERTE2Rjc5QjBEN0U5OEZCRTM5NDlDQS5ncjcudXMtZWFzdC0yLmVrcy5hbWF6b25hd3MuY29tCks4U19DTFVTVEVSX0ROU19JUD0xNzIuMjAuMC4xMAovZXRjL2Vrcy9ib290c3RyYXAuc2ggZHluYW1pYy1wb2xpY3ktc2FhcyAtLWt1YmVsZXQtZXh0cmEtYXJncyAnLS1ub2RlLWxhYmVscz1la3MuYW1hem9uYXdzLmNvbS9zb3VyY2VMYXVuY2hUZW1wbGF0ZVZlcnNpb249MSxhbHBoYS5la3NjdGwuaW8vY2x1c3Rlci1uYW1lPWR5bmFtaWMtcG9saWN5LXNhYXMsYWxwaGEuZWtzY3RsLmlvL25vZGVncm91cC1uYW1lPW5vZGVncm91cCxla3MuYW1hem9uYXdzLmNvbS9ub2RlZ3JvdXAtaW1hZ2U9YW1pLTBhZjVlYjUxOGY3NjE2OTc4LGVrcy5hbWF6b25hd3MuY29tL2NhcGFjaXR5VHlwZT1PTl9ERU1BTkQsZWtzLmFtYXpvbmF3cy5jb20vbm9kZWdyb3VwPW5vZGVncm91cCxla3MuYW1hem9uYXdzLmNvbS9zb3VyY2VMYXVuY2hUZW1wbGF0ZUlkPWx0LTAyZGM0Y2FmNjExNmM3NzQ0IC0tbWF4LXBvZHM9MTcnIC0tYjY0LWNsdXN0ZXItY2EgJEI2NF9DTFVTVEVSX0NBIC0tYXBpc2VydmVyLWVuZHBvaW50ICRBUElfU0VSVkVSX1VSTCAtLWRucy1jbHVzdGVyLWlwICRLOFNfQ0xVU1RFUl9ETlNfSVAgLS11c2UtbWF4LXBvZHMgZmFsc2UKCi0tLy8tLQ=="
  vpc_security_group_ids = ["${data.terraform_remote_state.sg.outputs.aws_security_group_tfer--eks-cluster-sg-dynamic-policy-saas-1549907501_sg-042cf2425dd6b9d0e_id}"]
}

resource "aws_instance" "tfer--i-0ce2e18fb31c47343_aws-cloud9-blogtest2-e8ab0a6f64114a0e9ed7cb75168ee110" {
  ami                         = "ami-03c8adb57c2ee4e89"
  associate_public_ip_address = "true"
  availability_zone           = "us-east-2a"

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  cpu_core_count       = "1"
  cpu_threads_per_core = "2"

  credit_specification {
    cpu_credits = "unlimited"
  }

  disable_api_stop        = "false"
  disable_api_termination = "false"
  ebs_optimized           = "false"

  enclave_options {
    enabled = "false"
  }

  get_password_data                    = "false"
  hibernation                          = "false"
  iam_instance_profile                 = "dynamic-policy-ref-arch-admin"
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t3.small"
  ipv6_address_count                   = "0"

  maintenance_options {
    auto_recovery = "default"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = "1"
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }

  monitoring                 = "false"
  placement_partition_number = "0"

  private_dns_name_options {
    enable_resource_name_dns_a_record    = "false"
    enable_resource_name_dns_aaaa_record = "false"
    hostname_type                        = "ip-name"
  }

  private_ip = "10.0.0.27"

  root_block_device {
    delete_on_termination = "true"
    encrypted             = "false"
    volume_size           = "10"
    volume_type           = "gp2"
  }

  source_dest_check = "true"
  subnet_id         = "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-0d873fbb6f8dcb783_id}"

  tags = {
    Name = "aws-cloud9-blogtest2-e8ab0a6f64114a0e9ed7cb75168ee110"
  }

  tags_all = {
    Name = "aws-cloud9-blogtest2-e8ab0a6f64114a0e9ed7cb75168ee110"
  }

  tenancy                = "default"
  user_data_base64       = "IyEvYmluL2Jhc2gKClVOSVhfVVNFUj0iZWMyLXVzZXIiClVOSVhfVVNFUl9IT01FPSIvaG9tZS9lYzItdXNlciIKRU5WSVJPTk1FTlRfUEFUSD0iL2hvbWUvZWMyLXVzZXIvZW52aXJvbm1lbnQiClVOSVhfR1JPVVA9JChpZCAtZyAtbiAiJFVOSVhfVVNFUiIpCgojIEFwcGx5IHNlY3VyaXR5IHBhdGNoZXMKT1BFUkFUSU5HX1NZU1RFTT0kKGF3ayAtRj0gJyQxPT0iSUQiIHsgcHJpbnQgJDIgO30nIC9ldGMvb3MtcmVsZWFzZSB8IHNlZCAtZSAncy9eIi8vJyAtZSAncy8iJC8vJykKaWYgWyAiJE9QRVJBVElOR19TWVNURU0iID09ICJhbXpuIiBdOyB0aGVuCiAgICB5dW0gLXEgLXkgdXBkYXRlIC0tc2VjdXJpdHkgPiAvdG1wL2luaXQteXVtLXVwZGF0ZS1zZWN1cml0eSAyPiYxICYKZWxpZiBbICIkT1BFUkFUSU5HX1NZU1RFTSIgPT0gInVidW50dSIgXTsgdGhlbgogICAgdW5hdHRlbmRlZC11cGdyYWRlICYKZmkKCiMgYWRkIFNTSCBrZXkKaW5zdGFsbCAtZyAiJFVOSVhfR1JPVVAiIC1vICIkVU5JWF9VU0VSIiAtbSA3NTUgLWQgIiRVTklYX1VTRVJfSE9NRSIvLnNzaApjYXQgPDwnRU9GJyA+PiAiJFVOSVhfVVNFUl9IT01FIi8uc3NoL2F1dGhvcml6ZWRfa2V5cwojIEltcG9ydGFudAojIC0tLS0tLS0tLQojIFRoZSBmb2xsb3dpbmcgcHVibGljIGtleSBpcyByZXF1aXJlZCBieSBDbG91ZDkgSURFCiMgUmVtb3ZpbmcgdGhpcyBrZXkgd2lsbCBtYWtlIHRoaXMgRUMyIGluc3RhbmNlIGluYWNjZXNzaWJsZSBieSB0aGUgSURFCiMKY2VydC1hdXRob3JpdHkgc3NoLXJzYSBBQUFBQjNOemFDMXljMkVBQUFBREFRQUJBQUFDQVFEUStZWThWYTlTUmh5QXF6b3k1NmY1YWRSY3FQRG1xQVV4aUs4RE80TmRpQ2RZRmRsQXFPNUhYNWd3RzlZUTRobXpXZ0JYa1duUzg5TjhpTFgvbFNxSU5kclJ0RFpCbEdjWDlZcjNXL283UlJOK09neSszYkhXamNCbGhiNjNtamhqUERpTlJ6TlUyZ2hjeG84VVVaNUlXblJKQTVJeXZuZkV1dWgzZTB1cEwxSXIvQS9UWjlKRFlONDI0bHFZQ0hWRU5tSnl0NFkyRUNkc0xlUU5wdzZRcFNNT2t6dnlPZ3AzMmpvYnU2bC9KdDBNU2pNOWVzbytWeGZVRU1jS1FyT2x2VXV2WXR1RjJDYS9RQjhkWXZsb1BVZCtJREE1cjJYWnJ2dS9XdnVPYnZnRlBPdTF3UmlBMXZibzFoakVGRUJZZkxjK3lnZWtBTDRNZjVvV0tKZXZQenB1aWFDc1BMTHBaZHFzNlc5NFo3MHFOY01rVEZSWncwOU5STHpvMEZlZ0tPWUxadThyNlBCQTJwUTVSQ3JXR0c5ZEpNZ0JjNXlPdXAwMGJyTVVMbDV5b0hjRWJ3clJ6aXBnZGR1dTBramFFWGNRbUIyeVRWM2QxZllDc2Y2KzRDdm5DanoxS2haQWZlclphbERHN2RWd3FaMDFneE9GdHgxUE9JSTZNcHh4SnRyZGkyNURqTE9vRUxqTlFTM2dndXRIRThhZ1JsaWJKUzlqdkRhY1NvRHlGaEgxR01TaGlOKzRrRVJ0RWRLL1BDaUQzeTVZdGJmVVRjSy9tVEtPUXJOOEUxai9TZU8vcVlBb0tCdmpPMUlTM2YyT2FNZEZSU2U3cVRrV2oxNUJKZ2Iya09TemR5T0hCTFJKWUF1WmdRVlFLNUQ5R2ZURi9wclRVUkpuY3c9PSBlOGFiMGE2ZjY0MTE0YTBlOWVkN2NiNzUxNjhlZTExMEBjbG91ZDkuYW1hem9uLmNvbQoKCiMKIyBBZGQgYW55IGFkZGl0aW9uYWwga2V5cyBiZWxvdyB0aGlzIGxpbmUKIwoKRU9GCgojIGFsbG93IGF1dG9tYXRpYyBzaHV0ZG93bgplY2hvICIkVU5JWF9VU0VSICAgIEFMTD0oQUxMKSBOT1BBU1NXRDogL3NiaW4vcG93ZXJvZmYsIC9zYmluL3JlYm9vdCwgL3NiaW4vc2h1dGRvd24iID4+IC9ldGMvc3Vkb2VycwoKbG4gLXMgL29wdC9jOSAiJFVOSVhfVVNFUl9IT01FIi8uYzkKY2hvd24gLVIgIiRVTklYX1VTRVIiOiIkVU5JWF9HUk9VUCIgIiRVTklYX1VTRVJfSE9NRSIvLmM5IC9vcHQvYzkKaW5zdGFsbCAtZyAiJFVOSVhfR1JPVVAiIC1vICIkVU5JWF9VU0VSIiAtbSA3NTUgLWQgIiRFTlZJUk9OTUVOVF9QQVRIIgoKaWYgWyAiJEVOVklST05NRU5UX1BBVEgiID09ICIvaG9tZS9lYzItdXNlci9lbnZpcm9ubWVudCIgXSAmJiBncmVwICJhbGlhcyBweXRob249cHl0aG9uMjciICIkVU5JWF9VU0VSX0hPTUUiLy5iYXNocmM7IHRoZW4KCiAgICBjYXQgPDwnRU9GJyA+ICIkVU5JWF9VU0VSX0hPTUUiLy5iYXNocmMKIyAuYmFzaHJjCgpleHBvcnQgUEFUSD0kUEFUSDokSE9NRS8ubG9jYWwvYmluOiRIT01FL2JpbgoKIyBsb2FkIG52bQpleHBvcnQgTlZNX0RJUj0iJEhPTUUvLm52bSIKWyAiJEJBU0hfVkVSU0lPTiIgXSAmJiBucG0oKSB7CiAgICAjIGhhY2s6IGF2b2lkIHNsb3cgbnBtIHNhbml0eSBjaGVjayBpbiBudm0KICAgIGlmIFsgIiQqIiA9PSAiY29uZmlnIGdldCBwcmVmaXgiIF07IHRoZW4gd2hpY2ggbm9kZSB8IHNlZCAicy9iaW5cL25vZGUvLyI7CiAgICBlbHNlICQod2hpY2ggbnBtKSAiJEAiOyBmaQp9CiMgWyAtcyAiJE5WTV9ESVIvbnZtLnNoIiBdICYmIC4gIiROVk1fRElSL252bS5zaCIgICMgVGhpcyBsb2FkcyBudm0KcnZtX3NpbGVuY2VfcGF0aF9taXNtYXRjaF9jaGVja19mbGFnPTEgIyBwcmV2ZW50IHJ2bSBjb21wbGFpbnRzIHRoYXQgbnZtIGlzIGZpcnN0IGluIFBBVEgKdW5zZXQgbnBtICMgZW5kIGhhY2sKCgojIFVzZXIgc3BlY2lmaWMgYWxpYXNlcyBhbmQgZnVuY3Rpb25zCmFsaWFzIHB5dGhvbj1weXRob24yNwoKIyBtb2RpZmljYXRpb25zIG5lZWRlZCBvbmx5IGluIGludGVyYWN0aXZlIG1vZGUKaWYgWyAiJFBTMSIgIT0gIiIgXTsgdGhlbgogICAgIyBTZXQgZGVmYXVsdCBlZGl0b3IgZm9yIGdpdAogICAgZ2l0IGNvbmZpZyAtLWdsb2JhbCBjb3JlLmVkaXRvciBuYW5vCgogICAgIyBUdXJuIG9uIGNoZWNrd2luc2l6ZQogICAgc2hvcHQgLXMgY2hlY2t3aW5zaXplCgogICAgIyBrZWVwIG1vcmUgaGlzdG9yeQogICAgc2hvcHQgLXMgaGlzdGFwcGVuZAogICAgZXhwb3J0IEhJU1RTSVpFPTEwMDAwMAogICAgZXhwb3J0IEhJU1RGSUxFU0laRT0xMDAwMDAKICAgIGV4cG9ydCBQUk9NUFRfQ09NTUFORD0iaGlzdG9yeSAtYTsiCgogICAgIyBTb3VyY2UgZm9yIEdpdCBQUzEgZnVuY3Rpb24KICAgIGlmICEgdHlwZSAtdCBfX2dpdF9wczEgJiYgWyAtZSAiL3Vzci9zaGFyZS9naXQtY29yZS9jb250cmliL2NvbXBsZXRpb24vZ2l0LXByb21wdC5zaCIgXTsgdGhlbgogICAgICAgIC4gL3Vzci9zaGFyZS9naXQtY29yZS9jb250cmliL2NvbXBsZXRpb24vZ2l0LXByb21wdC5zaAogICAgZmkKCiAgICAjIENsb3VkOSBkZWZhdWx0IHByb21wdAogICAgX2Nsb3VkOV9wcm9tcHRfdXNlcigpIHsKICAgICAgICBpZiBbICIkQzlfVVNFUiIgPSByb290IF07IHRoZW4KICAgICAgICAgICAgZWNobyAiJFVTRVIiCiAgICAgICAgZWxzZQogICAgICAgICAgICBlY2hvICIkQzlfVVNFUiIKICAgICAgICBmaQogICAgfQoKICAgIFBTMT0nXFtcMDMzWzAxOzMybVxdJChfY2xvdWQ5X3Byb21wdF91c2VyKVxbXDAzM1swMG1cXTpcW1wwMzNbMDE7MzRtXF1cd1xbXDAzM1swMG1cXSQoX19naXRfcHMxICIgKCVzKSIgMj4vZGV2L251bGwpICQgJwpmaQoKRU9GCgogICAgY2hvd24gIiRVTklYX1VTRVIiOiIkVU5JWF9HUk9VUCIgIiRVTklYX1VTRVJfSE9NRSIvLmJhc2hyYwpmaQoKaWYgWyAiJEVOVklST05NRU5UX1BBVEgiID09ICIvaG9tZS9lYzItdXNlci9lbnZpcm9ubWVudCIgXSAmJiBbICEgLWYgIiRFTlZJUk9OTUVOVF9QQVRIIi9SRUFETUUubWQgXTsgdGhlbgogICAgY2F0IDw8J0VPRicgPj4gIiRFTlZJUk9OTUVOVF9QQVRIIi9SRUFETUUubWQKICAgICAgICAgX19fICAgICAgICBfX19fX18gICAgIF9fX18gXyAgICAgICAgICAgICAgICAgXyAgX19fCiAgICAgICAgLyBcIFwgICAgICAvIC8gX19ffCAgIC8gX19ffCB8IF9fXyAgXyAgIF8gIF9ffCB8LyBfIFwKICAgICAgIC8gXyBcIFwgL1wgLyAvXF9fXyBcICB8IHwgICB8IHwvIF8gXHwgfCB8IHwvIF9gIHwgKF8pIHwKICAgICAgLyBfX18gXCBWICBWIC8gIF9fXykgfCB8IHxfX198IHwgKF8pIHwgfF98IHwgKF98IHxcX18sIHwKICAgICAvXy8gICBcX1xfL1xfLyAgfF9fX18vICAgXF9fX198X3xcX19fLyBcX18sX3xcX18sX3wgIC9fLwogLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCgpIaSB0aGVyZSEgV2VsY29tZSB0byBBV1MgQ2xvdWQ5IQoKVG8gZ2V0IHN0YXJ0ZWQsIGNyZWF0ZSBzb21lIGZpbGVzLCBwbGF5IHdpdGggdGhlIHRlcm1pbmFsLApvciB2aXNpdCBodHRwczovL2RvY3MuYXdzLmFtYXpvbi5jb20vY29uc29sZS9jbG91ZDkvIGZvciBvdXIgZG9jdW1lbnRhdGlvbi4KCkhhcHB5IGNvZGluZyEKCkVPRgoKICAgIGNob3duICIkVU5JWF9VU0VSIjoiJFVOSVhfR1JPVVAiICIkVU5JWF9VU0VSX0hPTUUiL2Vudmlyb25tZW50L1JFQURNRS5tZApmaQoKIyBGaXggZm9yIHBlcm1pc3Npb24gZXJyb3Igd2hlbiB0cnlpbmcgdG8gY2FsbCBgZ2VtIGluc3RhbGxgCmNob3duICIkVU5JWF9VU0VSIiAtUiAvdXNyL2xvY2FsL3J2bS9nZW1zCgojVGhpcyBzY3JpcHQgaXMgYXBwZW5kZWQgdG8gYW5vdGhlciBiYXNoIHNjcmlwdCwgc28gaXQgZG9lcyBub3QgbmVlZCBhIGJhc2ggc2NyaXB0IGZpbGUgaGVhZGVyLgoKVU5JWF9VU0VSX0hPTUU9Ii9ob21lL2VjMi11c2VyIgoKQzlfRElSPSRVTklYX1VTRVJfSE9NRS8uYzkKQ09ORklHX0ZJTEVfUEFUSD0iJEM5X0RJUiIvYXV0b3NodXRkb3duLWNvbmZpZ3VyYXRpb24KVkZTX0NIRUNLX0ZJTEVfUEFUSD0iJEM5X0RJUiIvc3RvcC1pZi1pbmFjdGl2ZS5zaAoKZWNobyAiU0hVVERPV05fVElNRU9VVD0zMCIgPiAiJENPTkZJR19GSUxFX1BBVEgiCmNobW9kIGErdyAiJENPTkZJR19GSUxFX1BBVEgiCgplY2hvIC1lICcjIS9iaW4vYmFzaApzZXQgLWV1byBwaXBlZmFpbApDT05GSUc9JChjYXQgJyRDT05GSUdfRklMRV9QQVRIJykKU0hVVERPV05fVElNRU9VVD0ke0NPTkZJRyMqPX0KaWYgISBbWyAkU0hVVERPV05fVElNRU9VVCA9fiBeWzAtOV0qJCBdXTsgdGhlbgogICAgZWNobyAic2h1dGRvd24gdGltZW91dCBpcyBpbnZhbGlkIgogICAgZXhpdCAxCmZpCmlzX3NodXR0aW5nX2Rvd24oKSB7CiAgICBpc19zaHV0dGluZ19kb3duX3VidW50dSAmPiAvZGV2L251bGwgfHwgaXNfc2h1dHRpbmdfZG93bl9hbDEgJj4gL2Rldi9udWxsIHx8IGlzX3NodXR0aW5nX2Rvd25fYWwyICY+IC9kZXYvbnVsbAp9CmlzX3NodXR0aW5nX2Rvd25fdWJ1bnR1KCkgewogICAgbG9jYWwgVElNRU9VVAogICAgVElNRU9VVD0kKGJ1c2N0bCBnZXQtcHJvcGVydHkgb3JnLmZyZWVkZXNrdG9wLmxvZ2luMSAvb3JnL2ZyZWVkZXNrdG9wL2xvZ2luMSBvcmcuZnJlZWRlc2t0b3AubG9naW4xLk1hbmFnZXIgU2NoZWR1bGVkU2h1dGRvd24pCiAgICBpZiBbICIkPyIgLW5lICIwIiBdOyB0aGVuCiAgICAgICAgcmV0dXJuIDEKICAgIGZpCiAgICBpZiBbICIkKGVjaG8gJFRJTUVPVVQgfCBhd2sgIntwcmludCBcJDN9IikiID09ICIwIiBdOyB0aGVuCiAgICAgICAgcmV0dXJuIDEKICAgIGVsc2UKICAgICAgICByZXR1cm4gMAogICAgZmkKfQppc19zaHV0dGluZ19kb3duX2FsMSgpIHsKICAgIHBncmVwIHNodXRkb3duCn0KaXNfc2h1dHRpbmdfZG93bl9hbDIoKSB7CiAgICBsb2NhbCBGSUxFCiAgICBGSUxFPS9ydW4vc3lzdGVtZC9zaHV0ZG93bi9zY2hlZHVsZWQKICAgIGlmIFtbIC1mICIkRklMRSIgXV07IHRoZW4KICAgICAgICByZXR1cm4gMAogICAgZWxzZQogICAgICAgIHJldHVybiAxCiAgICBmaQp9CmlzX3Zmc19jb25uZWN0ZWQoKSB7CiAgICBwZ3JlcCAtZiB2ZnMtd29ya2VyID4vZGV2L251bGwKfQoKaWYgaXNfc2h1dHRpbmdfZG93bjsgdGhlbgogICAgaWYgW1sgISAkU0hVVERPV05fVElNRU9VVCA9fiBeWzAtOV0rJCBdXSB8fCBpc192ZnNfY29ubmVjdGVkOyB0aGVuCiAgICAgICAgc3VkbyBzaHV0ZG93biAtYwogICAgZmkKZWxzZQogICAgaWYgW1sgJFNIVVRET1dOX1RJTUVPVVQgPX4gXlswLTldKyQgXV0gJiYgISBpc192ZnNfY29ubmVjdGVkOyB0aGVuCiAgICAgICAgc3VkbyBzaHV0ZG93biAtaCAkU0hVVERPV05fVElNRU9VVAogICAgZmkKZmknID4gIiRWRlNfQ0hFQ0tfRklMRV9QQVRIIgoKY2htb2QgK3ggIiRWRlNfQ0hFQ0tfRklMRV9QQVRIIgoKZWNobyAiKiAqICogKiAqIHJvb3QgJFZGU19DSEVDS19GSUxFX1BBVEgiID4gL2V0Yy9jcm9uLmQvYzktYXV0b21hdGljLXNodXRkb3duCg=="
  vpc_security_group_ids = ["${data.terraform_remote_state.sg.outputs.aws_security_group_tfer--aws-cloud9-blogtest2-e8ab0a6f64114a0e9ed7cb75168ee110-InstanceSecurityGroup-QJFMLTA1U9Z9_sg-058b688409d9a1e14_id}"]
}
