resource aws_key_pair "platform_key_pair" {
  key_name   = "${var.service_name}-keypair"
  public_key = file("${path.module}/keys/platform.pub")
}
