module "eks_cluster" {
  source      = "./cluster"
  name        = "plusonex"
  eks_version = "1.27"
  role_arn    = module.eks_role.eks_role_arn
  subnet_ids  = var.subnet_ids
}

module "eks_role" {
  source = "./iam"
  name   = "eks-dev-role"
}

module "configMap" {
  source          = "./config"
  configmap_roles = var.configmap_roles
  configmap_users = var.configmap_users
}

module "oidc_provider" {
  source                        = "./oidc"
  eks_cluster_identity_oidc_url = module.eks_cluster.eks_cluster_identity[0].oidc[0].issuer
}

module "nodegroup" {
  depends_on       = [module.oidc_provider]
  source           = "./nodegroup"
  eks_cluster_name = "plusonex"
  eks_version      = "1.27"
  public_subnets   = var.subnet_ids
}
