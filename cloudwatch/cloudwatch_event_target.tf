resource "aws_cloudwatch_event_target" "tfer--AutoScalingManagedRule-002F-autoscaling" {
  arn       = "arn:aws:autoscaling:us-east-2:::"
  rule      = "AutoScalingManagedRule"
  target_id = "autoscaling"
}
