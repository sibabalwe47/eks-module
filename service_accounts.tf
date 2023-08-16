# resource "kubernetes_service_account_v1" "auth_service" {
#   metadata {
#     name      = "auth-service"
#     namespace = "kube-system"
#     annotations = {
#       "eks.amazonaws.com/role-arn" = "${aws_iam_role.auth_service.arn}"
#     }
#   }
# }
