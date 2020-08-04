output "elastic_ip" {
  value = aws_eip.EIP.public_ip
}
output "vpc_id" {
  value = aws_vpc.vpc
}

output "alb_dns" {
  value = "${aws_alb.bjss_load_balancer.dns_name}"
}