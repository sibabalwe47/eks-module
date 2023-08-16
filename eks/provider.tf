
data "aws_eks_cluster" "this" {
  depends_on = [module.eks_cluster]
  name       = module.eks_cluster.eks_cluster_id
}

data "aws_eks_cluster_auth" "this" {
  depends_on = [module.eks_cluster]
  name       = module.eks_cluster.eks_cluster_id
}

provider "kubernetes" {
  host                   = module.eks_cluster.eks_cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks_cluster.eks_cluster_certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.this.token
}
