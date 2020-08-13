output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "alb_dns" {
  value =  aws_alb.bjss_load_balancer.dns_name
}