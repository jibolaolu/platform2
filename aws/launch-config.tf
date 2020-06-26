resource "aws_launch_configuration" "launch_config" {
  name_prefix                 = "apache-config"
  image_id                    = "ami-01e6a0b85de033c" # Ubuntu 18.04 LTS. https://cloud-images.ubuntu.com/locator/ec2/
  instance_type               = "t2.micro"
  key_name                    = "${var.service_name}-keypair"
  user_data                   = file("${path.module}/scripts/bootstrap.sh")
  security_groups             = [aws_security_group.security_group.id]
  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = true
  }
}
