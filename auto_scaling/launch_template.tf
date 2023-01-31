resource "aws_launch_template" "tfer--eks-bcc2fbb0-5cc6-aa1f-af64-7baec72beb86" {
  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      encrypted   = "true"
      iops        = "3000"
      throughput  = "125"
      volume_size = "80"
      volume_type = "gp3"
    }
  }

  default_version         = "1"
  disable_api_stop        = "false"
  disable_api_termination = "false"

  iam_instance_profile {
    name = "eks-bcc2fbb0-5cc6-aa1f-af64-7baec72beb86"
  }

  image_id = "ami-0af5eb518f7616978"

  metadata_options {
    http_put_response_hop_limit = "2"
    http_tokens                 = "optional"
  }

  name = "eks-bcc2fbb0-5cc6-aa1f-af64-7baec72beb86"

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name                             = "dynamic-policy-saas-nodegroup-Node"
      "alpha.eksctl.io/nodegroup-name" = "nodegroup"
      "alpha.eksctl.io/nodegroup-type" = "managed"
      "eks:cluster-name"               = "dynamic-policy-saas"
      "eks:nodegroup-name"             = "nodegroup"
    }
  }

  tag_specifications {
    resource_type = "volume"

    tags = {
      Name                             = "dynamic-policy-saas-nodegroup-Node"
      "alpha.eksctl.io/nodegroup-name" = "nodegroup"
      "alpha.eksctl.io/nodegroup-type" = "managed"
      "eks:cluster-name"               = "dynamic-policy-saas"
      "eks:nodegroup-name"             = "nodegroup"
    }
  }

  tags = {
    "eks:cluster-name"   = "dynamic-policy-saas"
    "eks:nodegroup-name" = "nodegroup"
  }

  tags_all = {
    "eks:cluster-name"   = "dynamic-policy-saas"
    "eks:nodegroup-name" = "nodegroup"
  }

  user_data              = "TUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBlOiBtdWx0aXBhcnQvbWl4ZWQ7IGJvdW5kYXJ5PSIvLyIKCi0tLy8KQ29udGVudC1UeXBlOiB0ZXh0L3gtc2hlbGxzY3JpcHQ7IGNoYXJzZXQ9InVzLWFzY2lpIgojIS9iaW4vYmFzaApzZXQgLWV4CkI2NF9DTFVTVEVSX0NBPUxTMHRMUzFDUlVkSlRpQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENrMUpTVU12YWtORFFXVmhaMEYzU1VKQlowbENRVVJCVGtKbmEzRm9hMmxIT1hjd1FrRlJjMFpCUkVGV1RWSk5kMFZSV1VSV1VWRkVSWGR3Y21SWFNtd0tZMjAxYkdSSFZucE5RalJZUkZSSmVrMUVSWGxQUkVFelRrUm5NRTlXYjFoRVZFMTZUVVJGZVU1VVFUTk9SR2N3VDFadmQwWlVSVlJOUWtWSFFURlZSUXBCZUUxTFlUTldhVnBZU25WYVdGSnNZM3BEUTBGVFNYZEVVVmxLUzI5YVNXaDJZMDVCVVVWQ1FsRkJSR2RuUlZCQlJFTkRRVkZ2UTJkblJVSkJTbVJKQ2t4NVRIbFZlRkpOYTJweVR6aDNVVTA0UjBGdGVqWlNURWREUWtONlluVkJUV3BCU3k5a1NVcFlRbXBNTUU1UVFVRTJhR2hsWlVRM2FqQk1aSEZCUmtNS056UnFNM1J0VHpWSVYycHpiM2hCT1V4aVFXRlRRVFpIZFhaT1ZscHRLelpUWWpGSVVWbDBRbGRzZDFWaGFtTmFNbGd4TXpkRmJFWklURTVhTUVKc1dncFBjbk5IVTNKeUsyWjJNRVJCZVRCWlNFaExXa2R0Wldka1UwOWpSMVl5UlRsNmIwbHZjMHhFTXk5c2FTdG1lRXMxZEZoUVFuaHVOUzl0VURkM1NWUklDbVFyUjBKWGFFeDVlSFJUZWpOak5FbFFhemxIZWtjMFVUQnVjRnAxVUVoNFExZDFNV3BTWTFSS2NsTk1VSEZxZFdwMmIySnNhMjVhYUVSelF6ZE9XazBLVG01RE0wNXRTbWxIWWxSSFdVbGhRVXhoVEVZMGFuSlFZVU54WXpSeVRHSXlRM0YzYlZJelpVbGxXa1VyWTBFNE9WQk5TMDkzZWxZemRsUlNOV3BLV2dvdlFtOWpTSFJ3VWxsbFRUQjBOM0JuVTFaclEwRjNSVUZCWVU1YVRVWmpkMFJuV1VSV1VqQlFRVkZJTDBKQlVVUkJaMHRyVFVFNFIwRXhWV1JGZDBWQ0NpOTNVVVpOUVUxQ1FXWTRkMGhSV1VSV1VqQlBRa0paUlVaQ2VtVlNSRU13YlhGWWFGcDRabWRZVkc1VEwwRXJVV2RsUkROTlFsVkhRVEZWWkVWUlVVOEtUVUY1UTBOdGRERlpiVlo1WW0xV01GcFlUWGRFVVZsS1MyOWFTV2gyWTA1QlVVVk1RbEZCUkdkblJVSkJSalo2ZWpWU04zaDZSazFRTVdkNlRGbE1Td28zTTFORGFteE9iVmxKTWtvd2FVVmxObWh4UWpWRVIyZ3JPVWRJY0dSdlRWaDJWVEpWT0RGRFVVTkhhRVZaYVZadU5VNDBUbGhUV1VwVFduRklObTFUQ2s1VkwzQjFjVmw1TjFaVlFUSmFUVWRhUWt0TFJsYzBlbFIzTm1kVlpsSTRMMU16VEhZd09GaHJhekl6Y2xKd1EzTldWa1U1Tm1oMVQyMW5RWFpQY0ZRS2EzRldSVEEwYjBGM1dreE9WMGhOVWswM2NIRnZkVTlOYVZkSlZIbExMek5QV0RGbmQwb3ZaMFZoZVZrMFVXOVNUbEZwVVVoNmMzTnhWMHRKVTJaeVJncGFiakZxUjFaa1UwdzNWR040UW5Rd05XSXdkamRoVUdkeFpXdDRZV1phUlV0eVNsZzJjek01ZFZKYVJtMHdiM0ozWjFkbGRGaFpTM1J0VkVwTlQxcE9DbkU1ZGtZNVpYaEZZbEJCZDNKc1NuaDNSbmxSYVN0blV6bHFZMnhKYUZwVUswNWpWbTkxYVVSaVJXNUZSMGhqWVhCaVRHNUdhMGQwZWtoWVJVdERPRVlLTlhaM1BRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0KQVBJX1NFUlZFUl9VUkw9aHR0cHM6Ly9EQUNEODdFMjhERTE2Rjc5QjBEN0U5OEZCRTM5NDlDQS5ncjcudXMtZWFzdC0yLmVrcy5hbWF6b25hd3MuY29tCks4U19DTFVTVEVSX0ROU19JUD0xNzIuMjAuMC4xMAovZXRjL2Vrcy9ib290c3RyYXAuc2ggZHluYW1pYy1wb2xpY3ktc2FhcyAtLWt1YmVsZXQtZXh0cmEtYXJncyAnLS1ub2RlLWxhYmVscz1la3MuYW1hem9uYXdzLmNvbS9zb3VyY2VMYXVuY2hUZW1wbGF0ZVZlcnNpb249MSxhbHBoYS5la3NjdGwuaW8vY2x1c3Rlci1uYW1lPWR5bmFtaWMtcG9saWN5LXNhYXMsYWxwaGEuZWtzY3RsLmlvL25vZGVncm91cC1uYW1lPW5vZGVncm91cCxla3MuYW1hem9uYXdzLmNvbS9ub2RlZ3JvdXAtaW1hZ2U9YW1pLTBhZjVlYjUxOGY3NjE2OTc4LGVrcy5hbWF6b25hd3MuY29tL2NhcGFjaXR5VHlwZT1PTl9ERU1BTkQsZWtzLmFtYXpvbmF3cy5jb20vbm9kZWdyb3VwPW5vZGVncm91cCxla3MuYW1hem9uYXdzLmNvbS9zb3VyY2VMYXVuY2hUZW1wbGF0ZUlkPWx0LTAyZGM0Y2FmNjExNmM3NzQ0IC0tbWF4LXBvZHM9MTcnIC0tYjY0LWNsdXN0ZXItY2EgJEI2NF9DTFVTVEVSX0NBIC0tYXBpc2VydmVyLWVuZHBvaW50ICRBUElfU0VSVkVSX1VSTCAtLWRucy1jbHVzdGVyLWlwICRLOFNfQ0xVU1RFUl9ETlNfSVAgLS11c2UtbWF4LXBvZHMgZmFsc2UKCi0tLy8tLQ=="
  vpc_security_group_ids = ["sg-042cf2425dd6b9d0e"]
}

resource "aws_launch_template" "tfer--eksctl-dynamic-policy-saas-nodegroup-nodegroup" {
  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      encrypted   = "true"
      iops        = "3000"
      throughput  = "125"
      volume_size = "80"
      volume_type = "gp3"
    }
  }

  default_version         = "1"
  disable_api_stop        = "false"
  disable_api_termination = "false"

  metadata_options {
    http_put_response_hop_limit = "2"
    http_tokens                 = "optional"
  }

  name = "eksctl-dynamic-policy-saas-nodegroup-nodegroup"

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name                             = "dynamic-policy-saas-nodegroup-Node"
      "alpha.eksctl.io/nodegroup-name" = "nodegroup"
      "alpha.eksctl.io/nodegroup-type" = "managed"
    }
  }

  tag_specifications {
    resource_type = "network-interface"

    tags = {
      Name                             = "dynamic-policy-saas-nodegroup-Node"
      "alpha.eksctl.io/nodegroup-name" = "nodegroup"
      "alpha.eksctl.io/nodegroup-type" = "managed"
    }
  }

  tag_specifications {
    resource_type = "volume"

    tags = {
      Name                             = "dynamic-policy-saas-nodegroup-Node"
      "alpha.eksctl.io/nodegroup-name" = "nodegroup"
      "alpha.eksctl.io/nodegroup-type" = "managed"
    }
  }

  vpc_security_group_ids = ["sg-042cf2425dd6b9d0e"]
}
