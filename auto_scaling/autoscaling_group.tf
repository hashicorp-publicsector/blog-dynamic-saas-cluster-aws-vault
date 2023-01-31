resource "aws_autoscaling_group" "tfer--eks-nodegroup-bcc2fbb0-5cc6-aa1f-af64-7baec72beb86" {
  availability_zones        = ["us-east-2a", "us-east-2b"]
  capacity_rebalance        = "true"
  default_cooldown          = "300"
  default_instance_warmup   = "0"
  desired_capacity          = "2"
  force_delete              = "false"
  health_check_grace_period = "15"
  health_check_type         = "EC2"
  max_instance_lifetime     = "0"
  max_size                  = "2"
  metrics_granularity       = "1Minute"
  min_size                  = "2"

  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy            = "prioritized"
      on_demand_base_capacity                  = "0"
      on_demand_percentage_above_base_capacity = "100"
      spot_allocation_strategy                 = "lowest-price"
      spot_instance_pools                      = "2"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0100c24d2395f20d4"
        launch_template_name = "eks-bcc2fbb0-5cc6-aa1f-af64-7baec72beb86"
        version              = "1"
      }

      override {
        instance_type = "t3.medium"
      }

      override {
        instance_type = "t3a.medium"
      }
    }
  }

  name                    = "eks-nodegroup-bcc2fbb0-5cc6-aa1f-af64-7baec72beb86"
  protect_from_scale_in   = "false"
  service_linked_role_arn = "arn:aws:iam::591976937045:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"

  tag {
    key                 = "eks:cluster-name"
    propagate_at_launch = "true"
    value               = "dynamic-policy-saas"
  }

  tag {
    key                 = "eks:nodegroup-name"
    propagate_at_launch = "true"
    value               = "nodegroup"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/dynamic-policy-saas"
    propagate_at_launch = "true"
    value               = "owned"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = "true"
    value               = "true"
  }

  tag {
    key                 = "kubernetes.io/cluster/dynamic-policy-saas"
    propagate_at_launch = "true"
    value               = "owned"
  }

  termination_policies      = ["AllocationStrategy", "OldestInstance", "OldestLaunchTemplate"]
  vpc_zone_identifier       = ["${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-0c0b89179c3b96ab5_id}", "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-0c67377d6c70a419c_id}"]
  wait_for_capacity_timeout = "10m"
}
