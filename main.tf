module "vpc" {
  source   = "./vpc"
  vpc_cidr = "181.33.0.0/16"
  vpc_name = "eks"
  region   = "us-west-2"
  tags = {
    ConfigManagement = "Terraform"
    Owner            = "plusonex"
    Site             = "eks"
    Billing          = "Cloud Services"
    Environment      = "dev"
  }
}


module "eks" {
  source     = "./eks"
  subnet_ids = module.vpc.vpc_public_subnets

  configmap_roles = []
  configmap_users = []
}
