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

  // VPC & subnets
  vpc_id = module.vpc.vpc_id 
  subnet_ids = module.vpc.vpc_public_subnets

  // Authorized roles and user
  configmap_roles = []
  configmap_users = []


  // Cluster namespaces
  namespaces = ["k8s", "argocd"]
}
