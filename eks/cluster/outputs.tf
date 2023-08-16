output "eks_cluster_id" {
  value = aws_eks_cluster.this.id
}

output "eks_cluster_certificate_authority" {
  value = aws_eks_cluster.this.certificate_authority
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.this.endpoint
}

output "eks_cluster_identity" {
  value = aws_eks_cluster.this.identity
}

output "eks_cluster_role_arn" {
  value = aws_eks_cluster.this.role_arn
}

output "eks_cluster_name" {
  value = aws_eks_cluster.this.name
}
