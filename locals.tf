locals {
  region  = "eu-west-1"
  profile = "545510773253_AdministratorAccess"

  container_port  = 80
  container_name  = "toto"
  container_image = "nginx:latest"

  cluster_name = "tartempion"

  vpc_name            = "vpc-name"
  vpc_cidr            = "10.0.0.0/16"
  vpc_az              = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  vpc_private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  vpc_public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  sg_name = "ecs"

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name        = "ecs-fargate-public"
  }
}
