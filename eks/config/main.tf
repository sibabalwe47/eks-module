resource "kubernetes_config_map_v1" "aws_auth" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }
  data = {
    mapRoles = yamlencode([
      {
        rolearn  = "arn:aws:iam::386613981817:role/ng-eks-nodegroup-role"
        username = "system:node:{{EC2PrivateDNSName}}"
        groups   = ["system:bootstrappers", "system:nodes", "system:masters"]

      }
    ])
    mapUsers = yamlencode([{
      userarn  = "arn:aws:iam::386613981817:user/Sibabalwe"
      username = "Sibabalwe"
      groups   = ["system:masters"]
    }])
  }
}
