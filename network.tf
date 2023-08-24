module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.1"

  name = local.vpc_name
  cidr = local.vpc_cidr

  azs             = local.vpc_az
  private_subnets = local.vpc_private_subnets
  public_subnets  = local.vpc_public_subnets

  enable_nat_gateway = true
  enable_vpn_gateway = true
  create_igw         = true

  tags = local.tags
}
