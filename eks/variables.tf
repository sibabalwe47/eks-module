variable "subnet_ids" {
  type = list(string)
}

variable "configmap_roles" {
  type = list(object({}))
}


variable "configmap_users" {
  type = list(object({}))
}

variable "namespaces" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}