output "id" {
  value = kubernetes_namespace_v1.this[*].id
}

output "metadata" {
  value = kubernetes_namespace_v1.this[*].metadata
}

output "wait_for_default_service_account" {
  value = kubernetes_namespace_v1.this[*].wait_for_default_service_account
}