resource "aws_autoscaling_group" "asg" {
  name                      = "${var.service_name}-apache-asg"
  min_size                  = 1
  max_size                  = 1
  desired_capacity          = 1
  launch_configuration      = aws_launch_configuration.launch_config.id
  health_check_grace_period = 300
  health_check_type         = "EC2"
  vpc_zone_identifier       = [aws_subnet.public_subnet.id]

  tag {
    key                 = "Name"
    value               = "${var.service_name}-apache"
    propagate_at_launch = true
  }
}
