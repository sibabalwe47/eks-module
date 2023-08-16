variable "name" {
  type = string
}

variable "role_arn" {
  type = string
}

variable "eks_version" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}
