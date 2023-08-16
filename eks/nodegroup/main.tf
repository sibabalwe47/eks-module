
resource "aws_eks_node_group" "public_eks_cluster_nodegroup" {
  cluster_name    = var.eks_cluster_name
  node_group_name = "${var.eks_cluster_name}-eks-ng-public"
  node_role_arn   = aws_iam_role.eks_nodegroup_role.arn
  subnet_ids      = var.public_subnets
  version         = var.eks_version
  ami_type        = "AL2_x86_64"
  capacity_type   = "ON_DEMAND"
  disk_size       = 20
  instance_types  = ["t3.medium"]

  #   remote_access {
  #     ec2_ssh_key = var.instance_keypair
  #   }

  scaling_config {
    desired_size = 1
    min_size     = 1
    max_size     = 1

  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_policy_attachment.eks_AmazonEC2ContainerRegistryReadOnly,
    aws_iam_policy_attachment.eks_AmazonEKSCNIPolicy,
    aws_iam_policy_attachment.eks_AmazonEKSWorkerNodePolicy,
  ]

  #   tags = merge(var.common_tags, {
  #     Name = "public-node-group"
  #   })

}
