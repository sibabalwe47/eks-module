resource "aws_iam_role" "auth_service" {
  name = "auth-service"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRoleWithWebIdentity"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Federated = "${module.eks.aws_iam_openid_connect_provider_arn}"
        }
        Condition = {
          StringEquals = {
            "${module.eks.aws_iam_openid_connect_provider_extracted_arn}:aud" : "sts.amazonaws.com",
            "${module.eks.aws_iam_openid_connect_provider_extracted_arn}:sub" : "system:serviceaccount:kube-system:auth-service"
          }
        }
      },
    ]
  })
}

resource "aws_iam_policy" "this" {
  name = "auth-service-role-policy"
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
  role       = aws_iam_role.auth_service.name
}

