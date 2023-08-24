resource "aws_security_group" "ecs" {
  name        = local.sg_name
  description = "Allow traffic for ECS container."
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "TCP"
    description     = "Allow incoming request from Load Balancer"
    security_groups = [module.alb.security_group_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    description = "Permit all outgoing requests to the internet"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.tags
}
