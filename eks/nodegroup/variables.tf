
variable "eks_cluster_name" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "eks_version" {
  type = string
}
