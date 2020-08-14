resource "aws_autoscaling_group" "asg" {
  name                      = "${var.service_name}-apache-asg"
  min_size                  = 2
  max_size                  = 2
  desired_capacity          = 2
  launch_configuration      = aws_launch_configuration.launch_config.name
  health_check_grace_period = 300
  health_check_type         = "ELB"
  vpc_zone_identifier       = aws_subnet.private_subnet.*.id
  target_group_arns         = [aws_alb_target_group.albtg.arn]

  tag {
    key                 = "Name"
    value               = var.service_name
    propagate_at_launch = true
  }
}

