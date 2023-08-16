variable "configmap_roles" {
  type = list(object({}))
}


variable "configmap_users" {
  default = [{
    userarn  = "arn:aws:iam::374890768992:root"
    username = "admin"
    groups   = ["system:masters"]
  }]
  type = list(object({}))
}
