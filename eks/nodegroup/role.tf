
resource "aws_iam_role" "eks_nodegroup_role" {
  name = "ng-eks-nodegroup-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

}

resource "aws_iam_policy_attachment" "eks_AmazonEKSWorkerNodePolicy" {
  name       = "eks_AmazonEKSWorkerNodePolicy"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  roles      = [aws_iam_role.eks_nodegroup_role.name]
}

resource "aws_iam_policy_attachment" "eks_AmazonEKSCNIPolicy" {
  name       = "eks_AmazonEKSCNIPolicy"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  roles      = [aws_iam_role.eks_nodegroup_role.name]
}

resource "aws_iam_policy_attachment" "eks_AmazonEC2ContainerRegistryReadOnly" {
  name       = "eks_AmazonEC2ContainerRegistryReadOnly"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  roles      = [aws_iam_role.eks_nodegroup_role.name]
}

resource "aws_iam_policy" "this" {
  name = "nodegroup-role-policy"
  path = "/"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ssm:GetParameter*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "service_account_policy_attach" {
  policy_arn = aws_iam_policy.this.arn
  role       = aws_iam_role.eks_nodegroup_role.name
}
