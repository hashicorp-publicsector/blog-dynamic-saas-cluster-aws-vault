resource "aws_cloudwatch_event_rule" "tfer--AutoScalingManagedRule" {
  description    = "This rule is used to route Instance notifications to EC2 Auto Scaling"
  event_bus_name = "default"
  event_pattern  = "{\"detail-type\":[\"EC2 Instance Rebalance Recommendation\",\"EC2 Spot Instance Interruption Warning\"],\"source\":[\"aws.ec2\"]}"
  is_enabled     = "true"
  name           = "AutoScalingManagedRule"
}
