resource "aws_alb" "bjss_load_balancer" {
  load_balancer_type = "application"
  name            = "BJSS-LoadBalancer"
  internal        = false
  security_groups = [aws_security_group.alb_security_group.id]

tags = {
    Name = "BJSS_load_balancer"
  }
  subnets = aws_subnet.public_subnet.*.id
}

resource "aws_alb_target_group" "albtg" {
	name	= "alb-front-http"
	vpc_id	= aws_vpc.vpc.id
	port	= "80"
	protocol	= "HTTP"
	health_check {
                path = "/"
                port = "80"
                protocol = "HTTP"
                healthy_threshold = 5
                unhealthy_threshold = 2
                interval = 5
                timeout = 4
                matcher = "200"
        } 
    tags = {
        Name = "alb_front_http_TF"
    }
}

resource "aws_alb_listener" "front_end" {
  load_balancer_arn = aws_alb.bjss_load_balancer.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.albtg.arn
  }

}
