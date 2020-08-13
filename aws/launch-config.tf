resource "aws_launch_configuration" "launch_config" {
  name_prefix                 = "apache-config"
  image_id                    =  var.ami # Ubuntu 18.04 LTS. https://cloud-images.ubuntu.com/locator/ec2/
  instance_type               =  var.instance_type
  #key_name                    = "${var.service_name}-keypair"
  key_name                    = aws_key_pair.platform_key_pair.id
  user_data                   = file("${path.module}/scripts/bootstrap.sh")
  security_groups             = [aws_security_group.alb_security_group.id]
  associate_public_ip_address = true
  iam_instance_profile = aws_iam_instance_profile.bjss_ec2_profile.name

  lifecycle {
    create_before_destroy = true
  }
}
