resource "aws_autoscaling_group" "my_asg1" {
  vpc_zone_identifier = var.vpc_zone_identifier
  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  min_size           = var.min_size
  target_group_arns  = var.target_group_arns
  launch_template {
    id      = var.launch_template
    version = "$Latest"
  }
}